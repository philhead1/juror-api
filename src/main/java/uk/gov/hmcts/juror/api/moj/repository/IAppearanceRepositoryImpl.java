package uk.gov.hmcts.juror.api.moj.repository;

import com.querydsl.core.Tuple;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.validation.constraints.NotNull;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.query.AuditEntity;
import uk.gov.hmcts.juror.api.juror.domain.QCourtLocation;
import uk.gov.hmcts.juror.api.moj.controller.request.expense.UnpaidExpenseSummaryRequestDto;
import uk.gov.hmcts.juror.api.moj.controller.request.jurormanagement.RetrieveAttendanceDetailsDto;
import uk.gov.hmcts.juror.api.moj.controller.response.JurorAppearanceResponseDto;
import uk.gov.hmcts.juror.api.moj.controller.response.expense.UnpaidExpenseSummaryResponseDto;
import uk.gov.hmcts.juror.api.moj.domain.Appearance;
import uk.gov.hmcts.juror.api.moj.domain.IJurorStatus;
import uk.gov.hmcts.juror.api.moj.domain.JurorPool;
import uk.gov.hmcts.juror.api.moj.domain.PaginatedList;
import uk.gov.hmcts.juror.api.moj.domain.PoliceCheck;
import uk.gov.hmcts.juror.api.moj.domain.QAppearance;
import uk.gov.hmcts.juror.api.moj.domain.QJuror;
import uk.gov.hmcts.juror.api.moj.domain.QJurorPool;
import uk.gov.hmcts.juror.api.moj.domain.QPoolRequest;
import uk.gov.hmcts.juror.api.moj.domain.SortMethod;
import uk.gov.hmcts.juror.api.moj.domain.trial.QPanel;
import uk.gov.hmcts.juror.api.moj.enumeration.AppearanceStage;
import uk.gov.hmcts.juror.api.moj.enumeration.AttendanceType;
import uk.gov.hmcts.juror.api.moj.enumeration.jurormanagement.JurorStatusGroup;
import uk.gov.hmcts.juror.api.moj.enumeration.jurormanagement.RetrieveAttendanceDetailsTag;
import uk.gov.hmcts.juror.api.moj.enumeration.trial.PanelResult;
import uk.gov.hmcts.juror.api.moj.utils.PaginationUtil;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * Custom Repository implementation for the Appearance entity.
 */
@Slf4j
@SuppressWarnings("PMD.TooManyMethods")
public class IAppearanceRepositoryImpl implements IAppearanceRepository {
    @PersistenceContext
    EntityManager entityManager;

    private static final QJurorPool JUROR_POOL = QJurorPool.jurorPool;
    private static final QPoolRequest POOL = QPoolRequest.poolRequest;
    private static final QJuror JUROR = QJuror.juror;
    private static final QAppearance APPEARANCE = QAppearance.appearance;
    private static final QPanel PANEL = QPanel.panel;
    private static final QCourtLocation COURT_LOCATION = QCourtLocation.courtLocation;

    @Override
    public List<JurorAppearanceResponseDto.JurorAppearanceResponseData> getAppearanceRecords(
        String locCode, LocalDate date, String jurorNumber, JurorStatusGroup group) {

        List<Integer> jurorStatuses = group.getStatusList();
        JPAQuery<Tuple> query = sqlFetchAppearanceRecords(locCode, date, jurorStatuses);

        // check if we need to just return one juror's record
        if (jurorNumber != null) {
            query = query.where(APPEARANCE.jurorNumber.eq(jurorNumber));
        }

        List<Tuple> tuples = sqlOrderQueryResults(query);

        return buildJurorAppearanceResponseData(tuples);
    }

    @Override
    public List<Tuple> retrieveAttendanceDetails(RetrieveAttendanceDetailsDto request) {
        final RetrieveAttendanceDetailsDto.CommonData commonData = request.getCommonData();

        // depending on what is to be updated, filter the query based on juror status
        List<Integer> jurorStatuses = sqlFilterQueryJurorStatus(commonData.getTag());

        // start building the query
        JPAQuery<Tuple> query = sqlFetchAppearanceRecords(commonData.getLocationCode(), commonData.getAttendanceDate(),
            jurorStatuses);

        if (commonData.getTag().equals(RetrieveAttendanceDetailsTag.JUROR_NUMBER)) {
            query = query.where(APPEARANCE.jurorNumber.in(request.getJuror()));
        } else if (commonData.getTag().equals(RetrieveAttendanceDetailsTag.NOT_CHECKED_OUT)
            || commonData.getTag().equals(RetrieveAttendanceDetailsTag.PANELLED)) {
            query = query.where(APPEARANCE.appearanceStage.eq(AppearanceStage.CHECKED_IN));
        } else if (commonData.getTag().equals(RetrieveAttendanceDetailsTag.CONFIRM_ATTENDANCE)) {
            // a confirmed juror can have appStage of CheckedIn or CheckedOut therefore cannot rely on appStage. A
            // confirmed juror will always have TimeIn.
            query = query.where(APPEARANCE.timeIn.isNotNull());
        }

        // execute the query and return the results
        return sqlOrderQueryResults(query);
    }

