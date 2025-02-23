package uk.gov.hmcts.juror.api.moj.report.grouped;

import com.querydsl.core.Tuple;
import com.querydsl.jpa.impl.JPAQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import uk.gov.hmcts.juror.api.moj.controller.reports.request.StandardReportRequest;
import uk.gov.hmcts.juror.api.moj.controller.reports.response.AbstractReportResponse;
import uk.gov.hmcts.juror.api.moj.controller.reports.response.GroupedReportResponse;
import uk.gov.hmcts.juror.api.moj.controller.reports.response.GroupedTableData;
import uk.gov.hmcts.juror.api.moj.controller.reports.response.StandardReportResponse;
import uk.gov.hmcts.juror.api.moj.domain.QAppearance;
import uk.gov.hmcts.juror.api.moj.domain.QJurorPool;
import uk.gov.hmcts.juror.api.moj.enumeration.AttendanceType;
import uk.gov.hmcts.juror.api.moj.report.AbstractGroupedReport;
import uk.gov.hmcts.juror.api.moj.report.DataType;
import uk.gov.hmcts.juror.api.moj.report.ReportGroupBy;
import uk.gov.hmcts.juror.api.moj.repository.CourtLocationRepository;
import uk.gov.hmcts.juror.api.moj.repository.PoolRequestRepository;
import uk.gov.hmcts.juror.api.moj.utils.SecurityUtil;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


@Component
@SuppressWarnings("PMD.LawOfDemeter")
public class AbsencesReport extends AbstractGroupedReport {

    private final CourtLocationRepository courtLocationRepository;

    @Autowired
    public AbsencesReport(PoolRequestRepository poolRequestRepository,
                          CourtLocationRepository courtLocationRepository) {
        super(poolRequestRepository,
            QJurorPool.jurorPool,
            ReportGroupBy.builder()
                .dataType(DataType.POOL_NUMBER_AND_COURT_TYPE)
                .removeGroupByFromResponse(true)
                .build(),
            DataType.JUROR_NUMBER,
            DataType.FIRST_NAME,
            DataType.LAST_NAME,
            DataType.JUROR_POSTAL_ADDRESS,
            DataType.DATE_OF_ABSENCE);

        isCourtUserOnly();
        this.courtLocationRepository = courtLocationRepository;
    }

    @Override
    protected void preProcessQuery(JPAQuery<Tuple> query, StandardReportRequest request) {
        query.where(QAppearance.appearance.attendanceType.eq(AttendanceType.ABSENT));
        query.where(QAppearance.appearance.attendanceDate.between(request.getFromDate(), request.getToDate()));

        query.where(QJurorPool.jurorPool.pool.courtLocation.locCode.eq(SecurityUtil.getLocCode()));
        query.orderBy(QJurorPool.jurorPool.juror.jurorNumber.asc(), QAppearance.appearance.attendanceDate.asc());
    }

    @Override
    public Map<String, GroupedReportResponse.DataTypeValue> getHeadings(
        StandardReportRequest request,
        GroupedReportResponse.TableData<GroupedTableData> tableData) {

        Map<String, StandardReportResponse.DataTypeValue> map = new ConcurrentHashMap<>();
        map.put("total_absences", StandardReportResponse.DataTypeValue.builder()
            .displayName("Total absences")
            .dataType(Integer.class.getSimpleName())
            .value(tableData.getData().getSize())
            .build());

        map.put("date_from", AbstractReportResponse.DataTypeValue.builder().displayName("Date from")
            .dataType(LocalDate.class.getSimpleName())
            .value(DateTimeFormatter.ISO_DATE.format(request.getFromDate())).build());

        map.put("date_to", AbstractReportResponse.DataTypeValue.builder().displayName("Date to")
            .dataType(LocalDate.class.getSimpleName())
            .value(DateTimeFormatter.ISO_DATE.format(request.getToDate())).build());

        map.put("court_name", AbstractReportResponse.DataTypeValue.builder().displayName("Court Name")
            .dataType(String.class.getSimpleName())
            .value(getCourtNameString(courtLocationRepository, SecurityUtil.getLocCode()))
            .build());

        return map;
    }

    @Override
    public Class<AbsencesReport.RequestValidator> getRequestValidatorClass() {
        return AbsencesReport.RequestValidator.class;
    }

    public interface RequestValidator extends
        Validators.AbstractRequestValidator,
        Validators.RequireFromDate,
        Validators.RequireToDate {

    }
}
