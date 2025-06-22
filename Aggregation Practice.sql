create DATABASE Practice;

use Practice;

CREATE TABLE Instructors ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Categories ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
); 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 

-- Instructors 
INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21'); 
-- Categories 
INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business'); 
-- Courses 
INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01'); 
-- Students 
INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); 
-- Enrollments 
INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3); 

select * from Students

select COUNT(FullName)
from Students

-- result 3 --

select * from Enrollments

select Count(EnrollmentID)
from Enrollments

-- result 7 --

select * from Enrollments

select AVG(Rating) AS Rating,CourseID 
from Enrollments
Group by CourseID

--Rating | CourseID
--	4     	101
--	3	    102
--	4		103
--	2		104

select * from Courses

select count(CourseID) as "Course/inst", InstructorID
from Courses
Group by InstructorID

-- Course/inst | InstructorID
--		2			  1
--		2			  2

select * from Courses

select count(Title) as "Course/category", CategoryID
from Courses
Group by CategoryID

-- Course/category | CategoryID
--		 2				1
--		 1				2
--		 1				3

select * from Enrollments

select count (StudentID) "Student/Course", CourseID
from Enrollments
Group by CourseID

--Student/Course | CourseID
--		2			101
--		2			102
--		1			103
--		2			104

select * from Courses

select AVG(price) "avg-price/Categorie" , CategoryID
from Courses
Group by CategoryID

-- avg-price/Categorie | CategoryID
--		34.990000			1
--		49.990000			2
--		19.990000			3

select * from Courses
 
select max(Price) "Max price" 
from Courses

-- 49.99 --

select * from Enrollments

select min(Rating) "min rating", max(Rating) "max rating", Avg(Rating) "avg rating", CourseID
from Enrollments
group by CourseID

-- min rating | max rating | avg rating | CourseID
--		4			5			 4			101
--		3			4			 3			102
--		4			4			 4			103
--		2			3			 2			104

select * from Enrollments

select count(StudentID) "numSt5str"
from Enrollments
group by Rating
having max(Rating) = 5

-- 1 --

select * from enrollments

select avg(CompletionPercent) "Avg Completion", CourseID
from Enrollments
group by CourseID

-- Avg Completion CourseID
--		95			101
--		65			102
--		70			103
--		45			104

select * from  Enrollments

select count(CourseID) as "Number of Courses", StudentID
from Enrollments
group by StudentID
having count(CourseID) > 1

-- Number of Courses | StudentID
--		3				 201
--		2				 202
--		2				 203

select * from Courses
select * from Enrollments

select count(*) "Enrollments total", CourseID, (select Price from Courses where Courses.CourseID = Enrollments.CourseID) "course price" , count(*) * (select Price from Courses where Courses.CourseID = Enrollments.CourseID) "Revenue"
from Enrollments
group by CourseID

-- Enrollments total | CourseID | Course price | Revenue
--		2			   	 101		 29.99		  59.98
--		2				 102		 49.99	      99.98
--		1				 103		 19.99	      19.99
--		2				 104		 9.99		  79.98





