    @Override
    public List<Tuple> retrieveNonAttendanceDetails(RetrieveAttendanceDetailsDto.CommonData commonData) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);

        return queryFactory.select(JUROR.jurorNumber.as("juror_number"),
                JUROR.firstName.as("first_name"),
                JUROR.lastName.as("last_name"),
                JUROR_POOL.status.status.as("status"),
                JUROR_POOL.pool.poolNumber.as("pool_number"))
            .from(JUROR)
            .join(JUROR_POOL)
            .on(JUROR.jurorNumber.eq(JUROR_POOL.juror.jurorNumber))
            .where(JUROR_POOL.owner.eq(commonData.getLocationCode()))
            .where(JUROR_POOL.nextDate.eq(commonData.getAttendanceDate()))
            .where(JUROR_POOL.status.status.eq(IJurorStatus.RESPONDED))
            .where(JUROR.jurorNumber.notIn(
                JPAExpressions.select(APPEARANCE.jurorNumber)
                    .from(APPEARANCE)
                    .where(APPEARANCE.courtLocation.locCode.eq(commonData.getLocationCode()))
                    .where(APPEARANCE.attendanceDate.eq(commonData.getAttendanceDate())))
            )
            .orderBy(JUROR.jurorNumber.asc()).fetch();
    }

    private List<Integer> sqlFilterQueryJurorStatus(@NotNull RetrieveAttendanceDetailsTag tag) {
        if (tag.equals(RetrieveAttendanceDetailsTag.CONFIRM_ATTENDANCE)) {
            return List.of(IJurorStatus.RESPONDED, IJurorStatus.PANEL);
        } else if (tag.equals(RetrieveAttendanceDetailsTag.PANELLED)) {
            return List.of(IJurorStatus.PANEL);
        } else {
            return Arrays.asList(IJurorStatus.RESPONDED, IJurorStatus.PANEL, IJurorStatus.JUROR);
        }
    }

    private JPAQuery<Tuple> sqlFetchAppearanceRecords(String locCode, LocalDate date, List<Integer> jurorStatuses) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);

        return queryFactory.select(
                JUROR.jurorNumber.as("juror_number"),
                JUROR.firstName.as("first_name"),
                JUROR.lastName.as("last_name"),
                JUROR_POOL.status.status.as("status"),
                APPEARANCE.timeIn.as("time_in"),
                APPEARANCE.timeOut.as("time_out"),
                APPEARANCE.noShow.as("no_show"),
                APPEARANCE.appearanceStage.as("app_stage"),
                JUROR.policeCheck.as("police_check")
            )
            .from(JUROR)
            .join(JUROR_POOL)
            .on(JUROR.jurorNumber.eq(JUROR_POOL.juror.jurorNumber))
            .join(APPEARANCE)
            .on(JUROR.jurorNumber.eq(APPEARANCE.jurorNumber)
                .and(APPEARANCE.courtLocation.eq(JUROR_POOL.pool.courtLocation)))
            .where(APPEARANCE.courtLocation.locCode.eq(locCode))
            .where(APPEARANCE.attendanceDate.eq(date))
            .where(JUROR_POOL.status.status.in(jurorStatuses))
            .where(JUROR_POOL.isActive.isTrue());
    }

    private List<Tuple> sqlOrderQueryResults(JPAQuery<Tuple> query) {
        return query.orderBy(APPEARANCE.jurorNumber.asc()).fetch();
    }

    private List<JurorAppearanceResponseDto.JurorAppearanceResponseData> buildJurorAppearanceResponseData(
        List<Tuple> tuples) {

        List<JurorAppearanceResponseDto.JurorAppearanceResponseData> appearanceDataList = new ArrayList<>();

        for (Tuple tuple : tuples) {
            JurorAppearanceResponseDto.JurorAppearanceResponseData
                appearanceData = JurorAppearanceResponseDto.JurorAppearanceResponseData.builder()
                .jurorNumber(tuple.get(0, String.class))
                .firstName(tuple.get(1, String.class))
                .lastName(tuple.get(2, String.class))
                .jurorStatus(tuple.get(3, Integer.class))
                .checkInTime(tuple.get(4, LocalTime.class))
                .checkOutTime(tuple.get(5, LocalTime.class))
                .noShow(tuple.get(6, Boolean.class))
                .appStage(tuple.get(7, AppearanceStage.class))
                .policeCheck(tuple.get(8, PoliceCheck.class))
                .build();
            appearanceDataList.add(appearanceData);
        }

        return appearanceDataList;
    }

    @Override
    public List<Tuple> getAvailableJurors(String locCode) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
        return queryFactory.select(
                POOL.poolNumber,
                APPEARANCE.count(),
                POOL.returnDate,
                COURT_LOCATION.name,
                COURT_LOCATION.locCode
            )
            .from(POOL)
            .join(JUROR_POOL).on(JUROR_POOL.pool.eq(POOL))
            .join(APPEARANCE).on(JUROR_POOL.juror.jurorNumber.eq(APPEARANCE.jurorNumber))
            .on(POOL.courtLocation.eq(APPEARANCE.courtLocation))
            .join(COURT_LOCATION)
            .on(APPEARANCE.courtLocation.eq(COURT_LOCATION))
            .on(POOL.courtLocation.eq(COURT_LOCATION))
            .where(COURT_LOCATION.locCode.eq(locCode))
            .where(JUROR_POOL.isActive.eq(true))
            .where(JUROR_POOL.status.status.eq(IJurorStatus.RESPONDED))
            .where(APPEARANCE.timeIn.isNotNull())
            .where(APPEARANCE.timeOut.isNull())
            .where(APPEARANCE.appearanceStage.eq(AppearanceStage.CHECKED_IN))
            .where(APPEARANCE.attendanceDate.eq(LocalDate.now()))
            .where(APPEARANCE.trialNumber.isNull().or(APPEARANCE.trialNumber.isEmpty()))
            .groupBy(POOL.poolNumber)
            .groupBy(POOL.returnDate)
            .groupBy(COURT_LOCATION.locCode)
            .fetch();
    }

    @Override
    public List<JurorPool> retrieveAllJurors(String locCode, LocalDate attendanceDate) {
        return buildJurorPoolsCheckedInTodayQuery(locCode, attendanceDate).fetch();
    }

    @Override
    public List<JurorPool> getJurorsInPools(String locCode, List<String> poolNumbers, LocalDate attendanceDate) {
        JPAQuery<JurorPool> query = buildJurorPoolsCheckedInTodayQuery(locCode, attendanceDate);
        return query.where(JUROR_POOL.pool.poolNumber.in(poolNumbers)).fetch();
    }

    /**
     * Builds query for getting the juror pool record for jurors at a given court location with an appearance record
     * today showing they have been checked in and are available to be selected for a panel.
     *
     * @return JPAQuery
     */
    @Override
    public JPAQuery<JurorPool> buildJurorPoolsCheckedInTodayQuery(String locCode, LocalDate attendanceDate) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
        return queryFactory.select(JUROR_POOL)
            .from(APPEARANCE)
            .join(JUROR_POOL)
            .on(JUROR_POOL.juror.jurorNumber.eq(APPEARANCE.jurorNumber))
            .where(APPEARANCE.courtLocation.locCode.eq(locCode))
            .where(APPEARANCE.appearanceStage.eq(AppearanceStage.CHECKED_IN))
            .where(APPEARANCE.attendanceDate.eq(attendanceDate))
            .where(JUROR_POOL.pool.courtLocation.locCode.eq(locCode))
            .where(JUROR_POOL.status.status.eq(IJurorStatus.RESPONDED))
            .where(JUROR_POOL.isActive.isTrue());
    }

    @Override
    public long countPendingApproval(String locCode, boolean isCash) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
        return queryFactory
            .select(APPEARANCE.jurorNumber, APPEARANCE.poolNumber, APPEARANCE.appearanceStage)
            .from(APPEARANCE)
            .where(APPEARANCE.courtLocation.locCode.eq(locCode))
            .where(APPEARANCE.appearanceStage.in(AppearanceStage.EXPENSE_ENTERED, AppearanceStage.EXPENSE_EDITED))
            .where(APPEARANCE.isDraftExpense.isFalse())
            .where(APPEARANCE.payCash.eq(isCash))
            .groupBy(APPEARANCE.jurorNumber)
            .groupBy(APPEARANCE.poolNumber)
            .groupBy(APPEARANCE.appearanceStage)
            .fetchCount();
    }

    @Override
    public Optional<Appearance> findByJurorNumberAndLocCodeAndAttendanceDateAndVersion(String jurorNumber,
                                                                                       String locCode,
                                                                                       LocalDate attendanceDate,
                                                                                       long appearanceVersion) {
        try {
            return Optional.ofNullable((Appearance) AuditReaderFactory.get(entityManager)
                .createQuery()
                .forRevisionsOfEntity(Appearance.class, true, false)
                .add(AuditEntity.property("jurorNumber").eq(jurorNumber))
                .add(AuditEntity.property("locCode").eq(locCode))
                .add(AuditEntity.property("attendanceDate").eq(attendanceDate))
                .add(AuditEntity.property("version").eq(appearanceVersion))
                .getSingleResult());
        } catch (NoResultException e) {
            return Optional.empty();
        }
    }

    @Override
    public List<Tuple> getTrialsWithAttendanceCount(String locationCode, LocalDate attendanceDate) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);

        return queryFactory.select(PANEL.trial.trialNumber,
                APPEARANCE.jurorNumber.count(),
                APPEARANCE.attendanceAuditNumber)
            .from(APPEARANCE)
            .join(PANEL).on(APPEARANCE.jurorNumber.eq(PANEL.juror.jurorNumber)
                .and(APPEARANCE.trialNumber.eq(PANEL.trial.trialNumber)))
            .where(APPEARANCE.attendanceDate.eq(attendanceDate))
            .where(APPEARANCE.attendanceType.notIn(AttendanceType.ABSENT, AttendanceType.NON_ATTENDANCE,
                AttendanceType.NON_ATTENDANCE_LONG_TRIAL))
            .where(APPEARANCE.appearanceStage.in(AppearanceStage.EXPENSE_ENTERED, AppearanceStage.EXPENSE_AUTHORISED,
                AppearanceStage.EXPENSE_EDITED))
            .where(APPEARANCE.courtLocation.locCode.eq(locationCode))
            .where(PANEL.result.eq(PanelResult.JUROR))
            .groupBy(PANEL.trial.trialNumber,
                APPEARANCE.attendanceAuditNumber)
            .fetch();
    }

    @Override
    public PaginatedList<UnpaidExpenseSummaryResponseDto> findUnpaidExpenses(String locCode,
                                                                             UnpaidExpenseSummaryRequestDto search) {


        JPAQuery<Tuple> query = getQueryFactory()
            .select(QAppearance.appearance.jurorNumber,
                QAppearance.appearance.poolNumber,
                QJuror.juror.firstName,
                QJuror.juror.lastName,
                QAppearance.appearance.totalDue.sum().subtract(QAppearance.appearance.totalPaid.sum())
                    .as(UnpaidExpenseSummaryRequestDto.TOTAL_OUTSTANDING_EXPRESSION)
            )
            .from(QAppearance.appearance)
            .where(QAppearance.appearance.locCode.eq(locCode))
            .where(QAppearance.appearance.appearanceStage.in(
                AppearanceStage.EXPENSE_ENTERED, AppearanceStage.EXPENSE_EDITED
            ))
            .join(QJuror.juror)
            .on(QJuror.juror.jurorNumber.eq(QAppearance.appearance.jurorNumber))
            .groupBy(
                QAppearance.appearance.jurorNumber,
                QAppearance.appearance.poolNumber,
                QJuror.juror.firstName,
                QJuror.juror.lastName
            );

        if (search.getFrom() != null || search.getTo() != null) {
            query.where(QAppearance.appearance.jurorNumber
                .in(getQueryFactory().query()
                    .select(APPEARANCE.jurorNumber)
                    .distinct()
                    .from(APPEARANCE)
                    .where(APPEARANCE.courtLocation.locCode.eq(locCode))
                    .where(APPEARANCE.attendanceDate.between(search.getFrom(), search.getTo()))));
        }

        return PaginationUtil.toPaginatedList(query, search,
            UnpaidExpenseSummaryRequestDto.SortField.JUROR_NUMBER,
            SortMethod.DESC,
            tuple -> UnpaidExpenseSummaryResponseDto.builder()
                .jurorNumber(tuple.get(QAppearance.appearance.jurorNumber))
                .poolNumber(tuple.get(QAppearance.appearance.poolNumber))
                .firstName(tuple.get(QJuror.juror.firstName))
                .lastName(tuple.get(QJuror.juror.lastName))
                .totalUnapproved(tuple.get(UnpaidExpenseSummaryRequestDto.TOTAL_OUTSTANDING_EXPRESSION))
                .build(), null);
    }

    JPAQueryFactory getQueryFactory() {
        return new JPAQueryFactory(entityManager);
    }


}
