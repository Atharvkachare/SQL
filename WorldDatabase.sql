create database world;
use world;
-- 1. Write a MySQL query to create a simple table countries including columns country_id, country_name and region_id. --
create table countries( COUNTRY_ID varchar(2), COUNRY_NAME varchar(20), REGION_ID decimal(10,0));

-- 2. Write a MySQL query to create a simple table countries including columns country_id, country_name and region_id which is already exists. --
create table if not exists countries( COUNTRY_ID varchar(2), COUNTRY_NAME varchar(20), REGION_ID decimal(10,0));

-- 3. Write a MySQL query to create the structure of a table dup_countries similar to countries.  --
create table if not exists dup_countries like countries;
desc dup_countries;

-- 4. Write a MySQL query to create a duplicate copy of countries table including structure and data by name dup_countries. --
create table if not exists dupt_countries as select * from countries;
desc dupt_countries;

-- 5. Write a MySQL query to create a table countries set a constraint NOT NULL. --
create table if not exists countries( COUNTRY_ID varchar(2) not null, COUNTRY_NAME varchar(20) not null, REGION_ID decimal(10,0) not null );
desc countries;

-- 6. Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000 --
create table jobs( JOB_ID varchar(10) not null, JOB_TITLE varchar(20) not null, MIN_SALARY DECIMAL(6,0), MAX_SALARY decimal(6,0) check(MAX_SALARY<=25000));
desc jobs;

-- 7. Write a MySQL query to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table. --
create table if not exists countries( COUNTRY_ID VARCHAR(2), COUNTRY_NAME varchar(40) check(COUNTRY_NAME IN ('Italy', 'India', 'China')), region_id decimal(10,0));

-- 8. Write a MySQL query to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.  --
create table job_history( EMPLOYEE_ID decimal(20) not null, START_DATE date not null, END_DATE date not null check(END_DATE like '--/--/----'), JOB_ID decimal(40,0), DEPARTMENT_ID decimal(40, 0) not null );
desc job_history;

-- 9. Write a MySQL query to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion. --
create table if not exists countries(COUNTRY_ID varchar(20) not null, COUNTRY_NAME varchar(20) not null, REGION_ID decimal(40,0) not null, unique(COUNTRY_ID) );
desc countries;

-- 10. Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns --
create table if not exists jobs1(JOB_ID varchar(10) not null unique, JOB_TITLE varchar(40) not null default '   ', MIN_SALARY decimal(6,0) default 8000, MAX_SALARY decimal(6,0) default null);
desc jobs1;

