# Assignment---5
### Table Creation (CREATE):

CREATE DATABASE employee;

USE employee;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    age INT,
    designation VARCHAR(50),
    hire_date DATE DEFAULT (CURRENT_DATE),
    department_id INT,
    location_id INT,

CONSTRAINT chk_gender
        CHECK (gender IN ('M', 'F')),

CONSTRAINT chk_age
        CHECK (age >= 18),

CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

CONSTRAINT fk_location
        FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);

### Table Alteration (ALTER): 

ALTER TABLE Employees
ADD email VARCHAR(150);

ALTER TABLE Employees
MODIFY designation VARCHAR(150);

ALTER TABLE Employees
DROP COLUMN age;

ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;

### Table Renaming (RENAME):

RENAME TABLE Departments TO Departments_Info;

RENAME TABLE Location TO Locations;

### Table Truncation (TRUNCATE)

TRUNCATE TABLE Employees;

### Database & Table Dropping (DROP):

DROP DATABASE employee;
