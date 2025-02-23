package uk.gov.hmcts.juror.api.moj.xerox;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import uk.gov.hmcts.juror.api.moj.domain.FormCode;
import uk.gov.hmcts.juror.api.moj.xerox.letters.ConfirmLetter;

import java.time.LocalDate;
import java.time.Month;

import static org.assertj.core.api.Assertions.assertThat;

@ExtendWith(SpringExtension.class)
class ConfirmLetterTest extends AbstractLetterTest {
    @Override
    protected void setupEnglishExpectedResult() {
        addEnglishLetterDate();
        addEnglishField("457", 3);
        addEnglishField("SWANSEA CROWN COURT", 59);
        addEnglishField("JURY CENTRAL SUMMONING BUREAU", 40);
        addEnglishField("THE COURT SERVICE", 35);
        addEnglishField("FREEPOST LON 19669", 35);
        addEnglishField("POCOCK STREET", 35);
        addEnglishField("LONDON", 35);
        addEnglishField("BUREAU_ADDRESS_5", 35);
        addEnglishField("BUREAU_ADDRESS_6", 35);
        addEnglishField("SE1 0YG", 10);
        addEnglishField("0845 3555567", 12);
        addEnglishField("", 12);
        addEnglishField("MONDAY 6 FEBRUARY, 2017", 32);
        addEnglishField("10:00", 8);
        addEnglishField("MR", 10);
        addEnglishField("FNAMEEIGHTTHREEONE", 20);
        addEnglishField("LNAMEEIGHTTHREEONE", 20);
        addEnglishField("831 STREET NAME", 35);
        addEnglishField("ANYTOWN", 35);
        addEnglishField("JUROR_ADDRESS_3", 35);
        addEnglishField("JUROR_ADDRESS_4", 35);
        addEnglishField("JUROR_ADDRESS_5", 35);
        addEnglishField("", 35);
        addEnglishField("SY2 6LU", 10);
        addEnglishField("641500541", 9);
        addEnglishField("JURY MANAGER", 30);
    }

    @Override
    protected void setupWelshExpectedResult() {
        addWelshLetterDate();
        addWelshField("457", 3);
        addWelshField("ABERTAWE", 40);
        addWelshField("SWANSEA CROWN COURT", 40);
        addWelshField("JURY CENTRAL SUMMONING BUREAU", 35);
        addWelshField("THE COURT SERVICE", 35);
        addWelshField("FREEPOST LON 19669", 35);
        addWelshField("POCOCK STREET", 35);
        addWelshField("LONDON", 35);
        addWelshField("BUREAU_ADDRESS_5", 35);
        addWelshField("SE1 0YG", 10);
        addWelshField("0845 3555567", 12);
        addWelshField("", 12);
        addWelshField("DYDD LLUN 6 CHWEFROR, 2017", 32);
        addWelshField("10:00", 8);
        addWelshField("MR", 10);
        addWelshField("FNAMEEIGHTTHREEONE", 20);
        addWelshField("LNAMEEIGHTTHREEONE", 20);
        addWelshField("831 STREET NAME", 35);
        addWelshField("ANYTOWN", 35);
        addWelshField("JUROR_ADDRESS_3", 35);
        addWelshField("JUROR_ADDRESS_4", 35);
        addWelshField("JUROR_ADDRESS_5", 35);
        addWelshField("", 35);
        addWelshField("SY2 6LU", 10);
        addWelshField("641500541", 9);
    }


    @Test
    void confirmEnglishLetterProducesCorrectOutput() {

        final LocalDate date = LocalDate.of(2017, Month.FEBRUARY, 6);
        setupEnglishExpectedResult();
        ConfirmLetter confirmLetter = new ConfirmLetter(LetterTestUtils.testJurorPool(date),
            LetterTestUtils.testCourtLocation(),
            LetterTestUtils.testBureauLocation());

        assertThat(confirmLetter.getLetterString()).isEqualTo(getExpectedEnglishResult());
        assertThat(confirmLetter.getFormCode()).isEqualTo(FormCode.ENG_CONFIRMATION.getCode());
        assertThat(confirmLetter.getJurorNumber()).isEqualTo(LetterTestUtils.testJuror().getJurorNumber());

        // Fax number is always empty
        assertThat(confirmLetter.getData().get(12).getFormattedString()).isEqualTo(LetterTestUtils.emptyField(12));
        // Juror address 6 is always empty
        assertThat(confirmLetter.getData().get(23).getFormattedString()).isEqualTo(LetterTestUtils.emptyField(35));

    }

    @Test
    void confirmWelshLetterProducesCorrectOutput() {

        final LocalDate date = LocalDate.of(2017, Month.FEBRUARY, 6);
        setupWelshExpectedResult();
        ConfirmLetter confirmLetter = new ConfirmLetter(LetterTestUtils.testWelshJurorPool(date),
            LetterTestUtils.testCourtLocation(),
            LetterTestUtils.testBureauLocation(),
            LetterTestUtils.testWelshCourtLocation());

        assertThat(confirmLetter.getLetterString()).isEqualTo(getExpectedWelshResult());
        assertThat(confirmLetter.getFormCode()).isEqualTo(FormCode.BI_CONFIRMATION.getCode());
        assertThat(confirmLetter.getJurorNumber()).isEqualTo(LetterTestUtils.testWelshJuror().getJurorNumber());

        // Fax number is always empty
        assertThat(confirmLetter.getData().get(12).getFormattedString()).isEqualTo(LetterTestUtils.emptyField(12));
        // Juror address 6 is always empty
        assertThat(confirmLetter.getData().get(23).getFormattedString()).isEqualTo(LetterTestUtils.emptyField(35));

    }

    @Test
    void confirmWelshWithoutWelshCourtProducesEnglishOutput() {
        final LocalDate date = LocalDate.of(2017, Month.FEBRUARY, 6);
        setupEnglishExpectedResult();
        ConfirmLetter confirmLetter = new ConfirmLetter(LetterTestUtils.testWelshJurorPool(date),
            LetterTestUtils.testCourtLocation(),
            LetterTestUtils.testBureauLocation());
        assertThat(confirmLetter.getLetterString()).isEqualTo(getExpectedEnglishResult());
    }
}
