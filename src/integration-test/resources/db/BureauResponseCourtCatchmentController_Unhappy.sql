INSERT INTO JUROR.POOL (part_no, fname, lname, h_email, title, dob, address, address2, address3, address4, zip, h_phone, w_phone, is_active, owner, loc_code, m_phone, responded, poll_number, pool_no, on_call, completion_flag, read_only, contact_preference, reg_spc, ret_date, status) VALUES (209092530, 'Jane', 'CASTILLO', 'jcastillo0@ed.gov', 'Dr', TO_DATE('1984-07-24 16:04:09', 'YYYY-MM-DD HH24:MI:SS'), '4 Knutson Trail', 'Scotland', 'Aberdeen', 'United Kingdom', 'AB39RY', '44(703)209-6993', '44(109)549-5625', 'Y', '400', '448', '44(145)525-2390', 'N', 21112, 555, 'N', 'N', 'N', 0, 'N', CURRENT_DATE, 1);
INSERT INTO JUROR.POOL (part_no, fname, lname, h_email, title, dob, address, address2, address3, address4, zip, h_phone, w_phone, is_active, owner, loc_code, m_phone, responded, poll_number, pool_no, on_call, completion_flag, read_only, contact_preference, reg_spc, ret_date, status) VALUES (586856851, 'Cynthia', 'BROWN', 'cbrown1@yellowpages.com', 'Rev', TO_DATE('1987-05-08 13:42:18', 'YYYY-MM-DD HH24:MI:SS'), '7 Lunder Park', 'England', 'Weston', 'United Kingdom', 'CF62SW', '44(211)698-2662', '44(551)736-7419', 'Y', '400', '411', '44(520)949-8284', 'N', 19917, 222, 'N', 'N', 'N', 0, 'N', CURRENT_DATE, 1);
INSERT INTO JUROR.POOL (part_no, fname, lname, h_email, title, dob, address, address2, address3, address4, zip, h_phone, w_phone, is_active, owner, loc_code, m_phone, responded, poll_number, pool_no, on_call, completion_flag, read_only, contact_preference, reg_spc, ret_date, status) VALUES (487498307, 'Kimberly', 'PIERCE', 'kpierce2@plala.or.jp', 'Mr', TO_DATE('1975-02-11 19:57:43', 'YYYY-MM-DD HH24:MI:SS'), '9371 Superior Avenue', 'England', 'Newbiggin', 'United Kingdom', 'NE46TG', '44(513)905-6359', '44(965)467-9567', 'Y', '400', '448', '44(373)639-7785', 'N', 93315, 333, 'N', 'N', 'N', 0, 'N', CURRENT_DATE, 1);
INSERT INTO JUROR.POOL (part_no, fname, lname, h_email, title, dob, address, address2, address3, address4, zip, h_phone, w_phone, is_active, owner, loc_code, m_phone, responded, poll_number, pool_no, on_call, completion_flag, read_only, contact_preference, reg_spc, ret_date, status) VALUES (472008411, 'Denise', 'ROBERTSON', 'drobertson3@hibu.com', 'Honorable', TO_DATE('1962-03-07 13:50:05', 'YYYY-MM-DD HH24:MI:SS'), '57 Westerfield Parkway', 'England', 'Charlton', 'United Kingdom', 'OX12RV', '44(202)757-0949', '44(665)723-2987', 'Y', '400', '448', '44(170)995-1393', 'N', 93382, 444, 'N', 'N', 'N', 0, 'N', CURRENT_DATE, 1);


