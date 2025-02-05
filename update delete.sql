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


