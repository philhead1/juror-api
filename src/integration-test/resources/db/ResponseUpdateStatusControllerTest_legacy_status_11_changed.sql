-- juror 644892530
INSERT INTO JUROR.POOL (PART_NO, FNAME, LNAME, H_EMAIL, TITLE, DOB, ADDRESS, ADDRESS2, ADDRESS3, ADDRESS4, ZIP, H_PHONE, W_PHONE, IS_ACTIVE, OWNER, LOC_CODE, M_PHONE, RESPONDED, POLL_NUMBER, POOL_NO, ON_CALL, COMPLETION_FLAG, READ_ONLY, CONTACT_PREFERENCE, REG_SPC, RET_DATE, NEXT_DATE, STATUS) VALUES (644892530, 'JANE', 'CASTILLO', 'jcastillo0@ed.gov', 'DR', TO_DATE('1984-07-24 16:04:09', 'YYYY-MM-DD HH24:MI:SS'), '4 Knutson Trail', 'Scotland', 'Aberdeen', 'United Kingdom', 'AB3 9RY', '44(703)209-6993', '44(109)549-5625', 'Y', '400', '448', '44(145)525-2390', 'N', 21112, 555, 'N', 'N', 'N', 0, 'N', CURRENT_DATE, (SELECT CURRENT_DATE + 35), 11);

-- response 644892530 (LAST_NAME changed)
INSERT INTO JUROR_DIGITAL.JUROR_RESPONSE (JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, ADDRESS, ADDRESS2, ADDRESS3, ADDRESS4, ZIP, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL, MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON, DEFERRAL_DATE, SPECIAL_NEEDS_ARRANGEMENTS, EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION) VALUES ('644892530', CURRENT_DATE, 'DR', 'JANE', 'DOE', '4 Knutson Trail', 'Scotland', 'Aberdeen', 'United Kingdom', 'AB3 9RY', 'TODO', TO_DATE('1984-07-24 16:04:09', 'YYYY-MM-DD HH24:MI:SS'), '44(703)209-6993', '44(109)549-5625', 'jcastillo0@ed.gov', 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'N', 2);

-- juror 683462643
INSERT INTO JUROR.POOL (PART_NO, FNAME, LNAME, H_EMAIL, TITLE, DOB, ADDRESS, ADDRESS2, ADDRESS3, ADDRESS4, ZIP, H_PHONE, W_PHONE, IS_ACTIVE, OWNER, LOC_CODE, M_PHONE, RESPONDED, POLL_NUMBER, POOL_NO, ON_CALL, COMPLETION_FLAG, READ_ONLY, CONTACT_PREFERENCE, REG_SPC, RET_DATE, NEXT_DATE, STATUS) VALUES (683462643, 'ROBERT', 'SMITH', null, 'MR', TO_DATE('1984-07-24 16:04:09', 'YYYY-MM-DD HH24:MI:SS'), '4 Knutson Trail', 'Scotland', 'Aberdeen', 'United Kingdom', 'AB3 9RY', '44(703)209-6993', '44(109)549-5625', 'Y', '400', '448', '44(145)525-2390', 'N', 21112, 555, 'N', 'N', 'N', 0, 'N', CURRENT_DATE, (SELECT CURRENT_DATE + 35), 1);

-- response 683462643 (LAST_NAME changed)
INSERT INTO JUROR_DIGITAL.JUROR_RESPONSE (JUROR_NUMBER, DATE_RECEIVED, TITLE, FIRST_NAME, LAST_NAME, ADDRESS, ADDRESS2, ADDRESS3, ADDRESS4, ZIP, PROCESSING_STATUS, DATE_OF_BIRTH, PHONE_NUMBER, ALT_PHONE_NUMBER, EMAIL, RESIDENCY, RESIDENCY_DETAIL, MENTAL_HEALTH_ACT, MENTAL_HEALTH_ACT_DETAILS, BAIL, BAIL_DETAILS, CONVICTIONS, CONVICTIONS_DETAILS, DEFERRAL_REASON, DEFERRAL_DATE, SPECIAL_NEEDS_ARRANGEMENTS, EXCUSAL_REASON, PROCESSING_COMPLETE, VERSION) VALUES ('683462643', CURRENT_DATE, 'MR', 'ROBERT', 'SMYTHE', '4 Knutson Trail', 'Scotland', 'Aberdeen', 'United Kingdom', 'AB3 9RY', 'TODO', TO_DATE('1984-07-24 16:04:09', 'YYYY-MM-DD HH24:MI:SS'), '44(703)209-6993', '44(109)549-5625', 'rsmith@byob.com', 'Y', NULL, 'N', NULL, 'N', NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'N', 2);

-- team member with login enabled
INSERT INTO JUROR.PASSWORD (OWNER, LOGIN, PASSWORD, LAST_USED, USER_LEVEL, ARAMIS_AUTH_CODE, ARAMIS_MAX_AUTH, PASSWORD_CHANGED_DATE, LOGIN_ENABLED_YN) VALUES('400', 'testlogin', '5baa61e4c9b93f3f', current_date - 3, 1, 123456789, 12345678.12, current_date - 3, 'Y');
INSERT INTO JUROR_DIGITAL.STAFF (ACTIVE, LOGIN, NAME, RANK, TEAM_ID, VERSION, COURT_1, COURT_2, COURT_3, COURT_4, COURT_5, COURT_6, COURT_7, COURT_8, COURT_9, COURT_10) VALUES (1, 'testlogin', 'Test Login', 0, 1, 0, '120', '121', '122', '123', '124', '125', '126', '127', '128', '129');
--