INSERT INTO JUROR_DIGITAL.JUROR_RESPONSE (JUROR_NUMBER,DATE_RECEIVED,TITLE,FIRST_NAME,LAST_NAME,ADDRESS,ADDRESS2,ADDRESS3,ADDRESS4,ADDRESS5,ADDRESS6,ZIP,PROCESSING_STATUS,DATE_OF_BIRTH,PHONE_NUMBER,ALT_PHONE_NUMBER,EMAIL,THIRDPARTY_REASON,RESIDENCY,RESIDENCY_DETAIL,MENTAL_HEALTH_ACT,MENTAL_HEALTH_ACT_DETAILS,BAIL,BAIL_DETAILS,CONVICTIONS,CONVICTIONS_DETAILS,DEFERRAL_REASON,DEFERRAL_DATE,SPECIAL_NEEDS_ARRANGEMENTS,EXCUSAL_REASON, VERSION, JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE) VALUES (209092530,CURRENT_DATE,null,null,null,'address',null,null,null,null,null,'RG16HA','TODO',null,null,null,null,null,'0',null,'0',null,'0',null,'0',null,null,null,null,null,555,'Y', 'Y', 'ncrawford', CURRENT_DATE);
INSERT INTO JUROR_DIGITAL.JUROR_RESPONSE (JUROR_NUMBER,DATE_RECEIVED,TITLE,FIRST_NAME,LAST_NAME,ADDRESS,ADDRESS2,ADDRESS3,ADDRESS4,ADDRESS5,ADDRESS6,ZIP,PROCESSING_STATUS,DATE_OF_BIRTH,PHONE_NUMBER,ALT_PHONE_NUMBER,EMAIL,THIRDPARTY_REASON,RESIDENCY,RESIDENCY_DETAIL,MENTAL_HEALTH_ACT,MENTAL_HEALTH_ACT_DETAILS,BAIL,BAIL_DETAILS,CONVICTIONS,CONVICTIONS_DETAILS,DEFERRAL_REASON,DEFERRAL_DATE,SPECIAL_NEEDS_ARRANGEMENTS,EXCUSAL_REASON, JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE) VALUES (586856851,(SELECT CURRENT_DATE-3),null,null,null,'address',null,null,null,null,null,'CF86HA',null,null,null,null,null,null,'0',null,'0',null,'0',null,'0',null,null,null,'nuts allergy',null,'Y', 'Y', 'ncrawford', CURRENT_DATE);-- juror 2
INSERT INTO JUROR_DIGITAL.JUROR_RESPONSE (JUROR_NUMBER,DATE_RECEIVED,TITLE,FIRST_NAME,LAST_NAME,ADDRESS,ADDRESS2,ADDRESS3,ADDRESS4,ADDRESS5,ADDRESS6,ZIP,PROCESSING_STATUS,DATE_OF_BIRTH,PHONE_NUMBER,ALT_PHONE_NUMBER,EMAIL,THIRDPARTY_REASON,RESIDENCY,RESIDENCY_DETAIL,MENTAL_HEALTH_ACT,MENTAL_HEALTH_ACT_DETAILS,BAIL,BAIL_DETAILS,CONVICTIONS,CONVICTIONS_DETAILS,DEFERRAL_REASON,DEFERRAL_DATE,SPECIAL_NEEDS_ARRANGEMENTS,EXCUSAL_REASON, JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE) VALUES (487498307,(SELECT CURRENT_DATE-9),null,null,null,'address',null,null,null,null,null,null,'TODO',null,null,null,null,null,'0',null,'0',null,'0',null,'0',null,null,null,'wheelchair access',null,'Y', 'Y', 'ncrawford', CURRENT_DATE);-- juror 3
INSERT INTO JUROR_DIGITAL.JUROR_RESPONSE (JUROR_NUMBER,DATE_RECEIVED,TITLE,FIRST_NAME,LAST_NAME,ADDRESS,ADDRESS2,ADDRESS3,ADDRESS4,ADDRESS5,ADDRESS6,ZIP,PROCESSING_STATUS,DATE_OF_BIRTH,PHONE_NUMBER,ALT_PHONE_NUMBER,EMAIL,THIRDPARTY_REASON,RESIDENCY,RESIDENCY_DETAIL,MENTAL_HEALTH_ACT,MENTAL_HEALTH_ACT_DETAILS,BAIL,BAIL_DETAILS,CONVICTIONS,CONVICTIONS_DETAILS,DEFERRAL_REASON,DEFERRAL_DATE,SPECIAL_NEEDS_ARRANGEMENTS,EXCUSAL_REASON, JUROR_PHONE_DETAILS, JUROR_EMAIL_DETAILS, STAFF_LOGIN, STAFF_ASSIGNMENT_DATE) VALUES (472008411,(SELECT CURRENT_DATE-10),null,null,null,'address',null,null,null,null,null,null,'AWAITING_CONTACT',null,null,null,null,null,'0',null,'0',null,'0',null,'0',null,null,null, null,null,'Y', 'Y', 'ncrawford', CURRENT_DATE);--juror 4


