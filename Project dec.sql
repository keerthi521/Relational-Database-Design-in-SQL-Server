CREATE DATABASE Project_Dec
use project_dec

CREATE TABLE Role
(id int primary key,
role_name varchar(100))

--Constraint role_id_pk primary key(id)

CREATE TABLE user_account
(id int primary key,
user_name varchar(100),
email varchar(254),
password varchar(200),
password_salt varchar(50) Not NULL,
Password_hash_algorithm varchar(50))

--constraint user_account_id_pk primary key(id)
--constraint user_account_password_salt_pk not null (password_salt)

CREATE TABLE Status
(id int primary key,
Status_name varchar(100),
 is_user_working bit)

--constraint status_id_pk primary key(id)

CREATE TABLE User_has_role
(id int primary key,
role_start_time datetime,
role_end_time datetime not null,
user_account_id int foreign key references user_account(id),
role_id int foreign key references status(id))

--constraint PK__User_has__3213E83F6327704E      

CREATE TABLE User_has_status
(id int primary key,
status_start_time datetime,
status_end_time datetime not null,
user_account_id int foreign key references user_account(id),
status_id int foreign key references status(id))

--constraint PK__User_has__3213E83FB0E8F3D9    

INSERT INTO Role(id,role_name)
Values(1,'Sale'),
      (2,'Technical')

Select * from Role

INSERT INTO Status(id,Status_name,is_user_working)
values(1,'new status',1),
(2,'new status',1)

Select * from Status

INSERT INTO user_account(id,user_name,email,password,password_salt,Password_hash_algorithm)
values(1,'kera','keer@aa','kaa','kaas','gudsk'),
(2,'Rahu','ragh@aa','raa','raag','gvsuh')

Select * from user_account

INSERT INTO User_has_role(id,role_start_time,role_end_time,user_account_id,role_id)
Values(1,'2023-09-28 01:45:33', '2024-10-23 09:33:22',1, 1),
(2,'2020-02-22 10:23:45', '2019-05-16 07:10:22',2, 2);

SELECT * FROM User_has_role

INSERT INTO User_has_status
Values(1,'2008-10-22 10:45:23', '2009-03-23 12:45:14',1, 1),
(2,'2010-10-10 20:45:33', '2000-08-03 17:20:22',2, 2);

SELECT * FROM User_has_status

-- Delete all the data from each of the table

ALTER TABLE user_has_status NOCHECK CONSTRAINT ALL;
ALTER TABLE user_has_role NOCHECK CONSTRAINT ALL;
DELETE FROM user_has_status;
DELETE FROM user_has_role;
DELETE FROM user_account;
DELETE FROM status;
DELETE FROM role;
ALTER TABLE user_has_status CHECK CONSTRAINT ALL;
ALTER TABLE user_has_role CHECK CONSTRAINT ALL;

DELETE FROM user_has_status;
DELETE FROM user_has_role;
DELETE FROM user_account;
DELETE FROM status;
DELETE FROM role;

SELECT * FROM User_has_status




