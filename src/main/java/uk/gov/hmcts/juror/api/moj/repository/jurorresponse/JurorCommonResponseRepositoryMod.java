package uk.gov.hmcts.juror.api.moj.repository.jurorresponse;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import uk.gov.hmcts.juror.api.juror.domain.ProcessingStatus;
import uk.gov.hmcts.juror.api.moj.domain.jurorresponse.AbstractJurorResponse;

import java.time.LocalDateTime;
import java.util.Set;

@Repository
@Transactional(readOnly = true)
public interface JurorCommonResponseRepositoryMod
    extends JurorResponseRepositoryMod<JurorCommonResponseRepositoryMod.AbstractResponse>,
    IJurorCommonResponseRepositoryMod {

    Set<ProcessingStatus> PENDING_STATUS = Set.of(
        ProcessingStatus.AWAITING_CONTACT,
        ProcessingStatus.AWAITING_TRANSLATION,
        ProcessingStatus.AWAITING_COURT_REPLY
    );
    Set<ProcessingStatus> TODO_STATUS = Set.of(
        ProcessingStatus.TODO
    );

    Set<ProcessingStatus> COMPLETE_STATUS = Set.of(
        ProcessingStatus.CLOSED
    );

    @Entity
    @AllArgsConstructor
    @SuperBuilder
    @Getter
    @Setter
    @Table(name = "juror_response", schema = "juror_mod")
    @EqualsAndHashCode(callSuper = true)
    class AbstractResponse extends AbstractJurorResponse {

    }

    long countByStaffUsernameEqualsAndProcessingStatusIn(String username, Set<ProcessingStatus> status);

    long countByProcessingStatusIn(Set<ProcessingStatus> status);

    long countByStaffUsernameEqualsAndProcessingStatusInAndCompletedAtIsBetween(String username,
                                                                                Set<ProcessingStatus> status,
                                                                                LocalDateTime fromDate,
                                                                                LocalDateTime toDate
    );


    default long countTodo(String username) {
        return countByStaffUsernameEqualsAndProcessingStatusIn(username, TODO_STATUS);
    }


    default long countPending(String username) {
        return countByStaffUsernameEqualsAndProcessingStatusIn(username, PENDING_STATUS);
    }

    default long countComplete(String username) {
        return countByStaffUsernameEqualsAndProcessingStatusIn(username, COMPLETE_STATUS);
    }

    default long countComplete(String username, LocalDateTime from, LocalDateTime to) {
        return countByStaffUsernameEqualsAndProcessingStatusInAndCompletedAtIsBetween(
            username,
            COMPLETE_STATUS,
            from,
            to);
    }
}
