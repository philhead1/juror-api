INSERT INTO JUROR_MOD.POOL (OWNER, POOL_NO, RETURN_DATE, TOTAL_NO_REQUIRED, NO_REQUESTED, POOL_TYPE, LOC_CODE, NEW_REQUEST, LAST_UPDATE)
VALUES ('415', '416220901', TIMESTAMP'2023-05-30 00:00:00.000000', 5, 5, 'CRO','415', 'N', TIMESTAMP'2022-02-02 09:22:09.0'),
       ('415', '416220902', TIMESTAMP'2023-05-30 00:00:00.000000', 5, 5, 'CRO','415', 'N', TIMESTAMP'2022-02-02 09:22:09.0'),
       ('416', '416220903', TIMESTAMP'2023-05-30 00:00:00.000000', 5, 5, 'CRO','415', 'N', TIMESTAMP'2022-02-02 09:22:09.0');

INSERT INTO juror_mod.juror (juror_number,poll_number,first_name,last_name,address_line_1,address_line_2,postcode,
responded,notifications, m_phone, h_phone, completion_date) VALUES
	 ('415000001','19','FIRSTNAMEONE','LASTNAMEONE','19 STREET NAME','ANYTOWN','CH3 2AR','N',0,
	 '44776-301-1110','44776-301-2222','2023-01-01'),
	 ('415000002','4','FIRSTNAMETWO','LASTNAMETWO','4 STREET NAME','ANYTOWN','CH1 2AN','N',0,
	 '44776-301-1111','44776-301-1110','2023-01-30'),
	 ('415000003','11','FIRSTNAMETHREE','LASTNAMETHREE','11 STREET NAME','ANYTOWN','CH2 2AB','N',
	 0, '44776-301-1110','44776-301-1110','2023-01-28'),
	 ('415000004','13','FIRSTNAMEFOUR','LASTNAMEFOUR','13 STREET NAME','ANYTOWN','CH2 2AB','N',
	 0,'44776-301-1110', '44141101-1112','2023-01-30'),
	 ('415000005','16','FIRSTNAMEFIVE','LASTNAMEFIVE','16 STREET NAME','ANYTOWN','CH1 2AN','N',0,
	 '44776-301-1110', '44776-301-1110','2023-01-30'),
	 ('415000006','7','FIRSTNAMESIX','LASTNAMESIX','7 STREET NAME','ANYTOWN','CH1 2AN','N',0,
	 '44776-301-1110', '44776-301-1110','2023-02-01'),
	 ('415000007','1','FIRSTNAMESEVEN','LASTNAMESEVEN','1 STREET NAME','ANYTOWN','CH1 2AN','N',0,
	 '44776-301-1110', '44776-301-1110','2023-01-30'),
	 ('415000008','18','FIRSTNAMEEIGHT','LASTNAMEEIGHT','18 STREET NAME','ANYTOWN','CH3 2AR','N',
	 0,'44776-301-1110', '44776-301-1110','2023-01-30'),
     ('415000009','18','FIRSTNAMENINE','LASTNAMENINE','18 STREET NAME','ANYTOWN','CH3 2AR','N',0,
     '44776-301-1110', '44776-301-1110','2023-01-30');

INSERT INTO juror_mod.juror_pool ("owner",juror_number,pool_number,status,is_active,pool_seq,"location",on_call) VALUES
	 ('415','415000001','416220901',1,'Y','01','415',true),
	 ('415','415000002','416220901',1,'Y','01','415',true),
	 ('415','415000003','416220901',1,'Y','01','415',false),
	 ('415','415000004','416220901',1,'Y','01','415',true),
	 ('415','415000005','416220901',1,'Y','01','415',false),
	 ('415','415000006','416220902',1,'Y','01','415','N'),
	 ('415','415000007','416220902',10,'Y','01','415','N'),
	 ('416','415000008','416220902',2,'Y','01','416','N'),
	 ('416','415000009','416220902',2,'Y','01','416','N');