-- Clear previous Pool History
delete from juror_mod.pool_history;

-- Clear previous Participant History
delete from juror_mod.juror_history;
delete from juror_mod.juror_audit;


delete from juror_mod.users;

-- Create UNIQUE_POOL records associated with POOL records
delete from juror_mod.juror_response;
delete from juror_mod.pool_comments;
delete from juror_mod.juror_pool;
delete from juror_mod.juror;
delete from juror_mod.pool;

-- Pool 415220401 requested 2 jurors for TIMESTAMP'2023-05-30 00:00:00.000000', 4 already supplied (2 surplus) - active with the buruea
INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE, LOC_CODE, NEW_REQUEST, LAST_UPDATE)
VALUES ('400', '415220401', TIMESTAMP'2023-05-30 00:00:00.000000', 2, 2, 'CRO','415', 'N', TIMESTAMP'2022-02-02 09:22:09.0');

-- Pool 767220401 requested 5 jurors for TIMESTAMP'2023-05-30 00:00:00.000000', 0 already supplied (5 still needed) - active with the buruea
INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE, LOC_CODE, NEW_REQUEST, LAST_UPDATE)
VALUES ('400', '767220401', TIMESTAMP'2023-05-30 00:00:00.000000', 5, 5, 'CRO','767', 'N', TIMESTAMP'2022-02-02 09:22:09.0');

-- Pool 415220502 requested 4 jurors for TIMESTAMP'2023-06-01 00:00:00.000000', 2 already supplied (2 needed) - active with the buruea
INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE, LOC_CODE, NEW_REQUEST, LAST_UPDATE) VALUES
	 ('400', '415220502',  TIMESTAMP'2023-06-01 00:00:00.000000', 4, 4, 'CRO','415', 'N', TIMESTAMP'2022-03-02 09:22:09.0');

INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE, LOC_CODE, NEW_REQUEST, LAST_UPDATE) VALUES
	 ('400', '416220502', TIMESTAMP'2023-06-01 00:00:00.000000', 3, 3, 'CRO','416', 'N', TIMESTAMP'2022-03-02 09:22:09.0');

-- Pool 415220503 requested 4 jurors for TIMESTAMP'2023-06-12 00:00:00.000000', none currently supplied (4 needed) - active with the buruea
INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE, LOC_CODE, NEW_REQUEST, LAST_UPDATE) VALUES
	 ('400', '415220503',  TIMESTAMP'2023-06-12 00:00:00.000000', 4, 4, 'CRO','415', 'N', TIMESTAMP'2022-03-02 09:22:09.0');

-- Pool 415220504 requested 4 jurors for TIMESTAMP'2023-06-12 00:00:00.000000', none currently supplied (4 needed) - active with the court
INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE, LOC_CODE, NEW_REQUEST, LAST_UPDATE) VALUES
	 ('415', '415220504', TIMESTAMP'2023-06-12 00:00:00.000000', 4, 4, 'CRO', '415', 'N', TIMESTAMP'2022-03-02 09:22:09.0');

-- Create Juror records associated with DEFER_DBF records

