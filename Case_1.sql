USE Case_1;



CREATE TABLE Department (
    DNUM INT PRIMARY KEY,
    DName NVARCHAR(50),
    SSN CHAR(9), 
    ManagerHireDate DATE
);


CREATE TABLE Employee (
    SSN CHAR(9) PRIMARY KEY,
    FName NVARCHAR(50),
    LName NVARCHAR(50),
    Gender CHAR(1),
    BirthDate DATE,
    Supervisor CHAR(9), 
    DNUM INT, 
    FOREIGN KEY (Supervisor) REFERENCES Employee(SSN),
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);


ALTER TABLE Department
ADD CONSTRAINT FK_Manager FOREIGN KEY (SSN) REFERENCES Employee(SSN);


CREATE TABLE Department_Location (
    DNUM INT,
    Location NVARCHAR(100),
    PRIMARY KEY (DNUM, Location),
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);


CREATE TABLE Project (
    PNumber INT PRIMARY KEY,
    PName NVARCHAR(100),
    Location NVARCHAR(100),
    City NVARCHAR(100),
    DNUM INT,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);


CREATE TABLE Works_On (
    SSN CHAR(9),
    PNumber INT,
    WorkingHours DECIMAL(5,2),
    PRIMARY KEY (SSN, PNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (PNumber) REFERENCES Project(PNumber)
);


CREATE TABLE Dependent (
    Name NVARCHAR(50),
    SSN CHAR(9),
    Gender CHAR(1),
    BirthDate DATE,
    PRIMARY KEY (Name, SSN),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

select * from Department;
select * from Employee;
select * from Department_Location;
select * from Project;
select * from Works_On;
select * from Dependent;