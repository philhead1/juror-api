package uk.gov.hmcts.juror.api.moj.service.summonsmanagement;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uk.gov.hmcts.juror.api.config.bureau.BureauJwtPayload;
import uk.gov.hmcts.juror.api.moj.controller.request.JurorPaperResponseDto;
import uk.gov.hmcts.juror.api.moj.controller.request.JurorPersonalDetailsDto;
import uk.gov.hmcts.juror.api.moj.domain.JurorPool;
import uk.gov.hmcts.juror.api.moj.domain.jurorresponse.AbstractJurorResponse;
import uk.gov.hmcts.juror.api.moj.domain.jurorresponse.DigitalResponse;
import uk.gov.hmcts.juror.api.moj.domain.jurorresponse.PaperResponse;
import uk.gov.hmcts.juror.api.moj.enumeration.ReplyMethod;
import uk.gov.hmcts.juror.api.moj.repository.JurorPoolRepository;
import uk.gov.hmcts.juror.api.moj.repository.PoolRequestRepository;
import uk.gov.hmcts.juror.api.moj.repository.jurorresponse.JurorDigitalResponseRepositoryMod;
import uk.gov.hmcts.juror.api.moj.repository.jurorresponse.JurorPaperResponseRepositoryMod;
import uk.gov.hmcts.juror.api.moj.service.StraightThroughProcessorService;
import uk.gov.hmcts.juror.api.moj.utils.JurorPoolUtils;

import java.time.LocalDate;

import static uk.gov.hmcts.juror.api.moj.utils.DataUtils.getJurorDigitalResponse;
import static uk.gov.hmcts.juror.api.moj.utils.DataUtils.getJurorPaperResponse;
import static uk.gov.hmcts.juror.api.moj.utils.DataUtils.hasValueChanged;

@Slf4j
@Service
@RequiredArgsConstructor(onConstructor_ = {@Autowired})
public class JurorResponseServiceImpl implements JurorResponseService {

    @NonNull
    private final PoolRequestRepository poolRequestRepository;

    @NonNull
    private final JurorPoolRepository jurorPoolRepository;

    @NonNull
    private final JurorPaperResponseRepositoryMod jurorPaperResponseRepository;

    @NonNull
    private JurorDigitalResponseRepositoryMod jurorDigitalResponseRepository;

    @NonNull
    private final StraightThroughProcessorService straightThroughProcessorService;

    @Override
    @Transactional
    public void updateJurorPersonalDetails(BureauJwtPayload payload, JurorPersonalDetailsDto jurorPersonalDetailsDto,
                                           String jurorNumber) {
        log.info(String.format("Juror: %s. Start updating %s response personal details by user %s", jurorNumber,
            jurorPersonalDetailsDto.getReplyMethod().getDescription(), payload.getLogin()));

        //Check if the current user has access to the Juror record
        JurorPool jurorPool = JurorPoolUtils.getActiveJurorPoolForUser(jurorPoolRepository, jurorNumber,
            payload.getOwner());
        JurorPoolUtils.checkOwnershipForCurrentUser(jurorPool, payload.getOwner());

        AbstractJurorResponse jurorResponse = null;

        //Get the existing juror response for the appropriate reply method and map to the pojo
        if (jurorPersonalDetailsDto.getReplyMethod().equals(ReplyMethod.PAPER)) {
            jurorResponse = getJurorPaperResponse(jurorNumber, jurorPaperResponseRepository);
        } else if (jurorPersonalDetailsDto.getReplyMethod().equals(ReplyMethod.DIGITAL)) {
            jurorResponse = getJurorDigitalResponse(jurorNumber, jurorDigitalResponseRepository);
        }

        //If changes to personal data detected, update the juror response
        if (hasSummonsReplyDataChanged(jurorResponse, jurorPersonalDetailsDto)) {
            if (jurorResponse instanceof PaperResponse) {
                jurorPaperResponseRepository.save((PaperResponse) jurorResponse);
            } else if (jurorPersonalDetailsDto.getReplyMethod().equals(ReplyMethod.DIGITAL)) {
                jurorDigitalResponseRepository.save((DigitalResponse) jurorResponse);
            }
            log.debug(String.format("Juror: %s. Finished updating %s response personal details", jurorNumber,
                jurorResponse.getReplyType().getDescription().toLowerCase()));
        } else {
            log.debug(String.format("Juror: %s. No changes identified to %s response personal details ", jurorNumber,
                jurorResponse.getReplyType().getDescription().toLowerCase()));
        }

        //Straight through processing
        processStraightThroughResponse(jurorResponse, jurorPool, payload);
    }