INSERT INTO juror_mod.juror (juror_number,poll_number,last_name,first_name,dob,address_line_1,address_line_2,postcode,responded,user_edtq,no_def_pos,notifications,notes,optic_reference) VALUES
	 ('555555551','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,'12345678'),
	 ('555555552','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555553','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555554','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555555','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555556','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555557','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,'12345678'),
	 ('555555558','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,'12345678'),
	 ('555555559','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555561','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,'12345678'),
     ('555555562','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
     ('555555563','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
     ('555555564','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
     ('555555565','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
     ('555555566','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
     ('555555567','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,'12345678'),
     ('555555568','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,'12345678'),
     ('555555569','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL);

INSERT INTO juror_mod.juror_pool ("owner",juror_number,pool_number,user_edtq,status,is_active,pool_seq,"location",on_call) VALUES
	 ('400','555555551','415220401','BUREAU_USER_1',1,'Y','0109','415','N'),
	 ('400','555555552','415220401','BUREAU_USER_1',2,'Y','0109','415','N'),
	 ('400','555555553','415220401','BUREAU_USER_1',11,'Y','0109','415','N'),
	 ('400','555555554','415220401','BUREAU_USER_1',1,'Y','0109','415','N'),
	 ('400','555555555','415220502','BUREAU_USER_1',2,'Y','0109','415','N'),
	 ('400','555555556','415220502','BUREAU_USER_1',11,'Y','0109','415','N'),
	 ('400','555555557','415220504','BUREAU_USER_1',1,'Y','0109','415','N'),
	 ('415','555555558','415220401','BUREAU_USER_1',1,'Y','0109','415','N'),
	 ('415','555555559','415220401','BUREAU_USER_1',1,'Y','0109','415','N'),
	 ('400','555555561','415220401','BUREAU_USER_1',1,'Y','0109','415','N'),
     ('400','555555562','415220401','BUREAU_USER_1',2,'Y','0109','415','N'),
     ('400','555555563','415220401','BUREAU_USER_1',11,'Y','0109','415','N'),
     ('400','555555564','415220401','BUREAU_USER_1',1,'Y','0109','415','N'),
     ('400','555555565','415220502','BUREAU_USER_1',2,'Y','0109','415','N'),
     ('400','555555566','415220502','BUREAU_USER_1',11,'Y','0109','415','N'),
     ('400','555555567','415220504','BUREAU_USER_1',1,'Y','0109','415','N'),
     ('415','555555568','415220401','BUREAU_USER_1',1,'Y','0109','415','N'),
     ('415','555555569','415220401','BUREAU_USER_1',1,'Y','0109','415','N');

-- Create JUROR_RESPONSE records associated with POOL_MEMBER records
INSERT INTO juror_mod.juror_response
(JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, address_line_1, address_line_2, address_line_3, address_line_4, address_line_5,
postcode, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL,
MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON,
DEFERRAL_DATE, reasonable_adjustments_arrangements , EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION, THIRDPARTY_FNAME,
THIRDPARTY_LNAME, RELATIONSHIP, MAIN_PHONE, OTHER_PHONE, email_address, THIRDPARTY_REASON, THIRDPARTY_OTHER_REASON,
JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE, URGENT, COMPLETED_AT, WELSH,
 reply_type)
VALUES('555555551', TIMESTAMP '2023-03-08 00:00:00.000000', 'Mr', 'Test', 'Person', 'Address Line 1', 'Address Line 2',
'Address Line 3', 'CARDIFF', 'Some County', 'CH1 2AN', 'TODO', TIMESTAMP '1998-03-08 00:00:00.000000', NULL, NULL,
 NULL, 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, 'C', '29/05/2023, 12/6/2023, 3/7/2023', NULL, NULL, 'N', 0, NULL,
 NULL, NULL, '01111111110', '01234098765', 'new_email@address.com', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL,
 'N', 'Digital');

INSERT INTO juror_mod.juror_response
(JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, address_line_1, address_line_2, address_line_3, address_line_4, address_line_5,
postcode, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL,
MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON,
DEFERRAL_DATE, reasonable_adjustments_arrangements , EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION, THIRDPARTY_FNAME,
THIRDPARTY_LNAME, RELATIONSHIP, MAIN_PHONE, OTHER_PHONE, email_address, THIRDPARTY_REASON, THIRDPARTY_OTHER_REASON,
JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE, URGENT, COMPLETED_AT, WELSH,
 reply_type)
VALUES('555555552', TIMESTAMP '2023-03-08 00:00:00.000000', 'Mr', 'Test', 'Person', 'Address Line 1', 'Address Line 2',
'Address Line 3', 'CARDIFF', 'Some County', 'CH1 2AN', 'TODO', TIMESTAMP '1998-03-08 00:00:00.000000', NULL, NULL,
 NULL, 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, 'C', '29/05/2023, 12/6/2023, 3/7/2023', NULL, NULL, 'N', 0, NULL,
 NULL, NULL, '01111111110', '01234098765', 'new_email@address.com', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL,
 'N', 'Digital');

 INSERT INTO juror_mod.juror_response
 (JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, address_line_1, address_line_2, address_line_3, address_line_4, address_line_5,
 postcode, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL,
 MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON,
 DEFERRAL_DATE, reasonable_adjustments_arrangements , EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION, THIRDPARTY_FNAME,
 THIRDPARTY_LNAME, RELATIONSHIP, MAIN_PHONE, OTHER_PHONE, email_address, THIRDPARTY_REASON, THIRDPARTY_OTHER_REASON,
 JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE, URGENT, COMPLETED_AT, WELSH,
  reply_type)
 VALUES('555555558', TIMESTAMP '2023-03-08 00:00:00.000000', 'Mr', 'Test', 'Person', 'Address Line 1', 'Address Line 2',

 'Address Line 3', 'CARDIFF', 'Some County', 'CH1 2AN', 'TODO', TIMESTAMP '1998-03-08 00:00:00.000000', NULL, NULL,
  NULL, 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, 'C', '29/05/2023, 12/6/2023, 3/7/2023', NULL, NULL, 'N', 0, NULL,
  NULL, NULL, '01111111110', '01234098765', 'new_email@address.com', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL,
  'N', 'Digital');

INSERT INTO juror_mod.juror_response
(JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, address_line_1, address_line_2, address_line_3, address_line_4, address_line_5,
postcode, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL,
MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON,
DEFERRAL_DATE, reasonable_adjustments_arrangements , EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION, THIRDPARTY_FNAME,
THIRDPARTY_LNAME, RELATIONSHIP, MAIN_PHONE, OTHER_PHONE, email_address, THIRDPARTY_REASON, THIRDPARTY_OTHER_REASON,
JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE, URGENT, COMPLETED_AT, WELSH,
 reply_type)
VALUES('555555559', TIMESTAMP '2023-03-08 00:00:00.000000', 'Mr', 'Test', 'Person', 'Address Line 1', 'Address Line 2',
'Address Line 3', 'CARDIFF', 'Some County', 'CH1 2AN', 'TODO', TIMESTAMP '1998-03-08 00:00:00.000000', NULL, NULL,
 NULL, 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, 'C', '29/05/2023, 12/6/2023, 3/7/2023', NULL, NULL, 'N', 0, NULL,
 NULL, NULL, '01111111110', '01234098765', 'new_email@address.com', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL,
 'N', 'Digital');


INSERT INTO juror_mod.users (username,email, name, active)
VALUES ('BUREAU_USER','BUREAU_USER@email.gov.uk','Test User',true),
       ('COURT_USER','COURT_USER@email.gov.uk','Test User',true);

insert into juror_mod.user_courts (username, loc_code)
values ('COURT_USER', '415'),
       ('BUREAU_USER', '400');

-- paper
INSERT INTO juror_mod.juror_response
(JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, address_line_1, address_line_2, address_line_3, address_line_4, address_line_5,
postcode, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL,
MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON,
DEFERRAL_DATE, reasonable_adjustments_arrangements , EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION, THIRDPARTY_FNAME,
THIRDPARTY_LNAME, RELATIONSHIP, MAIN_PHONE, OTHER_PHONE, email_address, THIRDPARTY_REASON, THIRDPARTY_OTHER_REASON,
JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE, URGENT, COMPLETED_AT, WELSH,
 reply_type)
VALUES('555555561', TIMESTAMP '2023-03-08 00:00:00.000000', 'Mr', 'Test', 'Person', 'Address Line 1', 'Address Line 2',
'Address Line 3', 'CARDIFF', 'Some County', 'CH1 2AN', 'TODO', TIMESTAMP '1998-03-08 00:00:00.000000', NULL, NULL,
 NULL, 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, 'C', '29/05/2023, 12/6/2023, 3/7/2023', NULL, NULL, 'N', 0, NULL,
 NULL, NULL, '01111111110', '01234098765', 'new_email@address.com', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL,
 'N', 'Paper');

INSERT INTO juror_mod.juror_response
(JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, address_line_1, address_line_2, address_line_3, address_line_4, address_line_5,
postcode, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL,
MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON,
DEFERRAL_DATE, reasonable_adjustments_arrangements , EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION, THIRDPARTY_FNAME,
THIRDPARTY_LNAME, RELATIONSHIP, MAIN_PHONE, OTHER_PHONE, email_address, THIRDPARTY_REASON, THIRDPARTY_OTHER_REASON,
JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE, URGENT, COMPLETED_AT, WELSH,
 reply_type)
VALUES('555555562', TIMESTAMP '2023-03-08 00:00:00.000000', 'Mr', 'Test', 'Person', 'Address Line 1', 'Address Line 2',
'Address Line 3', 'CARDIFF', 'Some County', 'CH1 2AN', 'TODO', TIMESTAMP '1998-03-08 00:00:00.000000', NULL, NULL,
 NULL, 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, 'C', '29/05/2023, 12/6/2023, 3/7/2023', NULL, NULL, 'N', 0, NULL,
 NULL, NULL, '01111111110', '01234098765', 'new_email@address.com', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL,
 'N', 'Paper');

 INSERT INTO juror_mod.juror_response
 (JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, address_line_1, address_line_2, address_line_3, address_line_4, address_line_5,
 postcode, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL,
 MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON,
 DEFERRAL_DATE, reasonable_adjustments_arrangements , EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION, THIRDPARTY_FNAME,
 THIRDPARTY_LNAME, RELATIONSHIP, MAIN_PHONE, OTHER_PHONE, email_address, THIRDPARTY_REASON, THIRDPARTY_OTHER_REASON,
 JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE, URGENT, COMPLETED_AT, WELSH,
  reply_type)
 VALUES('555555568', TIMESTAMP '2023-03-08 00:00:00.000000', 'Mr', 'Test', 'Person', 'Address Line 1', 'Address Line 2',

 'Address Line 3', 'CARDIFF', 'Some County', 'CH1 2AN', 'TODO', TIMESTAMP '1998-03-08 00:00:00.000000', NULL, NULL,
  NULL, 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, 'C', '29/05/2023, 12/6/2023, 3/7/2023', NULL, NULL, 'N', 0, NULL,
  NULL, NULL, '01111111110', '01234098765', 'new_email@address.com', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL,
  'N', 'Paper');

INSERT INTO juror_mod.juror_response
(JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, address_line_1, address_line_2, address_line_3, address_line_4, address_line_5,
postcode, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL,
MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON,
DEFERRAL_DATE, reasonable_adjustments_arrangements , EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION, THIRDPARTY_FNAME,
THIRDPARTY_LNAME, RELATIONSHIP, MAIN_PHONE, OTHER_PHONE, email_address, THIRDPARTY_REASON, THIRDPARTY_OTHER_REASON,
JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE, URGENT, COMPLETED_AT, WELSH,
 reply_type)
VALUES('555555569', TIMESTAMP '2023-03-08 00:00:00.000000', 'Mr', 'Test', 'Person', 'Address Line 1', 'Address Line 2',
'Address Line 3', 'CARDIFF', 'Some County', 'CH1 2AN', 'TODO', TIMESTAMP '1998-03-08 00:00:00.000000', NULL, NULL,
 NULL, 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, 'C', '29/05/2023, 12/6/2023, 3/7/2023', NULL, NULL, 'N', 0, NULL,
 NULL, NULL, '01111111110', '01234098765', 'new_email@address.com', NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL,
 'N', 'Paper');