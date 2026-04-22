-- Sample HR database (simplified Oracle HR schema for MySQL)

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS regions;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE regions (
    region_id   BIGINT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
);

CREATE TABLE countries (
    country_id   VARCHAR(2) PRIMARY KEY,
    country_name VARCHAR(60) NOT NULL,
    region_id    BIGINT,
    CONSTRAINT fk_countries_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

CREATE TABLE locations (
    location_id    BIGINT PRIMARY KEY,
    city           VARCHAR(50),
    street_address VARCHAR(120),
    country_id     VARCHAR(2),
    CONSTRAINT fk_locations_country FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE departments (
    department_id   BIGINT PRIMARY KEY,
    department_name VARCHAR(60) NOT NULL,
    location_id     BIGINT,
    manager_id      BIGINT,
    CONSTRAINT fk_departments_location FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE employees (
    employee_id  BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name   VARCHAR(40),
    last_name    VARCHAR(40) NOT NULL,
    email        VARCHAR(80),
    phone_number VARCHAR(40),
    salary       DOUBLE,
    hire_date    DATE,
    department_id BIGINT,
    CONSTRAINT fk_employees_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

ALTER TABLE departments
    ADD CONSTRAINT fk_departments_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

INSERT INTO regions (region_id, region_name) VALUES
(1, 'Europe'),
(2, 'Americas'),
(3, 'Asia'),
(4, 'Middle East and Africa');

INSERT INTO countries (country_id, country_name, region_id) VALUES
('US', 'United States of America', 2),
('CA', 'Canada', 2),
('UK', 'United Kingdom', 1),
('DE', 'Germany', 1),
('GE', 'Georgia', 1),
('JP', 'Japan', 3),
('CN', 'China', 3);

INSERT INTO locations (location_id, city, street_address, country_id) VALUES
(1000, 'Seattle',        '2014 Jabberwocky Rd',    'US'),
(1100, 'South San Francisco', '2011 Interiors Blvd', 'US'),
(1200, 'Toronto',        '147 Spadina Ave',        'CA'),
(1300, 'London',         '8204 Arthur St',         'UK'),
(1400, 'Munich',         'Schwanthalerstr. 7031',  'DE'),
(1500, 'Tbilisi',        '1 Rustaveli Ave',        'GE'),
(1600, 'Tokyo',          '2017 Shinjuku-cho',      'JP'),
(1700, 'Beijing',        '40-5-12 Laogianggen',    'CN');

INSERT INTO departments (department_id, department_name, location_id, manager_id) VALUES
(10, 'Administration',  1700, NULL),
(20, 'Marketing',       1000, NULL),
(30, 'Purchasing',      1700, NULL),
(40, 'Human Resources', 1300, NULL),
(50, 'Shipping',        1500, NULL),
(60, 'IT',              1400, NULL),
(70, 'Public Relations',1700, NULL),
(80, 'Sales',           1100, NULL),
(90, 'Executive',       1700, NULL),
(100,'Finance',         1700, NULL),
(110,'Accounting',      1700, NULL);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, salary, hire_date, department_id) VALUES
(100, 'Steven',   'King',       'SKING',    '515.123.4567', 24000, '2003-06-17', 90),
(101, 'Neena',    'Kochhar',    'NKOCHHAR', '515.123.4568', 17000, '2005-09-21', 90),
(102, 'Lex',      'De Haan',    'LDEHAAN',  '515.123.4569', 17000, '2001-01-13', 90),
(103, 'Alexander','Hunold',     'AHUNOLD',  '590.423.4567',  9000, '2006-01-03', 60),
(108, 'Nancy',    'Greenberg',  'NGREENBE', '515.124.4569', 12000, '2002-08-17', 100),
(114, 'Den',      'Raphaely',   'DRAPHEAL', '515.127.4561', 11000, '2002-12-07', 30),
(121, 'Adam',     'Fripp',      'AFRIPP',   '650.123.2234',  8200, '2005-04-10', 50),
(145, 'John',     'Russell',    'JRUSSEL',  '011.44.1344.429268', 14000, '2004-10-01', 80),
(200, 'Jennifer', 'Whalen',     'JWHALEN',  '515.123.4444',  4400, '2003-09-17', 10),
(201, 'Michael',  'Hartstein',  'MHARTSTE', '515.123.5555', 13000, '2004-02-17', 20),
(203, 'Susan',    'Mavris',     'SMAVRIS',  '515.123.7777',  6500, '2002-06-07', 40),
(204, 'Hermann',  'Baer',       'HBAER',    '515.123.8888', 10000, '2002-06-07', 70),
(205, 'Shelley',  'Higgins',    'SHIGGINS', '515.123.8080', 12008, '2002-06-07', 110),
(300, 'Tatia',    'Tsikhelashvili', 'TTSIKHEL', '995.32.1234567', 15000, '2024-09-01', 60);

UPDATE departments SET manager_id = 200 WHERE department_id = 10;
UPDATE departments SET manager_id = 201 WHERE department_id = 20;
UPDATE departments SET manager_id = 114 WHERE department_id = 30;
UPDATE departments SET manager_id = 203 WHERE department_id = 40;
UPDATE departments SET manager_id = 121 WHERE department_id = 50;
UPDATE departments SET manager_id = 103 WHERE department_id = 60;
UPDATE departments SET manager_id = 204 WHERE department_id = 70;
UPDATE departments SET manager_id = 145 WHERE department_id = 80;
UPDATE departments SET manager_id = 100 WHERE department_id = 90;
UPDATE departments SET manager_id = 108 WHERE department_id = 100;
UPDATE departments SET manager_id = 205 WHERE department_id = 110;