    private boolean hasSummonsReplyDataChanged(AbstractJurorResponse jurorResponse,
                                               JurorPersonalDetailsDto jurorPersonalDetailsDto) {
        final String jurorNumber = jurorResponse.getJurorNumber();

        //Create a copy of the transient juror response pojo as will require it later to check if personal details
        // have been updated
        AbstractJurorResponse originalJurorResponse = null;
        if (jurorResponse instanceof DigitalResponse) {
            originalJurorResponse = new DigitalResponse();

        } else if (jurorResponse instanceof PaperResponse) {
            originalJurorResponse = new PaperResponse();
        }

        assert originalJurorResponse != null;
        BeanUtils.copyProperties(jurorResponse, originalJurorResponse);

        checkUpdatesToJurorPersonalDetails(jurorResponse, jurorPersonalDetailsDto, jurorNumber);
        checkUpdatesToJurorAddress(jurorResponse, jurorPersonalDetailsDto, jurorNumber);
        checkUpdatesToJurorContactDetails(jurorResponse, jurorPersonalDetailsDto, jurorNumber);
        checkUpdatesToJurorThirdParty(jurorResponse, jurorPersonalDetailsDto, jurorNumber);

        return !jurorResponse.equals(originalJurorResponse);
    }

    private void checkUpdatesToJurorPersonalDetails(AbstractJurorResponse jurorResponse,
                                                    JurorPersonalDetailsDto jurorPersonalDetailsDto,
                                                    String jurorNumber) {
        String replyMethod = jurorResponse.getReplyType().getDescription();

        //For the time being only checking DATE_OF_BIRTH (for updates to digital reply)
        if (hasValueChanged(jurorResponse.getDateOfBirth(), jurorPersonalDetailsDto.getDateOfBirth(),
            DATE_OF_BIRTH, jurorNumber, replyMethod)) {
            jurorResponse.setDateOfBirth(jurorPersonalDetailsDto.getDateOfBirth());
        }

        //TODO: PERSONAL UPDATES FOR DIGITAL
        if (jurorResponse.getReplyType().getType().equals(ReplyMethod.PAPER.getDescription())) {
            if (hasValueChanged(jurorResponse.getTitle(), jurorPersonalDetailsDto.getTitle(), TITLE,
                jurorNumber, replyMethod)) {
                jurorResponse.setTitle(jurorPersonalDetailsDto.getTitle());
            }

            if (hasValueChanged(jurorResponse.getFirstName(), jurorPersonalDetailsDto.getFirstName(),
                FIRSTNAME, jurorNumber, replyMethod)) {
                jurorResponse.setFirstName(jurorPersonalDetailsDto.getFirstName());
            }

            if (hasValueChanged(jurorResponse.getLastName(), jurorPersonalDetailsDto.getLastName(),
                LASTNAME, jurorNumber, replyMethod)) {
                jurorResponse.setLastName(jurorPersonalDetailsDto.getLastName());
            }
        }
    }

    private void checkUpdatesToJurorAddress(AbstractJurorResponse jurorResponse,
                                            JurorPersonalDetailsDto jurorPersonalDetailsDto, String jurorNumber) {
        String replyMethod = jurorResponse.getReplyType().getDescription();

        //TODO: ADDRESS UPDATES FOR DIGITAL
        if (jurorResponse.getReplyType().getType().equals(ReplyMethod.PAPER.getDescription())) {
            if (hasValueChanged(jurorResponse.getAddressLine1(), jurorPersonalDetailsDto.getAddressLineOne(),
                ADDRESS_LINE1, jurorNumber, replyMethod)) {
                jurorResponse.setAddressLine1(jurorPersonalDetailsDto.getAddressLineOne());
            }

            if (hasValueChanged(jurorResponse.getAddressLine2(), jurorPersonalDetailsDto.getAddressLineTwo(),
                ADDRESS_LINE2, jurorNumber, replyMethod)) {
                jurorResponse.setAddressLine2(jurorPersonalDetailsDto.getAddressLineTwo());
            }

            if (hasValueChanged(jurorResponse.getAddressLine3(),
                jurorPersonalDetailsDto.getAddressLineThree(), ADDRESS_LINE3, jurorNumber, replyMethod)) {
                jurorResponse.setAddressLine3(jurorPersonalDetailsDto.getAddressLineThree());
            }

            if (hasValueChanged(jurorResponse.getAddressLine4(), jurorPersonalDetailsDto.getAddressTown(),
                ADDRESS_LINE4, jurorNumber, replyMethod)) {
                jurorResponse.setAddressLine4(jurorPersonalDetailsDto.getAddressTown());
            }

            if (hasValueChanged(jurorResponse.getAddressLine5(), jurorPersonalDetailsDto.getAddressCounty(),
                ADDRESS_LINE5, jurorNumber, replyMethod)) {
                jurorResponse.setAddressLine5(jurorPersonalDetailsDto.getAddressCounty());
            }

            if (hasValueChanged(jurorResponse.getPostcode(),
                jurorPersonalDetailsDto.getAddressPostcode(), POSTCODE, jurorNumber, replyMethod)) {
                jurorResponse.setPostcode(jurorPersonalDetailsDto.getAddressPostcode());
            }
        }
    }

