package uk.gov.hmcts.juror.api.bureau.controller.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Schema(description = "Summary returning most important fields of relative to juror response")
public class BureauResponseSummaryDto {
    @Schema(description = "Juror number")
    private String jurorNumber;
    @Schema(description = "Juror title")
    private String title;
    @Schema(description = "Juror firstname")
    private String firstName;
    @Schema(description = "Juror lastname")
    private String lastName;
    @Schema(description = "Juror postcode")
    private String postcode;
    @Schema(description = "Name of court assigned to juror")
    private String courtName;
    @Schema(description = "Response processing status")
    private String courtCode;
    @Schema(description = "court code")
    private String processingStatus;
    @Schema(description = "Juror residency")
    private Boolean residency;
    @Schema(description = "Mental Health Act option selected")
    private Boolean mentalHealthAct;
    @Schema(description = "Bail option selected")
    private Boolean bail;
    @Schema(description = "Conviction option selected")
    private Boolean convictions;
    @Schema(description = "Reason about deferring jury duties")
    private String deferralDate;
    @Schema(description = "Details about jury duty excusal")
    private String excusalReason;
    @Schema(description = "Juror pool number")
    private String poolNumber;
    @Schema(description = "Response flagged as urgent")
    private Boolean urgent;
    @Schema(description = "Response flagged as super urgent")
    private Boolean superUrgent;
    @Schema(description = "SLA is expired")
    private Boolean slaOverdue;
    @Schema(description = "Response received date")
    private LocalDate dateReceived;
    @Schema(description = "Assigned staff member")
    private StaffDto assignedStaffMember;
    @Schema(description = "Optimistic locking version.", requiredMode = Schema.RequiredMode.REQUIRED)
    private Integer version;
    @Schema(description = "The time that processing was completed at")
    private LocalDateTime completedAt;

}
