package uk.gov.hmcts.juror.api.moj.domain;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.hibernate.envers.AuditOverride;
import org.hibernate.envers.Audited;
import org.hibernate.envers.NotAudited;
import org.hibernate.validator.constraints.Length;
import org.springframework.cglib.core.Local;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Set;

import static uk.gov.hmcts.juror.api.validation.ValidationConstants.JUROR_NUMBER;
import static uk.gov.hmcts.juror.api.validation.ValidationConstants.NO_PIPES_REGEX;

@Entity
@Table(name = "juror", schema = "juror_mod")
@NoArgsConstructor
@Getter
@Setter
@Audited
@AllArgsConstructor
@SuperBuilder
@AuditOverride(forClass = Address.class, isAudited = true)
@EqualsAndHashCode(callSuper = true, exclude = {"associatedPools"})
public class Juror extends Address implements Serializable {

    @Id
    @NotBlank
    @Column(name = "juror_number")
    @Pattern(regexp = JUROR_NUMBER)
    @Length(max = 9)
    private String jurorNumber;

    @Column(name = "poll_number")
    @Length(max = 5)
    @NotAudited
    private String pollNumber;

    @Column(name = "title")
    @Length(max = 10)
    @Pattern(regexp = NO_PIPES_REGEX)
    private String title;

    @Column(name = "first_name")
    @Length(max = 20)
    @Pattern(regexp = NO_PIPES_REGEX)
    @NotBlank
    private String firstName;

    @Column(name = "last_name")
    @Length(max = 20)
    @Pattern(regexp = NO_PIPES_REGEX)
    @NotBlank
    private String lastName;

    @Column(name = "dob")
    private LocalDate dateOfBirth;

    @Column(name = "h_phone")
    @Length(max = 15)
    private String phoneNumber;

    @Column(name = "w_phone")
    @Length(max = 15)
    private String workPhone;

    @Column(name = "w_ph_local")
    @Length(max = 4)
    private String workPhoneExtension;

    @NotNull
    @NotAudited
    @Column(name = "responded")
    private boolean responded;

    @NotAudited
    @Column(name = "date_excused")
    private LocalDate excusalDate;

    @NotAudited
    @Length(max = 1)
    @Column(name = "excusal_code")
    private String excusalCode;

    @NotAudited
    @Column(name = "acc_exc")
    private String excusalRejected;

    @NotAudited
    @Column(name = "date_disq")
    private LocalDate disqualifyDate;

    @NotAudited
    @Length(max = 1)
    @Column(name = "disq_code")
    private String disqualifyCode;

    @NotAudited
    @Column(name = "user_edtq")
    @Length(max = 20)
    private String userEdtq;

    @NotAudited
    @Length(max = 2000)
    @Column(name = "notes")
    private String notes;

    @NotAudited
    @Column(name = "no_def_pos")
    private Integer noDefPos;

    @NotAudited
    @Column(name = "perm_disqual")
    private Boolean permanentlyDisqualify;

    @NotAudited
    @Length(max = 1)
    @Column(name = "reasonable_adj_code")
    private String reasonableAdjustmentCode;

    @NotAudited
    @Length(max = 60)
    @Column(name = "reasonable_adj_msg")
    private String reasonableAdjustmentMessage;

    @NotAudited
    @Length(max = 20)
    @Column(name = "smart_card")
    private String smartCard;

    @NotAudited
    @Column(name = "completion_date")
    private LocalDate completionDate;

    @Column(name = "sort_code")
    @Length(max = 6)
    private String sortCode;

    @Column(name = "bank_acct_name")
    @Length(max = 18)
    private String bankAccountName;

    @Column(name = "bank_acct_no")
    @Length(max = 8)
    private String bankAccountNumber;

    @Column(name = "bldg_soc_roll_no")
    @Length(max = 18)
    private String buildingSocietyRollNumber;

    @NotAudited
    @Column(name = "welsh")
    private Boolean welsh;

    @NotAudited
    @Column(name = "police_check")
    @Enumerated(EnumType.STRING)
    private PoliceCheck policeCheck;

    @NotAudited
    @Length(max = 20)
    @Column(name = "summons_file")
    private String summonsFile;

    @Column(name = "m_phone")
    @Length(max = 15)
    private String altPhoneNumber;

    @Length(max = 254)
    @Column(name = "h_email")
    private String email;

    @NotAudited
    @Column(name = "contact_preference")
    private Integer contactPreference;

    @NotAudited
    @Column(name = "notifications")
    private int notifications;

    @NotAudited
    @LastModifiedDate
    @Column(name = "last_update")
    private LocalDateTime lastUpdate;

    @NotAudited
    @CreatedDate
    @Column(name = "date_created", updatable = false)
    private LocalDateTime dateCreated;

    @NotAudited
    @Column(name = "optic_reference")
    @Length(max = 8)
    private String opticRef;

    @Column(name = "pending_title")
    @Length(max = 10)
    @Pattern(regexp = NO_PIPES_REGEX)
    private String pendingTitle;

    @Column(name = "pending_first_name")
    @Length(max = 20)
    @Pattern(regexp = NO_PIPES_REGEX)
    private String pendingFirstName;

    @Column(name = "pending_last_name")
    @Length(max = 20)
    @Pattern(regexp = NO_PIPES_REGEX)
    private String pendingLastName;

    @Column(name = "amount_spent", precision = 8)
    @NotAudited
    private BigDecimal amountSpent;

    @Column(name = "travel_time", precision = 5)
    @NotAudited
    private LocalTime travelTime;

    @Column(name = "financial_loss", precision = 8)
    @NotAudited
    private BigDecimal financialLoss;

    @Column(name = "mileage")
    @NotAudited
    private Integer mileage;

    @Column(name = "bureau_transfer_date")
    @NotAudited
    private LocalDate bureauTransferDate;

    @NotAudited
    @OneToMany(mappedBy = "juror", cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
    private Set<JurorPool> associatedPools;

    @PrePersist
    private void prePersist() {
        dateCreated = LocalDateTime.now();
        preUpdate();
    }

    @PreUpdate
    private void preUpdate() {
        lastUpdate = LocalDateTime.now();
    }
}