    private void checkUpdatesToJurorContactDetails(AbstractJurorResponse jurorResponse,
                                                   JurorPersonalDetailsDto jurorPersonalDetailsDto,
                                                   String jurorNumber) {
        String replyMethod = jurorResponse.getReplyType().getDescription();

        //TODO: CONTACT DETAILS UPDATES FOR DIGITAL
        if (jurorResponse.getReplyType().getType().equals(ReplyMethod.PAPER.getDescription())) {
            if (hasValueChanged(jurorResponse.getEmail(), jurorPersonalDetailsDto.getEmailAddress(),
                EMAIL_ADDRESS, jurorNumber, replyMethod)) {
                jurorResponse.setEmail(jurorPersonalDetailsDto.getEmailAddress());
            }

            if (hasValueChanged(jurorResponse.getPhoneNumber(),
                jurorPersonalDetailsDto.getPrimaryPhone(), PRIMARY_PHONE, jurorNumber, replyMethod)) {
                jurorResponse.setPhoneNumber(jurorPersonalDetailsDto.getPrimaryPhone());
            }

            if (hasValueChanged(jurorResponse.getAltPhoneNumber(),
                jurorPersonalDetailsDto.getSecondaryPhone(), SECONDARY_PHONE, jurorNumber, replyMethod)) {
                jurorResponse.setAltPhoneNumber(jurorPersonalDetailsDto.getSecondaryPhone());
            }
        }
    }

    private void checkUpdatesToJurorThirdParty(AbstractJurorResponse jurorResponse,
                                               JurorPersonalDetailsDto jurorPersonalDetailsDto, String jurorNumber) {
        String replyMethod = jurorResponse.getReplyType().getDescription();

        //TODO: THIRD PARTY UPDATES FOR DIGITAL
        if (jurorResponse.getReplyType().getType().equals(ReplyMethod.PAPER.getDescription())) {
            JurorPaperResponseDto.ThirdParty thirdParty = jurorPersonalDetailsDto.getThirdParty();
            if (thirdParty != null) {

                if (hasValueChanged(jurorResponse.getRelationship(), thirdParty.getRelationship(),
                    THIRD_PARTY_RELATIONSHIP, jurorNumber, replyMethod)) {
                    jurorResponse.setRelationship(thirdParty.getRelationship());
                }

                if (hasValueChanged(jurorResponse.getThirdPartyReason(),
                    thirdParty.getThirdPartyReason(), THIRD_PARTY_REASON, jurorNumber, replyMethod)) {
                    jurorResponse.setThirdPartyReason(thirdParty.getThirdPartyReason());
                }
            }
        }
    }

    private void processStraightThroughResponse(AbstractJurorResponse jurorResponse,
        JurorPool jurorPool, BureauJwtPayload payload) {
        log.debug(String.format("Juror: %s. Enter juror processStraightThroughResponse", jurorPool.getJurorNumber()));
        LocalDate poolRequestReturnDate = jurorPool.getPool().getReturnDate();

        if (jurorResponse.getDateOfBirth() != null && (poolRequestReturnDate != null)) {
            if (jurorResponse.getReplyType().getType().equals(ReplyMethod.PAPER.getDescription())) {
                PaperResponse paperResponse = (PaperResponse) jurorResponse;
                if (straightThroughProcessorService.isValidForStraightThroughAgeDisqualification(paperResponse,
                    poolRequestReturnDate,
                    jurorPool)) {
                    straightThroughProcessorService.processAgeDisqualification(paperResponse, poolRequestReturnDate,
                        jurorPool, payload);
                }
            } else if (jurorResponse.getReplyType().getType().equals(ReplyMethod.DIGITAL.getDescription())) {
                DigitalResponse jurorDigitalResponse = (DigitalResponse) jurorResponse;

                if (straightThroughProcessorService.isValidForStraightThroughAgeDisqualification(jurorDigitalResponse,
                    poolRequestReturnDate, jurorPool)) {
                    straightThroughProcessorService.processAgeDisqualification(jurorDigitalResponse, jurorPool,
                        payload);
                }
            }
        }
        log.debug(String.format("Juror: %s. Exit juror processStraightThroughResponse", jurorPool.getJurorNumber()));
    }
}
