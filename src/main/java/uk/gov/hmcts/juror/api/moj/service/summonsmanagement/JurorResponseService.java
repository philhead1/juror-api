package uk.gov.hmcts.juror.api.moj.service.summonsmanagement;

import org.springframework.transaction.annotation.Transactional;
import uk.gov.hmcts.juror.api.config.bureau.BureauJWTPayload;
import uk.gov.hmcts.juror.api.juror.controller.request.JurorResponseDto;
import uk.gov.hmcts.juror.api.juror.controller.response.JurorDetailDto;
import uk.gov.hmcts.juror.api.moj.controller.request.JurorPersonalDetailsDto;
import uk.gov.hmcts.juror.api.moj.domain.jurorresponse.DigitalResponse;

public interface JurorResponseService {
    String TITLE = "title";
    String FIRSTNAME = "first name";
    String LASTNAME = "last name";
    String PRIMARY_PHONE = "primary phone";
    String SECONDARY_PHONE = "secondary phone";
    String EMAIL_ADDRESS = "email address";
    String ADDRESS_LINE1 = "address line 1";
    String ADDRESS_LINE2 = "address line 2";
    String ADDRESS_LINE3 = "address line 3";
    String ADDRESS_LINE4 = "address line 4";
    String ADDRESS_LINE5 = "address line 5";
    String POSTCODE = "postcode";
    String DATE_OF_BIRTH = "date of birth";
    String THIRD_PARTY_RELATIONSHIP = "third party relationship";
    String THIRD_PARTY_REASON = "third party reason";
    String RESIDENCY = "residency";
    String BAIL = "bail";
    String EXCUSAL = "excusal";
    String DEFERRAL = "deferral";

    void updateJurorPersonalDetails(BureauJWTPayload payload, JurorPersonalDetailsDto jurorPersonalDetailsDto,
                                    String jurorNumber);





}
