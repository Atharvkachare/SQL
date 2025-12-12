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

-- 11. Write a MySQL query to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion. --
create table if not exists countries3( COUNTRY_ID varchar(2) not null unique primary key, COUNTRY_NAME varchar(40) not null, REGION_ID decimal(10,0) not null);
desc countries3;

-- 12. Write a MySQL query to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value. --
create table if not exists countries4(COUNTRY_ID integer not null unique auto_increment primary key, COUNTRY_NAME varchar(40) not null, REGION_ID decimal(10,0) not null);
desc countries4;

-- 13. Write a MySQL query to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique. --
create table if not exists countries5( COUNTRY_ID varchar(2) not null unique, COUNTRY_NAME varchar(40) not null, REGION_ID decimal(10,0) not null, primary key( COUNTRY_ID, REGION_ID));  
desc countries5;

-- 14. Write a MySQL query to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table. --
create table if not exists job_history1( EMPLOYEE_ID decimal(10,0) not null, START_DATE date not null, END_DATE date not null, JOB_ID varchar(10) not null, DEPARTMENT_ID decimal(40,0) default null, foreign key(JOB_ID) references jobs1(JOB_ID));
desc job_history1;

-- 15. Write a MySQL query to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table. --
create table Employees(
  EMP_ID varchar(20) not null unique,
  FIRST_NAME varchar(20),
  LAST_NAME varchar(20),
  EMAIL varchar(40),
  PHONE_NO integer,
  HIRE_DATE date,
  JOB_ID varchar(40),
  commission varchar(20),
  MANAGER_ID varchar(40),
  DEPARTMENT_ID varchar(40),
  foreign key(DEPARTMENT_ID) references departments(DEPARTMENT_ID)
);
-- 16. Write a MySQL query to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables.
-- "A foreign key constraint is not required merely to join two tables. For storage engines other than InnoDB, it is possible when defining a column to use a REFERENCES tbl_name(col_name) clause, which has no actual effect, and serves only as a memo or comment to you that the column which you are currently defining is intended to refer to a column in another table "- Reference --
-- Creating a table named 'employees' if it doesn't already exist to store employee information

CREATE TABLE IF NOT EXISTS employees(
    EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
    FIRST_NAME varchar(20) DEFAULT NULL,
    LAST_NAME varchar(25) NOT NULL,
    EMAIL varchar(25) NOT NULL,
    PHONE_NUMBER varchar(20) DEFAULT NULL,
    HIRE_DATE date NOT NULL,
    JOB_ID varchar(10) NOT NULL,
    SALARY decimal(8,2) DEFAULT NULL,
    COMMISSION_PCT decimal(2,2) DEFAULT NULL,
    MANAGER_ID decimal(6,0) DEFAULT NULL,
    DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
    FOREIGN KEY(DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
    FOREIGN KEY(JOB_ID) REFERENCES jobs(JOB_ID)
)
ENGINE=InnoDB;

