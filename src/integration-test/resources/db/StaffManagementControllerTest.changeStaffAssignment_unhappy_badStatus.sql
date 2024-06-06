INSERT INTO juror_mod.users (username,email, name, active,team_id,user_type)
VALUES ('jmcbob','jmcbob@email.gov.uk','Joe McBob',true,1,'BUREAU'),
       ('smcbob','smcbob@email.gov.uk','Sarah McBob',true,2,'BUREAU');


insert into juror_mod.user_courts (username, loc_code)
values ('jmcbob', '400'),
       ('smcbob', '400');

INSERT INTO juror_mod.user_roles (username, role)
VALUES ('smcbob', 'MANAGER');
INSERT INTO juror_mod.pool (pool_no,"owner",return_date,no_requested,pool_type,loc_code,new_request,last_update,additional_summons,attend_time,nil_pool,total_no_required,date_created) VALUES
                                                                                                                                                                                            ('555','400','2022-05-03',5,'CRO','448','N',NULL,NULL,NULL,false,5,NULL),
                                                                                                                                                                                            ('222','400','2022-05-03',5,'CRO','448','N',NULL,NULL,NULL,false,5,NULL);
INSERT INTO juror_mod.juror (juror_number,poll_number,title,last_name,first_name,dob,address_line_1,address_line_2,address_line_3,address_line_4,address_line_5,postcode,h_phone,w_phone,w_ph_local,responded,date_excused,excusal_code,acc_exc,date_disq,disq_code,user_edtq,notes,no_def_pos,perm_disqual,reasonable_adj_code,reasonable_adj_msg,smart_card_number,completion_date,sort_code,bank_acct_name,bank_acct_no,bldg_soc_roll_no,welsh,police_check,last_update,summons_file,m_phone,h_email,contact_preference,notifications,date_created,optic_reference,pending_title,pending_first_name,pending_last_name,mileage,financial_loss,travel_time,bureau_transfer_date,claiming_subsistence_allowance,service_comp_comms_status,login_attempts,is_locked) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ('586856851','19917','REV','BROWN','CYNTHIA','1987-05-08 00:00:00','7 Lunder Park','England','Weston','United Kingdom',NULL,'GU32SW','44(211)698-2662','44(551)736-7419',NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,'NOT_CHECKED','2024-03-12 12:21:04',NULL,'44(520)949-8284','cbrown1@yellowpages.com',0,0,'2024-03-12 12:21:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,0,false),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ('586856852','19917','DR','PENNYWHISTLE','DOLORES','1981-01-01 00:00:00','8 Lunder Park','England','Weston','United Kingdom',NULL,'GU32SW','44(211)698-2663','44(551)736-7420',NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,'NOT_CHECKED','2024-03-12 12:21:04',NULL,'44(520)949-8285','dpennywhistle@hotmail.com',0,0,'2024-03-12 12:21:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,0,false),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ('586856853','19917','MR','HOLLISTER','HERBERT','1985-01-01 00:00:00','9 Lunder Park','England','Weston','United Kingdom',NULL,'GU32SW','44(211)698-4543','44(551)736-3651',NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,'NOT_CHECKED','2024-03-12 12:21:04',NULL,'44(520)870-0462','doubleH@lycos.co.uk',0,0,'2024-03-12 12:21:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,0,false),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ('644892530','21112','DR','CASTILLO','JANE','1984-07-24 00:00:00','4 Knutson Trail','Scotland','Aberdeen','United Kingdom',NULL,'AB3 9RY','44(703)209-6993','44(109)549-5625',NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,'NOT_CHECKED','2024-03-12 12:21:04',NULL,'44(145)525-2390','jcastillo0@ed.gov',0,0,'2024-03-12 12:21:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,0,false);
INSERT INTO juror_mod.juror_pool (juror_number,pool_number,"owner",user_edtq,is_active,status,times_sel,def_date,"location",no_attendances,no_attended,no_fta,no_awol,pool_seq,edit_tag,next_date,on_call,smart_card,was_deferred,deferral_code,id_checked,postpone,paid_cash,scan_code,last_update,reminder_sent,transfer_date,date_created) VALUES
                                                                                                                                                                                                                                                                                                                                                  ('586856851','222','400',NULL,true,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,false,NULL,NULL,false,false,NULL,'2024-03-12 12:21:04',false,NULL,NULL),
                                                                                                                                                                                                                                                                                                                                                  ('586856852','222','400',NULL,true,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,false,NULL,NULL,false,false,NULL,'2024-03-12 12:21:04',false,NULL,NULL),
                                                                                                                                                                                                                                                                                                                                                  ('586856853','222','400',NULL,true,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,false,NULL,NULL,false,false,NULL,'2024-03-12 12:21:04',false,NULL,NULL),
                                                                                                                                                                                                                                                                                                                                                  ('644892530','555','400',NULL,true,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,false,NULL,NULL,false,false,NULL,'2024-03-12 12:21:04',false,NULL,NULL);
INSERT INTO juror_mod.juror_response (juror_number,date_received,title,first_name,last_name,address_line_1,address_line_2,address_line_3,address_line_4,address_line_5,postcode,processing_status,date_of_birth,phone_number,alt_phone_number,email,residency,residency_detail,mental_health_act,mental_health_capacity,mental_health_act_details,bail,bail_details,convictions,convictions_details,deferral,deferral_reason,deferral_date,reasonable_adjustments_arrangements,excusal,excusal_reason,processing_complete,signed,"version",thirdparty_fname,thirdparty_lname,relationship,main_phone,other_phone,email_address,thirdparty_reason,thirdparty_other_reason,juror_phone_details,juror_email_details,staff_login,staff_assignment_date,urgent,completed_at,welsh,reply_type) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ('586856851','2024-03-12 00:00:00','REV','CYNTHIA','BROWN','7 Lunder Park','England','Weston','United Kingdom',NULL,'GU32SW','AWAITING_COURT_REPLY','1987-05-08','44(211)698-2662','44(551)736-7419','cbrown1@yellowpages.com',true,NULL,false,NULL,NULL,false,NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,false,'jmcbob','2024-03-11 00:00:00',false,NULL,false,'Digital'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ('586856852','2024-03-12 00:00:00','DR','DOLORES','PENNYWHISTLE','8 Lunder Park','England','Weston','United Kingdom',NULL,'GU32SW','AWAITING_TRANSLATION','1981-01-01','44(211)698-2663','44(551)736-7420','dpennywhistle@hotmail.com',true,NULL,false,NULL,NULL,false,NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,false,'jmcbob','2024-03-11 00:00:00',false,NULL,false,'Digital'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ('586856853','2024-03-12 00:00:00','MR','HERBERT','HOLLISTER','9 Lunder Park','England','Weston','United Kingdom',NULL,'GU32SW','TODO','1985-01-01','44(211)698-4543','44(551)736-3651','doubleH@lycos.co.uk',true,NULL,false,NULL,NULL,false,NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,false,'jmcbob','2024-03-11 00:00:00',false,NULL,false,'Digital'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ('644892530','2024-03-12 00:00:00','DR','JANE','CASTILLO','4 Knutson Trail','Scotland','Aberdeen','United Kingdom',NULL,'AB3 9RY','AWAITING_CONTACT','1984-07-24','44(703)209-6993','44(109)549-5625','jcastillo0@ed.gov',true,NULL,false,NULL,NULL,false,NULL,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,false,false,'jmcbob','2024-03-11 00:00:00',false,NULL,false,'Digital');
