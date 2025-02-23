-- Standing data.
INSERT INTO juror_mod.APP_SETTING (SETTING, VALUE) VALUES ('URGENCY_DAYS', '10');
INSERT INTO juror_mod.APP_SETTING (SETTING, VALUE) VALUES ('SLA_OVERDUE_DAYS', '5');

INSERT INTO JUROR_MOD.SYSTEM_PARAMETER(SP_ID, SP_DESC, SP_VALUE) values('100','Upper Age Limit', '76')
ON CONFLICT(SP_ID)
DO UPDATE SET SP_DESC = 'Upper Age Limit', SP_VALUE = '76';

INSERT INTO JUROR_MOD.SYSTEM_PARAMETER(SP_ID, SP_DESC, SP_VALUE) values('101','Lower Age Limit', '18')
ON CONFLICT(SP_ID)
DO UPDATE SET SP_DESC = 'Lower Age Limit', SP_VALUE = '18';

--MERGE INTO JUROR_MOD.SYSTEM_PARAMETER USING select '100' ON ( SP_ID = '100' )
--WHEN MATCHED THEN UPDATE SET SP_DESC = 'Upper Age Limit', SP_VALUE = '76' WHERE SP_ID = '100'
--WHEN NOT MATCHED THEN INSERT (SP_ID, SP_DESC, SP_VALUE) VALUES ('100', 'Upper Age Limit', '76');

--MERGE INTO JUROR_MOD.SYSTEM_PARAMETER USING select '101' ON ( SP_ID = '101' )
--WHEN MATCHED THEN UPDATE SET SP_DESC = 'Lower Age Limit', SP_VALUE = '18' WHERE SP_ID = '101'
--WHEN NOT MATCHED THEN INSERT (SP_ID, SP_DESC, SP_VALUE) VALUES ('101', 'Lower Age Limit', '18');

-- Auto user
INSERT INTO juror_mod.users (username, name, active, email, user_type)
VALUES ('AUTO', 'AUTO', true, 'AUTO@hmcts.gov.uk', 'SYSTEM');
insert into juror_mod.user_courts (username, loc_code)
values ('AUTO', '400');
-- Teams
INSERT INTO JUROR_DIGITAL.TEAM (ID, TEAM_NAME, VERSION) VALUES (1, 'London ' || chr(38) || ' Wales', 0);
INSERT INTO JUROR_DIGITAL.TEAM (ID, TEAM_NAME, VERSION)
VALUES (2, 'South East, North East ' || chr(38) || ' North West', 0);
INSERT INTO JUROR_DIGITAL.TEAM (ID, TEAM_NAME, VERSION) VALUES (3, 'Midlands ' || chr(38) || ' South West', 0);
