INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE,LOC_CODE, NEW_REQUEST, LAST_UPDATE, ADDITIONAL_SUMMONS, ATTEND_TIME)
VALUES ('400', '415220901', TIMESTAMP'2022-09-04 00:00:00.0', 5, 5, 'CRO', '415','N', TIMESTAMP'2022-02-02 09:22:09.0', NULL, TIMESTAMP'2022-09-04 09:00:00.0');

INSERT INTO JUROR_MOD.JUROR (JUROR_NUMBER,  LAST_NAME,  FIRST_NAME,  DOB,  ADDRESS_LINE_1,  ADDRESS_LINE_4,  POSTCODE,
RESPONDED)
VALUES ('641500005',  'LNAMEZEROFIVE',  'FNAMEZEROFIVE',  NULL,  '540 STREET NAME',  'ANYTOWN',  'CH1 2AN',  'N');

INSERT INTO JUROR_MOD.JUROR_POOL (OWNER, JUROR_NUMBER, POOL_NUMBER, DEF_DATE, STATUS, IS_ACTIVE,WAS_DEFERRED)
VALUES ('400', '641500005', '415220901', '2022-12-04 00:00:00', 2,
        TRUE, TRUE);

INSERT INTO JUROR_MOD.JUROR (JUROR_NUMBER,  LAST_NAME,  FIRST_NAME,  DOB,  ADDRESS_LINE_1,  ADDRESS_LINE_4,  POSTCODE,  RESPONDED)
VALUES ('641500004',  'LNAMEZEROFIVE',  'FNAMEZEROFIVE',  NULL,  '540 STREET NAME',  'ANYTOWN',  'CH1 2AN',  'N');

INSERT INTO JUROR_MOD.JUROR_POOL (OWNER, JUROR_NUMBER, POOL_NUMBER, DEF_DATE, STATUS, IS_ACTIVE, WAS_DEFERRED)
VALUES ('400', '641500004', '415220901', '2022-12-04 00:00:00', 3,
        TRUE, TRUE);

INSERT INTO JUROR_MOD.JUROR (JUROR_NUMBER,  LAST_NAME,  FIRST_NAME,  DOB,  address_line_1,  address_line_4,  postcode,
                             RESPONDED,
                             completion_date)
VALUES ('641500003',  'LNAMEZEROFIVE',  'FNAMEZEROFIVE',  NULL,  '540 STREET NAME',  'ANYTOWN',  'CH1 2AN',  'N',
        CURRENT_DATE);

INSERT INTO JUROR_MOD.JUROR_POOL (OWNER, JUROR_NUMBER, POOL_NUMBER, DEF_DATE, STATUS, IS_ACTIVE,
                                  WAS_DEFERRED)
VALUES ('400', '641500003', '415220901', '2022-12-04 00:00:00', 2,
        TRUE, TRUE);

INSERT INTO JUROR_MOD.JUROR (JUROR_NUMBER,  LAST_NAME,  FIRST_NAME,  DOB,  address_line_1,  address_line_4,  postcode,  RESPONDED)
VALUES ('641500002',  'LNAMEZEROFIVE',  'FNAMEZEROFIVE',  NULL,  '540 STREET NAME',  'ANYTOWN',  'CH1 2AN',  'N');

INSERT INTO JUROR_MOD.JUROR_POOL (OWNER, JUROR_NUMBER, POOL_NUMBER, DEF_DATE, STATUS, IS_ACTIVE,WAS_DEFERRED)
VALUES ('400', '641500002', '415220901', '2022-12-04 00:00:00', 2,
        TRUE, TRUE);

INSERT INTO juror_mod.appearance (attendance_date,juror_number,loc_code,time_in,time_out,non_attendance) VALUES
    (current_date - interval '1 day','641500002','415','09:30:00',NULL,false);
