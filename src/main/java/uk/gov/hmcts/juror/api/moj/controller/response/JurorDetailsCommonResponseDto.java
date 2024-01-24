package uk.gov.hmcts.juror.api.moj.controller.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import uk.gov.hmcts.juror.api.bureau.controller.ResponseExcusalController;
import uk.gov.hmcts.juror.api.bureau.service.ResponseExcusalService;
import uk.gov.hmcts.juror.api.moj.domain.Juror;
import uk.gov.hmcts.juror.api.moj.domain.JurorPool;
import uk.gov.hmcts.juror.api.moj.domain.JurorStatus;
import uk.gov.hmcts.juror.api.moj.domain.PoliceCheck;
import uk.gov.hmcts.juror.api.moj.repository.JurorStatusRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Response DTO for Juror common details on the Juror record.
 */
@Getter
@Setter
@NoArgsConstructor
@Schema(description = "Juror detail common information for the Juror Record")
public class JurorDetailsCommonResponseDto {


    @Schema(name = "Owner", description = "Current owner")
    private String owner;

    @Length(max = 10)
    @Schema(description = "Juror title")
    private String title;// optional field

    @NotNull
    @Length(max = 20)
    @Schema(description = "Juror first name", requiredMode = Schema.RequiredMode.REQUIRED)
    private String firstName;

    @NotNull
    @Length(max = 20)
    @Schema(description = "Juror last name", requiredMode = Schema.RequiredMode.REQUIRED)
    private String lastName;

    @NotNull
    @JsonProperty("jurorNumber")
    @Schema(name = "Juror number", description = "Jurors Number")
    private String jurorNumber;

    @NotNull
    @JsonProperty("jurorStatus")
    @Schema(name = "Juror Status", description = "Jurors status")
    private String jurorStatus;

    @NotNull
    @JsonProperty("poolNumber")
    @Schema(name = "Pool number", description = "The Pool number Juror belongs to")
    private String poolNumber;

    @NotNull
    @JsonFormat(pattern = "yyyy-MM-dd")
    @JsonProperty("startDate")
    @Schema(name = "Start Date", description = "Service Start Date")
    private LocalDate startDate;

    @NotNull
    @JsonProperty("courtName")
    @Schema(name = "Court name", description = "Name of court Juror will attend")
    private String courtName;

    @JsonProperty("excusalRejected")
    @Schema(name = "Excusal Rejected flag", description = "Flag to indicate if an excusal was rejected for juror")
    private String excusalRejected;

    @JsonProperty("excusalCode")
    @Schema(name = "Excusal Code", description = "Excusal code indicating reason selected by the user")
    private String excusalCode;

    @JsonProperty("excusalDescription")
    @Schema(name = "Excusal description", description = "Description of excusal code", example = "Student")
    private String excusalDescription;

    @JsonProperty("deferredTo")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Schema(name = "Deferred to date", description = "The date that the juror was deferred to")
    private LocalDate deferredTo;

    @JsonProperty("noDeferrals")
    @Schema(name = "Number of deferrals", description = "No. Deferrals")
    private Integer noDeferrals;

    @JsonProperty("deferralDate")
    @Schema(name = "Deferral date", description = "Deferral date")
    private LocalDate deferralDate;

    @JsonProperty("policeCheck")
    @Schema(name = "Police Check Status")
    private String policeCheck;


    @Length(max = 10)
    @Schema(description = "Pending Title")
    private String pendingTitle;

    @Length(max = 20)
    @Schema(description = "Pending First Name", required = true)
    private String pendingFirstName;

    @Length(max = 20)
    @Schema(description = "Pending Last Name", required = true)
    private String pendingLastName;

    /**
     * Initialise an instance of this DTO class using a JurorPool object to populate its properties.
     *
     * @param jurorPool an object representation of a JurorPool association record
     */
    @Autowired
    public JurorDetailsCommonResponseDto(JurorPool jurorPool,
                                         JurorStatusRepository jurorStatusRepository,
                                         ResponseExcusalService responseExcusalService) {
        Juror juror = jurorPool.getJuror();

        this.owner = jurorPool.getOwner();
        this.title = juror.getTitle();
        this.firstName = juror.getFirstName();
        this.lastName = juror.getLastName();
        this.jurorNumber = juror.getJurorNumber();
        this.excusalRejected = juror.getExcusalRejected();
        this.excusalCode = juror.getExcusalCode();
        this.noDeferrals = juror.getNoDefPos();

        this.poolNumber = jurorPool.getPoolNumber();
        this.startDate = jurorPool.getReturnDate();
        this.deferralDate = jurorPool.getDeferralDate();
        this.deferredTo = jurorPool.getDeferralDate() != null ? jurorPool.getDeferralDate() : null;
        this.courtName = jurorPool.getCourt().getLocCourtName();

        if (this.excusalCode != null) {
            List<ResponseExcusalController.ExcusalCodeDto> excusalCodeDtoList =
                responseExcusalService.getExcusalReasons();

            Optional<ResponseExcusalController.ExcusalCodeDto> excusalCodeReasonOpt = excusalCodeDtoList.stream()
                .filter(code -> code.getExcusalCode().equals(this.excusalCode)).findFirst();

            this.excusalDescription =
                excusalCodeReasonOpt.map(ResponseExcusalController.ExcusalCodeDto::getDescription).orElse(null);
        }

        if (jurorPool.getCourt() != null) {
            this.courtName = jurorPool.getCourt().getLocCourtName();
        }

        Optional<JurorStatus> jurorStatusOpt = jurorStatusRepository.findById(jurorPool.getStatus().getStatus());
        jurorStatusOpt.ifPresent(status -> this.jurorStatus = status.getStatusDesc());

        this.policeCheck = PoliceCheck.getDescription(juror.getPoliceCheck());
        setPendingNameChange(juror);
    }

    private void setPendingNameChange(Juror juror) {
        if (juror != null) {
            this.pendingTitle = juror.getPendingTitle();
            this.pendingFirstName = juror.getPendingFirstName();
            this.pendingLastName = juror.getPendingLastName();
        }
    }
}
