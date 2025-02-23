package uk.gov.hmcts.juror.api.moj.utils;

import com.querydsl.core.types.Expression;
import com.querydsl.core.types.dsl.DateTimePath;
import lombok.extern.slf4j.Slf4j;
import uk.gov.hmcts.juror.api.moj.domain.jurorresponse.DigitalResponse;
import uk.gov.hmcts.juror.api.moj.domain.jurorresponse.PaperResponse;
import uk.gov.hmcts.juror.api.moj.exception.MojException;
import uk.gov.hmcts.juror.api.moj.repository.jurorresponse.JurorDigitalResponseRepositoryMod;
import uk.gov.hmcts.juror.api.moj.repository.jurorresponse.JurorPaperResponseRepositoryMod;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;

@Slf4j
public final class DataUtils {

    private DataUtils() {
        // private constructor
    }

    static final String RESPONSE_UPDATED_LOG = "Juror: %s. %s response will be updated with new value for %s";

    public static boolean hasValueChanged(LocalDate currentValue, LocalDate newValue, String fieldName,
                                          String jurorNumber, String replyMethod) {
        if ((currentValue != null && newValue != null && !currentValue.isEqual(newValue))
            || (currentValue == null && newValue != null)
            || (currentValue != null && newValue == null)) {
            log.debug(String.format(RESPONSE_UPDATED_LOG, jurorNumber, replyMethod, fieldName));
            return true;
        }
        return false;
    }

    public static boolean hasValueChanged(String currentValue, String newValue, String fieldName, String jurorNumber,
                                          String replyMethod) {
        if ((currentValue != null && !currentValue.equals(newValue)) || (currentValue == null && newValue != null)) {
            log.debug(String.format(RESPONSE_UPDATED_LOG, jurorNumber, replyMethod, fieldName));
            return true;
        }
        return false;
    }

    public static boolean hasValueChanged(Boolean currentValue, Boolean newValue, String fieldName,
                                          String jurorNumber, String replyMethod) {
        if ((currentValue != null && !currentValue.equals(newValue)) || (currentValue == null && newValue != null)) {
            log.debug(String.format(RESPONSE_UPDATED_LOG, jurorNumber, replyMethod, fieldName));
            return true;
        }
        return false;
    }

    public static DigitalResponse getJurorDigitalResponse(String jurorNumber,
                                                          JurorDigitalResponseRepositoryMod repositoryMod) {
        DigitalResponse jurorResponse;

        try {
            jurorResponse = repositoryMod.findByJurorNumber(jurorNumber);
            if (jurorResponse == null) {
                throw new MojException.NotFound(
                    String.format("Juror: %s. Cannot find digital response", jurorNumber), null);
            }
        } catch (IllegalArgumentException ex) {
            throw new MojException.InternalServerError(String.format(
                "Juror: %s. There were problems with searching for the juror digital response. "
                    + "Refer to the stack trace for additional information.", jurorNumber), ex);
        }
        return jurorResponse;
    }

    public static PaperResponse getJurorPaperResponse(String jurorNumber,
                                                      JurorPaperResponseRepositoryMod repositoryMod) {
        PaperResponse jurorPaperResponse;

        try {
            jurorPaperResponse = repositoryMod.findByJurorNumber(jurorNumber);
            if (jurorPaperResponse == null) {
                throw new MojException.NotFound(
                    String.format("Juror: %s. Cannot find paper response", jurorNumber), null);
            }
        } catch (IllegalArgumentException ex) {
            throw new MojException.InternalServerError(String.format("Juror: %s. There were problems with searching "
                + "for the  juror paper response for the given juror number. Refer to the stack trace for additional "
                + "information.", jurorNumber), ex);
        }
        return jurorPaperResponse;
    }

    public static boolean isEmptyOrNull(Collection<?> collection) {
        return collection == null || collection.isEmpty();
    }

    public static boolean isNotEmptyOrNull(Collection<?> collection) {
        return !isEmptyOrNull(collection);
    }

    public static String asStringHHmm(LocalTime localTime) {
        if (localTime == null) {
            return null;
        }
        return localTime.format(DateTimeFormatter.ofPattern("HH:mm"));
    }

    public static Expression<?> asDate(DateTimePath<LocalDateTime> dateTimePath) {
        return dateTimePath.stringValue().substring(0, 10);
    }
}
