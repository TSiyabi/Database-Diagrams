SELECT * FROM Employee;

SELECT * FROM Department;


INSERT INTO Employee (SSN, FName, LName, Gender, BirthDate, Supervisor, DNUM)
VALUES ('111111111', 'Ali', 'Saeed', 'M', '1985-04-15', NULL, NULL); 


INSERT INTO Department (DNUM, DName, SSN, ManagerHireDate)
VALUES (10, 'IT', '111111111', '2020-01-01');


UPDATE Employee SET DNUM = 10 WHERE SSN = '111111111';


INSERT INTO Employee (SSN, FName, LName, Gender, BirthDate, Supervisor, DNUM)
VALUES 
('222222222', 'Sara', 'Hamed', 'F', '1990-08-21', '111111111', 10),
('333333333', 'Omar', 'Khalid', 'M', '1992-12-03', '111111111', 10);

SELECT * FROM Employee;

SELECT * FROM Department;

SELECT * FROM Project;

INSERT INTO Project (PNumber, PName, Location, City, DNUM)
VALUES 
(1, 'AI System', 'Building A', 'Muscat', 10),
(2, 'Network Upgrade', 'Building B', 'Sohar', 10),
(3, 'Cloud Migration', 'Building C', 'Salalah', 10);

SELECT * FROM Project;

SELECT * FROM Works_On;

INSERT INTO Works_On (SSN, PNumber, WorkingHours)
VALUES 
('111111111', 1, 20.5),  
('222222222', 2, 15.0),  
('333333333', 3, 18.75), 
('222222222', 1, 10.0),  
('333333333', 2, 12.5); 

SELECT * FROM Works_On;

SELECT * FROM Dependent;

INSERT INTO Dependent (Name, SSN, Gender, BirthDate)
VALUES 
('Laila',    '111111111', 'F', '2010-05-14'), 
('Yousef',   '222222222', 'M', '2015-03-22'),  
('Mariam',   '222222222', 'F', '2017-08-10');

SELECT * FROM Dependent;

SELECT * FROM Department_Location;

INSERT INTO Department_Location (DNUM, Location)
VALUES 
(10, 'Head Office - Muscat'),
(10, 'Branch - Sohar'),
(10, 'Remote Site - Salalah');

SELECT * FROM Department_Location;






