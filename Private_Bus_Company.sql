CREATE DATABASE Private_Bus_Company;

USE Private_Bus_Company;


-- creating tables


CREATE TABLE EMPLOYEE(
    EmployeeID VARCHAR(10) PRIMARY KEY,
    Salary DECIMAL(10, 2) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    AddressNo VARCHAR(20),
    AddressStreet VARCHAR(100),
    AddressCity VARCHAR(100),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100),
    Birthday DATE NOT NULL
);


CREATE TABLE EMPLOYEE_CONTACT(
    EmployeeID VARCHAR(10),
    ContactNo VARCHAR(15),

    PRIMARY KEY(EmployeeID,ContactNo),

    FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE MANAGER(
    EmployeeID VARCHAR(10) NOT NULL ,
    Area VARCHAR(50) NOT NULL ,
    Experience INT ,
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE DRIVER (
    LicenceNo VARCHAR(20),
    EmployeeID VARCHAR(10),
    LicenceType VARCHAR(20),
    LeaderID VARCHAR(20),
    PRIMARY KEY (LicenceNo, EmployeeID),
    UNIQUE (EmployeeID),
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE DRIVER_EXPERIENCE (
    EmployeeID VARCHAR(10) PRIMARY KEY,
    Experience INT,
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE SUPERVISOR(
    SupervisorID VARCHAR(20) PRIMARY KEY,
    EmployeeID VARCHAR(10) NOT NULL UNIQUE ,   
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE ROUTE(
    RouteNo INT PRIMARY KEY,
    SupervisorID VARCHAR(20) ,   
    Distance INT NOT NULL ,
    Duration INT ,
    Start VARCHAR(50) NOT NULL ,
    End VARCHAR(50) NOT NULL ,
    FOREIGN KEY (SupervisorID) REFERENCES SUPERVISOR(SupervisorID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);




CREATE TABLE BUS_SCHEDULE(
    ScheduleID VARCHAR(10) PRIMARY KEY,
    RouteNo INT NOT NULL ,
    StartTime TIME NOT NULL ,
    EndTime TIME NOT NULL ,
    FOREIGN KEY (RouteNo) REFERENCES ROUTE(RouteNo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE DEPOT(
    DepotID VARCHAR(10) PRIMARY KEY,
    Capacity INT,
    ContactNo VARCHAR(15) NOT NULL UNIQUE 
);



CREATE TABLE BUS(
    BusID VARCHAR(10) PRIMARY KEY,
    ScheduleID VARCHAR(10),
    DepotID VARCHAR(10) ,
    Brand VARCHAR(20),
    Efficiency INT,
    Capacity INT,
    Year YEAR,
    Category VARCHAR(20) NOT NULL ,
    FOREIGN KEY (ScheduleID) REFERENCES BUS_SCHEDULE(ScheduleID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
	FOREIGN KEY (DepotID) REFERENCES DEPOT(DepotID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



CREATE TABLE FARE(
    FareID VARCHAR(20) PRIMARY KEY,
    RouteNo INT NOT NULL ,   
    PriceRate DECIMAL(10, 2) NOT NULL ,
    TicketType VARCHAR(50) NOT NULL ,
    FOREIGN KEY (RouteNo) REFERENCES ROUTE(RouteNo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE MAINTENANCE(
    ServiceID VARCHAR(20) PRIMARY KEY,
    BusID VARCHAR(10) ,   
    LastTireChange DATE,
    LastTireBrand VARCHAR(50),
    LastBrakeChange DATE,
    LastOilChange DATE,
    LastOilBrand VARCHAR(50),
    LastService DATE,
    FOREIGN KEY (BusID) REFERENCES BUS(BusID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



CREATE TABLE SERVICE_COST(
    ServiceID VARCHAR(20),
    Amount DECIMAL(10, 2) NOT NULL ,
    Payment_method VARCHAR(20) NOT NULL ,
    FOREIGN KEY (ServiceID) REFERENCES MAINTENANCE(ServiceID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE FUEL(
    BillNo VARCHAR(20) PRIMARY KEY,
    BusID VARCHAR(10) ,
    FillDate DATE NOT NULL ,
    Volume FLOAT NOT NULL ,
    FOREIGN KEY (BusID) REFERENCES BUS(BusID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



CREATE TABLE FUEL_COST(
    BillNo VARCHAR(20) NOT NULL ,
    Amount DECIMAL(10, 2) NOT NULL ,
    Payment_method VARCHAR(20),
    FOREIGN KEY (BillNo) REFERENCES FUEL(BillNo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);





-- insert data 

USE Private_Bus_Company;

-- Inserting data into EMPLOYEE
INSERT INTO EMPLOYEE (EmployeeID, Salary, Position, AddressNo, AddressStreet, AddressCity, FirstName, LastName, Birthday)
VALUES 
('EMP001', 60000.00, 'Manager', '123', 'Galle Road', 'Colombo', 'Saman', 'Perera', '1980-05-15'),
('EMP002', 62000.00, 'Manager', '456', 'Mahaweli Mawatha', 'Kandy', 'Malini', 'Silva', '1978-09-20'),
('EMP003', 48000.00, 'Driver', '789', 'Dutch Hospital Street', 'Galle', 'Nimal', 'Fernando', '1985-03-10'),
('EMP004', 48000.00, 'Driver', '1011', 'Nupe Junction', 'Matara', 'Kumari', 'Ratnayake', '1987-07-08'),
('EMP005', 48000.00, 'Driver', '1213', 'Hospital Road', 'Jaffna', 'Lalith', 'Bandara', '1989-12-25'),
('EMP006', 48000.00, 'Driver', '1415', 'Temple Street', 'Trincomalee', 'Kusum', 'Fernando', '1986-08-30'),
('EMP007', 48000.00, 'Driver', '1617', 'Main Street', 'Negombo', 'Sujatha', 'Silva', '1984-04-05'),
('EMP008', 48000.00, 'Driver', '1819', 'Police Station Road', 'Anuradhapura', 'Sunil', 'Perera', '1990-06-12'),
('EMP009', 48000.00, 'Driver', '2021', 'Bazar Street', 'Polonnaruwa', 'Nilmini', 'Fernando', '1992-02-18'),
('EMP010', 48000.00, 'Driver', '2223', 'Railway Avenue', 'Batticaloa', 'Ranjan', 'Silva', '1983-10-07'),
('EMP011', 55000.00, 'Supervisor', '2425', 'Church Road', 'Kalutara', 'Chandrika', 'Perera', '1982-06-25'),
('EMP012', 57000.00, 'Supervisor', '2627', 'Station Road', 'Ratnapura', 'Sarath', 'Fernando', '1981-11-12'),
('EMP013', 56000.00, 'Supervisor', '2829', 'Market Street', 'Kegalle', 'Malini', 'Silva', '1980-08-20'),
('EMP014', 49000.00, 'Driver', '3031', 'Court Road', 'Hambantota', 'Nalaka', 'Ranasinghe', '1984-04-15'),
('EMP015', 49000.00, 'Driver', '3233', 'Lake Road', 'Badulla', 'Saman', 'Jayawardena', '1986-09-30') ,
('EMP016', 63000.00, 'Manager', '363', 'Victoria Gardens', 'Colombo', 'Nishantha', 'Fernando', '1975-08-10'),
('EMP017', 60000.00, 'Manager', '3435', 'Beach Road', 'Galle', 'Chaminda', 'Perera', '1979-02-28'),
('EMP018', 62000.00, 'Manager', '3637', 'River View', 'Kandy', 'Anuradha', 'Silva', '1977-11-05'),
('EMP019', 64000.00, 'Manager', '3839', 'Mountain View', 'Nuwara Eliya', 'Rukmal', 'Fernando', '1974-07-22'),
('EMP020', 55000.00, 'Supervisor', '4041', 'Harbour Road', 'Colombo', 'Kasun', 'Jayasuriya', '1982-03-15'),
('EMP021', 57000.00, 'Supervisor', '4243', 'Forest Avenue', 'Kandy', 'Indika', 'Rathnayake', '1981-01-18'),
('EMP022', 59000.00, 'Supervisor', '4445', 'Lake Side', 'Anuradhapura', 'Dilhani', 'Silva', '1978-09-05');


INSERT INTO EMPLOYEE_CONTACT(EmployeeID, ContactNo)
VALUES
('EMP001','0711234567'),
('EMP001','0722345678'),
('EMP002','0743456789'),
('EMP002','0774567890'),
('EMP003','0765678901'),
('EMP003','0786789012'),
('EMP003','0717890123'),
('EMP004','0728901234'),
('EMP004','0749012345'),
('EMP005','0770123456'),
('EMP006','0761234567'),
('EMP007','0782345678'),
('EMP008','0713456789'),
('EMP009','0724567890'),
('EMP010','0745678101'),
('EMP011','0745628901'),
('EMP011','0745598901'),
('EMP011','0745678901'),
('EMP012','0745679741'),
('EMP013','0745675971'),
('EMP014','0745673141'),
('EMP015','0745670001'),
('EMP015','0745675661'),
('EMP015','0745677411'),
('EMP016','0745658121'),
('EMP017','0775678121'),
('EMP018','0755678121'),
('EMP019','0745672121'),
('EMP020','0745658121'),
('EMP021','0745679121'),
('EMP022','0777899433');


INSERT INTO MANAGER (EmployeeID, Area, Experience)
VALUES 
('EMP001', 'Operations', 5),
('EMP002', 'Finance', 6),
('EMP016', 'Human Resources', 5),
('EMP017', 'Transport', 5),
('EMP018', 'Director', 8),
('EMP019', 'General', 4);



-- Inserting records into the DRIVER table
INSERT INTO DRIVER (LicenceNo, EmployeeID, LicenceType,LeaderID)
VALUES 
('DL-001', 'EMP003', 'Expert',NULL),
('DL-002', 'EMP004', 'Beginer','DL-001'),
('DL-003', 'EMP005', 'Beginer','DL-001'),
('DL-004', 'EMP006','Expert',NULL),
('DL-005', 'EMP007', 'Intermediate','DL-004'),
('DL-006', 'EMP008', 'Intermediate','DL-004'),
('DL-007', 'EMP009', 'Intermediate','DL-004'),
('DL-008', 'EMP010', 'Intermediate','DL-001'),
('DL-009', 'EMP014', 'Intermediate','DL-001'),
('DL-010', 'EMP015', 'Beginer','DL-001');



-- Inserting records into the DRIVER_EXPERENCE table
INSERT INTO DRIVER_EXPERIENCE(EmployeeID,Experience)
VALUES
('EMP003',10),
('EMP004',1),
('EMP005',1),
('EMP006',6),
('EMP007',2),
('EMP008',3),
('EMP009',1),
('EMP010',4),
('EMP014',5),
('EMP015',1);


-- Inserting records into the SUPERVISOR table
INSERT INTO SUPERVISOR (SupervisorID, EmployeeID)
VALUES 
('SV-001', 'EMP011'),
('SV-002', 'EMP012'),
('SV-003', 'EMP013'),
('SV-004', 'EMP020'),
('SV-005', 'EMP021'),
('SV-006', 'EMP022');


-- Inserting records into the ROUTE table
INSERT INTO ROUTE (RouteNo, SupervisorID, Distance, Duration, Start, End)
VALUES 
(1, 'SV-001', 100, 120, 'Colombo', 'Kandy'),
(2, 'SV-002', 150, 150, 'Colombo', 'Matara'),
(3, 'SV-003', 80, 90, 'Gampaha', 'Polonnaruwa'),
(4, 'SV-001', 200, 180, 'Kadawatha', 'Jaffna'),
(5, 'SV-002', 120, 130, 'Colombo', 'Ratnapura'),
(6, 'SV-003', 140, 120, 'Colombo', 'Galle');


-- Inserting records into the BUS_SCHEDULE table
INSERT INTO BUS_SCHEDULE (ScheduleID, RouteNo, StartTime, EndTime)
VALUES 
('SCH-001', 1, '08:00:00', '10:00:00'),
('SCH-002', 2, '09:00:00', '12:00:00'),
('SCH-003', 3, '10:00:00', '12:30:00'),
('SCH-004', 4, '11:00:00', '14:30:00'),
('SCH-005', 5, '12:00:00', '14:00:00'),
('SCH-006', 1, '13:00:00', '15:00:00'),
('SCH-007', 2, '14:00:00', '17:00:00'),
('SCH-008', 3, '15:00:00', '17:30:00'),
('SCH-009', 4, '16:00:00', '19:30:00'),
('SCH-010', 5, '17:00:00', '19:00:00');


-- Insert records into the DEPOT table
INSERT INTO DEPOT (DepotID, Capacity, ContactNo)
VALUES 
('DEP001', 10, '0711234567'),
('DEP002', 5, '0712345678'),
('DEP003', 5, '0762345678'),
('DEP004', 3, '0722345678'),
('DEP005', 4, '0742345678'),
('DEP006', 10, '0773456789');



-- Insert records into the BUS table
INSERT INTO BUS (BusID, ScheduleID, DepotID, Brand, Efficiency, Capacity, Year, Category)
VALUES 
('BUS-001', 'SCH-001','DEP001', 'TATA', 90, 50, 2018, 'Express'),
('BUS-002', 'SCH-002','DEP003', 'TATA', 85, 45, 2017, 'Standard'),
('BUS-003', 'SCH-003','DEP002', 'Leyland', 92, 55, 2019, 'Luxury'),
('BUS-004', 'SCH-004','DEP001', 'Leyland', 88, 40, 2016, 'Express'),
('BUS-005', 'SCH-005','DEP002', 'HINO', 85, 50, 2015, 'Standard'),
('BUS-006', 'SCH-006','DEP003', 'HINO', 90, 60, 2020, 'Luxury'),
('BUS-007', 'SCH-007','DEP002', 'TATA', 92, 45, 2017, 'Express'),
('BUS-008', 'SCH-008','DEP001', 'TATA', 89, 55, 2018, 'Standard'),
('BUS-009', 'SCH-009','DEP002', 'Leyland', 86, 40, 2019, 'Luxury'),
('BUS-010', 'SCH-010','DEP001', 'HINO', 87, 50, 2016, 'Express');



-- Insert records into the FARE table with varying price rates
INSERT INTO FARE (FareID, RouteNo, PriceRate, TicketType)
VALUES 
('F1T1', 1, 250.00, 'full'),
('F1T2', 1, 150.00, 'half'),
('F2T1', 2, 300.00, 'full'),
('F2T2', 2, 180.00, 'half'),
('F3T1', 3, 280.00, 'full'),
('F3T2', 3, 160.00, 'half'),
('F4T1', 4, 220.00, 'full'),
('F4T2', 4, 130.00, 'half'),
('F5T1', 5, 270.00, 'full'),
('F5T2', 5, 160.00, 'half');





-- Insert records into the MAINTENANCE table
INSERT INTO MAINTENANCE (ServiceID, BusID, LastTireChange, LastTireBrand, LastBrakeChange, LastOilChange, LastOilBrand, LastService)
VALUES 
('SERV001', 'BUS-001', '2023-05-20', 'Michelin', '2023-04-15', '2023-03-10', 'Shell', '2023-05-25'),
('SERV002', 'BUS-002', '2023-04-18', 'Bridgestone', '2023-03-12', '2023-02-20', 'Castrol', '2023-05-28'),
('SERV003', 'BUS-003', '2023-06-05', 'Goodyear', '2023-05-02', '2023-04-10', 'Mobil', '2023-05-30'),
('SERV004', 'BUS-004', '2023-05-25', 'Continental', '2023-04-20', '2023-03-15', 'Total', '2023-06-01'),
('SERV005', 'BUS-005', '2023-04-30', 'Pirelli', '2023-03-25', '2023-02-28', 'BP', '2023-06-02'),
('SERV006', 'BUS-006', '2023-06-10', 'Firestone', '2023-05-05', '2023-04-20', 'ExxonMobil', '2023-06-03'),
('SERV007', 'BUS-007', '2023-05-15', 'Yokohama', '2023-04-10', '2023-03-05', 'Chevron', '2023-06-05'),
('SERV008', 'BUS-008', '2023-06-20', 'Hankook', '2023-05-15', '2023-04-10', 'Shell', '2023-06-07'),
('SERV009', 'BUS-009', '2023-05-28', 'Dunlop', '2023-04-25', '2023-03-20', 'Castrol', '2023-06-10'),
('SERV010', 'BUS-010', '2023-06-02', 'Michelin', '2023-05-30', '2023-04-25', 'Mobil', '2023-06-12');



-- Insert records into the SERVICE_COST table
INSERT INTO SERVICE_COST (ServiceID, Amount, Payment_method)
VALUES 
('SERV001', 1500.00, 'Credit Card'),
('SERV002', 1800.00, 'Cash'),
('SERV003', 2000.00, 'Bank Transfer'),
('SERV004', 1700.00, 'Cash'),
('SERV005', 1900.00, 'Credit Card'),
('SERV006', 1600.00, 'Cash'),
('SERV007', 1750.00, 'Credit Card'),
('SERV008', 1950.00, 'Bank Transfer'),
('SERV009', 1850.00, 'Cash'),
('SERV010', 2100.00, 'Credit Card');


-- Insert records into the FUEL table
INSERT INTO FUEL (BillNo, BusID, FillDate, Volume)
VALUES 
('BILL001', 'BUS-001', '2023-05-10', 100.5),
('BILL002', 'BUS-002', '2023-05-11', 98.2),
('BILL003', 'BUS-003', '2023-05-12', 105.8),
('BILL004', 'BUS-004', '2023-05-13', 102.3),
('BILL005', 'BUS-005', '2023-05-14', 97.6),
('BILL006', 'BUS-006', '2023-05-15', 101.1),
('BILL007', 'BUS-007', '2023-05-16', 99.9),
('BILL008', 'BUS-008', '2023-05-17', 103.5),
('BILL009', 'BUS-009', '2023-05-18', 96.8),
('BILL010', 'BUS-010', '2023-05-19', 104.7);


-- Insert records into the FUEL_COST table
INSERT INTO FUEL_COST (BillNo, Amount, Payment_method)
VALUES 
('BILL001', 25000.00, 'Cash'),
('BILL002', 24000.00, 'Credit Card'),
('BILL003', 26400.00, 'Cash'),
('BILL004', 25500.00, 'Cash'),
('BILL005', 24400.00, 'Credit Card'),
('BILL006', 25200.00, 'Cash'),
('BILL007', 24900.00, 'Credit Card'),
('BILL008', 25800.00, 'Cash'),
('BILL009', 24200.00, 'Credit Card'),
('BILL010', 26100.00, 'Cash');


use Private_Bus_Company;



-- Update two rows in EMPLOYEE table
UPDATE EMPLOYEE SET Salary = 65000.00 WHERE EmployeeID = 'EMP001';

UPDATE EMPLOYEE SET Position = 'Senior Driver' WHERE EmployeeID = 'EMP003';

-- Delete one row from EMPLOYEE table
DELETE FROM EMPLOYEE WHERE EmployeeID = 'EMP020';



-- Update two rows in EMPLOYEE_CONTACT table
UPDATE EMPLOYEE_CONTACT SET ContactNo = '0712345678' WHERE EmployeeID = 'EMP003' AND ContactNo = '0765678901';

UPDATE EMPLOYEE_CONTACT SET ContactNo = '0765432109' WHERE EmployeeID = 'EMP016' AND ContactNo = '0745658121';

-- Delete one row from EMPLOYEE_CONTACT table
DELETE FROM EMPLOYEE_CONTACT WHERE EmployeeID = 'EMP015' AND ContactNo = '0745677411';



-- Update two rows in MANAGER table
UPDATE MANAGER SET Experience = 6 WHERE EmployeeID = 'EMP016';

UPDATE MANAGER SET Experience = Experience+1 WHERE EmployeeID = 'EMP017';

-- Delete one row from MANAGER table
DELETE FROM MANAGER WHERE EmployeeID = 'EMP019';





-- Update two rows in DRIVER table
UPDATE DRIVER SET LicenceType = 'Advanced' WHERE EmployeeID = 'EMP003';

UPDATE DRIVER SET LeaderID = NULL WHERE EmployeeID = 'EMP004';

-- Delete one row from DRIVER table
DELETE FROM DRIVER WHERE EmployeeID = 'EMP010';





-- Update two rows in DRIVER_EXPERIENCE table
UPDATE DRIVER_EXPERIENCE SET Experience = 6 WHERE EmployeeID = 'EMP014';

UPDATE DRIVER_EXPERIENCE SET Experience = 7 WHERE EmployeeID = 'EMP015';

-- Delete one row from DRIVER_EXPERIENCE table
DELETE FROM DRIVER_EXPERIENCE WHERE EmployeeID = 'EMP009';






-- Update two rows in SUPERVISOR table
UPDATE SUPERVISOR SET SupervisorID = 'SV-008' WHERE SupervisorID = 'SV-001';

UPDATE SUPERVISOR SET SupervisorID = 'SV-009' WHERE SupervisorID = 'SV-002';

-- Delete one row from SUPERVISOR table
DELETE FROM SUPERVISOR WHERE SupervisorID = 'SV-006';





-- Update two rows in ROUTE table 
UPDATE ROUTE SET SupervisorID = 'SV-003' WHERE RouteNo = 1;

UPDATE ROUTE SET SupervisorID = 'SV-009' WHERE RouteNo = 2;

-- Delete one row from ROUTE table
DELETE FROM ROUTE WHERE RouteNo = 6;






-- Update two rows in BUS_SCHEDULE table
UPDATE BUS_SCHEDULE SET EndTime = '13:00:00' WHERE ScheduleID = 'SCH-003';

UPDATE BUS_SCHEDULE SET StartTime = '08:30:00' WHERE ScheduleID = 'SCH-002';

-- Delete one row from BUS_SCHEDULE table
DELETE FROM BUS_SCHEDULE WHERE ScheduleID = 'SCH-010';






-- Update two rows in DEPOT table
UPDATE DEPOT SET Capacity = 15 WHERE DepotID = 'DEP001';

UPDATE DEPOT SET Capacity = 8 WHERE DepotID = 'DEP002';

-- Delete one row from DEPOT table
DELETE FROM DEPOT WHERE DepotID = 'DEP006';




-- Update two rows in BUS table
UPDATE BUS SET Efficiency = 92 WHERE BusID = 'BUS-001';

UPDATE BUS SET Efficiency = 90 WHERE BusID = 'BUS-002';

-- Delete one row from BUS table
DELETE FROM BUS WHERE BusID = 'BUS-010';




-- Update two rows in FARE table
UPDATE FARE SET PriceRate = 280.00 WHERE FareID = 'F1T1';

UPDATE FARE SET PriceRate = 320.00 WHERE FareID = 'F2T1';

-- Delete one row from FARE table
DELETE FROM FARE WHERE FareID = 'F5T2';





-- Update two rows in MAINTENANCE table
UPDATE MAINTENANCE SET LastOilBrand = 'Shell' WHERE ServiceID = 'SERV001';

UPDATE MAINTENANCE SET LastOilBrand = 'Castrol' WHERE ServiceID = 'SERV002';

-- Delete one row from MAINTENANCE table
DELETE FROM MAINTENANCE WHERE ServiceID = 'SERV007';





-- Update two rows in SERVICE_COST table
UPDATE SERVICE_COST SET Payment_method = 'Bank Transfer' WHERE ServiceID = 'SERV010';

UPDATE SERVICE_COST SET Payment_method = 'Cash' WHERE ServiceID = 'SERV009';

-- Delete one row from SERVICE_COST table
DELETE FROM SERVICE_COST WHERE ServiceID = 'SERV005';





-- Update two rows in FUEL table
UPDATE FUEL SET FillDate = '2023-05-12' WHERE BillNo = 'BILL001';

UPDATE FUEL SET FillDate = '2023-05-11' WHERE BillNo = 'BILL002';

-- Delete one row from FUEL table
DELETE FROM FUEL WHERE BillNo = 'BILL005';






-- Update two rows in FUEL_COST table
UPDATE FUEL_COST SET Amount = 24500.00 WHERE BillNo = 'BILL002';

UPDATE FUEL_COST SET Amount = 26000.00 WHERE BillNo = 'BILL003';

-- Delete one row from FUEL_COST table
DELETE FROM FUEL_COST WHERE BillNo = 'BILL006';




USE Private_Bus_Company;

-- simple queries

-- Selecting all columns from the EMPLOYEE table
SELECT * FROM EMPLOYEE;


-- Selecting specific columns (EmployeeID, FirstName, LastName) from the EMPLOYEE table
SELECT EmployeeID, FirstName, LastName FROM EMPLOYEE;



-- Performing a Cartesian product of the EMPLOYEE and DRIVER tables
SELECT * FROM EMPLOYEE, DRIVER;


-- Creating a view named Manager_View to select details of managers
CREATE VIEW Manager_View AS
SELECT EmployeeID, Position, Salary
FROM EMPLOYEE
WHERE Position = 'Manager';



-- Renaming columns in the EMPLOYEE table
SELECT EmployeeID AS ID, FirstName AS First_Name, LastName AS Last_Name
FROM EMPLOYEE;



-- Calculating the average salary of employees
SELECT AVG(Salary) AS Average_Salary
FROM EMPLOYEE;



-- Selecting employees whose last name starts with 'F'
SELECT *
FROM EMPLOYEE
WHERE LastName LIKE 'F%';




-- complex union

-- Combining the results of two queries
SELECT EmployeeID, Position FROM EMPLOYEE
UNION
SELECT EmployeeID, Area FROM MANAGER;



-- Finding common employees between MANAGER and SUPERVISOR tables
SELECT EmployeeID FROM MANAGER
INTERSECT
SELECT EmployeeID FROM SUPERVISOR;



-- Finding employees who are drivers but not managers
SELECT EmployeeID FROM DRIVER
EXCEPT
SELECT EmployeeID FROM MANAGER;



-- Finding employees who are experienced enough to be drivers
SELECT EmployeeID FROM EMPLOYEE
WHERE EmployeeID IN (
    SELECT EmployeeID FROM DRIVER_EXPERIENCE
    WHERE Experience >= 3
);




-- Retrieving data from multiple tables based on a common column
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
INNER JOIN DRIVER d ON e.EmployeeID = d.EmployeeID;



-- Joining tables based on columns with the same name
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
NATURAL JOIN DRIVER d;



-- Retrieving all records from the left table and matching records from the right table
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
LEFT OUTER JOIN DRIVER d ON e.EmployeeID = d.EmployeeID;



-- Retrieving all records from the right table and matching records from the left table
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
RIGHT OUTER JOIN DRIVER d ON e.EmployeeID = d.EmployeeID;



-- Retrieving all records when there is a match in either table
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
LEFT JOIN DRIVER d ON e.EmployeeID = d.EmployeeID
UNION
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
RIGHT JOIN DRIVER d ON e.EmployeeID = d.EmployeeID;



-- Combining the results of two queries, including duplicates
SELECT EmployeeID, Position FROM EMPLOYEE
UNION ALL
SELECT EmployeeID, Area FROM MANAGER;




-- Using a nested query to find the maximum salary
SELECT EmployeeID, Salary
FROM EMPLOYEE
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);



-- Using a nested query to find employees who are managers
SELECT EmployeeID, Position
FROM EMPLOYEE
WHERE EmployeeID IN (SELECT EmployeeID FROM MANAGER);



-- Using a nested query to find supervisors for specific routes
SELECT *
FROM ROUTE
WHERE SupervisorID IN (SELECT SupervisorID FROM SUPERVISOR WHERE EmployeeID = 'EMP011');


