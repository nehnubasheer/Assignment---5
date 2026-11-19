CREATE DATABASE employee;
USE employee;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
DESC Departments;
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);
DESC Location;
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
DESC Employees;

INSERT INTO Departments
VALUES
(101,'Construction'),
(102,'Finance'),
(103,'IT'),
(104,'Engineering'),
(105,'Sales');
SELECT * FROM Departments;
INSERT INTO Location (location_name)
VALUES
('Kottayam'),
('Kochi'),
('Trivandrum'),
('Idukki'),
('Kannur');
SELECT * FROM Location;
INSERT INTO Employees
(employee_id, employee_name, gender, age, designation, department_id, location_id)
VALUES
(1001,'Ritha','M',23,'HR Manager',101,1),

(1002,'Nima','F',26,'Financial Analyst',102,2),

(1003,'Binu','M',25,'Software Engineer',103,3),

(1004,'Sini','F',30,'Marketing Executive',104,4),

(1005,'Miya','M',29,'Operations Manager',105,5);
SELECT * FROM Employees;

ALTER TABLE Employees
ADD email VARCHAR(150);

ALTER TABLE Employees
MODIFY designation VARCHAR(150);

ALTER TABLE Employees
DROP COLUMN age;

ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;

RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;
TRUNCATE TABLE Employees;
DROP DATABASE employee;
