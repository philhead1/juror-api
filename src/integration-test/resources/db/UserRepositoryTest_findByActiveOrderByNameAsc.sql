INSERT INTO juror_mod.users (username,email, name, active, team_id, user_type)
VALUES ('jpowers','jpowers@email.gov.uk', 'Joanna Powers', true, 1,'BUREAU'),
       ('tsanchez','tsanchez@email.gov.uk', 'Todd Sanchez', true, 2,'BUREAU'),
       ('gbeck','gbeck@email.gov.uk', 'Grant Beck', true, 3,'BUREAU'),
       ('rprice','rprice@email.gov.uk', 'Roxanne Price', true, 1,'BUREAU'),
       ('pbrewer','pbrewer@email.gov.uk', 'Preston Brewer', true, 2,'BUREAU'),
       ('acopeland','acopeland@email.gov.uk', 'Amelia Copeland', true, 3,'BUREAU'),
       ('jphillips','jphillips@email.gov.uk', 'Joan Phillips', false, 1,'BUREAU'),
       ('srogers','srogers@email.gov.uk', 'Shawn Rogers', false, 2,'BUREAU'),
       ('pbrooks','pbrooks@email.gov.uk', 'Paul Brooks', false, 3,'BUREAU');

insert into juror_mod.user_courts (username, loc_code)
values ('jpowers', '400'),
       ('tsanchez', '400'),
       ('gbeck', '400'),
       ('rprice', '415'),
       ('pbrewer', '400'),
       ('acopeland', '400'),
       ('jphillips', '400'),
       ('srogers', '400'),
       ('pbrooks', '400');