INSERT INTO juror_mod.users (owner, username, name, level, active,password)
VALUES ('400','ncrawford','Natasha Crawford',0,true,'5baa61e4c9b93f3f'),
       ('400','lrees','Lewis Rees',0,true,'5baa61e4c9b93f3f'),
       ('400','kfry','Katherine Fry',0,true,'5baa61e4c9b93f3f');

Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('AL1','450');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('B4','127');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('B4','404');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('B97','797');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('BB11','409');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('BD1','402');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('BH7','406');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('BL1','470');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('BN3','799');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('BN7','431');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('BS1','408');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CA1','412');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CB1','410');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF1','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF10','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF2','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF3','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF4','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF47','437');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF5','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF6','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF7','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CF8','411');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CH1','415');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CH2','415');
-- taking out 715 as it violates fk constraint on court_location
--Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CH2','715');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CH7','769');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CM1','414');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CR4','794');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CR9','418');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CT1','479');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CV1','417');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('CV34','463');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('DE1','419');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('DH1','422');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('DN1','420');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('DN31','425');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('DT1','407');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('DY10','798');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('E11','453');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('EC4M','413');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('EX1','423');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('EX31','750');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL1','424');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL1','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL10','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL11','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL12','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL13','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL18','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL19','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL2','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL20','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL3','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL4','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL5','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL50','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL51','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL52','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL53','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL54','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL55','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL56','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL6','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL7','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL8','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GL9','795');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('GU1','474');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('HA1','468');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('HP20','401');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('HR1','762');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('HU1','403');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('IP1','426');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('IP33','754');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('KT1','427');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('KT3','794');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('KT4','794');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('L2','433');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('LA1','751');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('LA14','756');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('LE1','430');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('LL40','768');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('LL55','755');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('LN1','432');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('LS1','429');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('LU1','476');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M1','435');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M1','436');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M2','435');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M3','435');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M4','435');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M5','435');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M6','435');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M7','435');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('M8','435');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('ME16','434');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('N22','469');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('NE1','439');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('NG1','444');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('NN1','442');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('NN3','442');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('NN5','442');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('NN7','442');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('NP20','441');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('NR3','443');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('OX1','445');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('PE1','473');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('PE29','796');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('PE32','765');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('PL1','446');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('PO1','447');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('PO19','416');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('PO30','478');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('PR1','448');
-- No POst code for Loc_Code
--Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('RG1','449');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('S1','451');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('S2','451');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('S3','451');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('S4','451');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('S5','451');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('S6','451');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('S7','451');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('S8','451');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SA1','457');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SA2','457');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SA31','758');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SA61','761');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SE1','400');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SE1','428');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SE1','440');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SE1','471');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SE28','472');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SM4','794');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SN1','458');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SO15','454');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SO23','465');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SP1','480');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SS14','461');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SS2','772');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('ST1','456');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('ST16','455');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SW15','794');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SW18','794');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SW19','794');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SW1P','464');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SW20','794');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SY2','452');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('SY2','774');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('TA1','459');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('TR1','477');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('TS1','460');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('TW7','475');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('WA1','462');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('WA16','767');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('WC2A','626');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('WR1','466');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('WV1','421');
Insert into JUROR.COURT_CATCHMENT_AREA (POSTCODE,LOC_CODE) values ('YO1','467');
