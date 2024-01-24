delete from juror_mod.pool_history;
DELETE FROM juror_mod.juror_history;
DELETE FROM juror_mod.juror_audit;
delete from juror_digital.staff;

-- Create pool request records associated with juror records
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
	 ('400', '415220503',  CURRENT_DATE + 7, 4, 4, 'CRO', '415', 'N', TIMESTAMP'2022-03-02 09:22:09.0');

-- Pool 415220504 requested 4 jurors for TIMESTAMP'2023-06-12 00:00:00.000000', none currently supplied (4 needed) - active with the court
INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE, LOC_CODE, NEW_REQUEST, LAST_UPDATE) VALUES
	 ('415', '415220504', CURRENT_DATE + 7, 4, 4, 'CRO', '415', 'N', TIMESTAMP'2022-03-02 09:22:09.0');

-- Create POOL records associated with DEFER_DBF records
INSERT INTO juror_mod.juror (juror_number,poll_number,last_name,first_name,dob,address_line_1,address_line_2,postcode,responded,user_edtq,no_def_pos,notifications,notes,optic_reference) VALUES
	 ('555555551','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,'12345678'),
	 ('555555552','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555553','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555554','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555555','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555556','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',0,0,NULL,NULL),
	 ('555555557','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',1,0,NULL,'12345678'),
	 ('555555559','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',1,0,NULL,NULL),
	 ('123456789','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',1,0,NULL,NULL),
	 ('444444444','540','LNAMEFIVEFOURZERO','FNAMEFIVEFOURZERO','1990-07-25 00:00:00','540 STREET NAME','ANYTOWN','CH1 2AN','Y','BUREAU_USER_1',1,0,NULL,NULL);

INSERT INTO juror_mod.juror_pool ("owner",juror_number,pool_number,def_date,user_edtq,status,is_active,
pool_seq,"location",on_call) VALUES
	 ('400','555555551','415220401','2023-05-30 00:00:00','BUREAU_USER_1',1,'Y','0109','415','N'),
	 ('400','555555552','415220401','2023-05-30 00:00:00','BUREAU_USER_1',2,'Y','0109','415','N'),
	 ('400','555555553','415220401','2023-05-30 00:00:00','BUREAU_USER_1',11,'Y','0109','415','N'),
	 ('400','555555554','415220401','2023-05-30 00:00:00','BUREAU_USER_1',1,'Y','0109','415','N'),
	 ('400','555555555','415220502','2023-06-01 00:00:00','BUREAU_USER_1',2,'Y','0109','415','N'),
	 ('400','555555556','415220502','2023-06-01 00:00:00','BUREAU_USER_1',11,'Y','0109','415','N'),
	 ('400','555555557','415220504','2023-06-26 00:00:00','BUREAU_USER_1',7,'Y','0109','415','N'),
	 ('400','555555559','415220401','2023-06-12 00:00:00','BUREAU_USER_1',7,'Y','0109','415','N'),
	 ('415','123456789','415220504','2023-06-26 00:00:00','BUREAU_USER_1',7,'Y','0109','415','N'),
	 ('415','444444444','415220401','2023-06-12 00:00:00','BUREAU_USER_1',7,'Y','0109','415','N');