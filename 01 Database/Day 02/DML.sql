--########## Part 01
				--## 1)	From The Previous Assignment insert at least 2 rows per table. 
-- Insert data into Topics
Insert Into Topics
Values('Programming Basics'),
       ('Database Management');

-- Insert data into Courses 
Insert Into Courses
Values ('Database', 30, 'A database is an electronically stored', 1),
       ('AI', 80 ,'AI is technology that enables computers', 2);

-- Insert data into Departments
INSERT INTO Departments
VALUES ('Computer Science', '2022-09-01', NULL),
       ('Engineering', '2021-01-15', NULL);

INSERT INTO Departments
VALUES ('Doctor', '2020-04-01', 8)

-- Insert data into Instructors
Insert Into Instructors
Values ('Ahmed', 'Cairo', 500.00, 5000.00, 50.00, 10);

Insert Into Instructors
Values ('Aliaa', 'Cairo', 1000, 30000, 40, 20);

-- Insert data into Students
Insert Into Students
Values ('Soly', 'Ali', 19, 'Aswan', 10),
		('Maher', 'Noor', 10, 'Cairo', 30);

-- Insert data into StudCourse
Insert Into StudCourse
Values (1, 100, 100), (2, 200, 95);

-- Insert data into Course Instructor
Insert Into [Course Instructor] 
VALUES  (100, 8, 'Excellent'),
		(200, 9, 'Very Good');


			-- 2)	Data Manipulation Language:
				--## 1.Insert your personal data to the student table as a new Student in department number 30.
Insert Into Students
Values ('Basma', 'Salem', 24, 'Cairo', 30)

				--## 2.Insert Instructor with personal data of your friend as new Instructor in department number 30,
				--         Salary= 4000, but don’t enter any value for bonus.
Insert Into Instructors(Name, Address, Salary)
Values ('Ahmed', 'Cairo', 4000, 40, 30);

				--## 3.Upgrade Instructor salary by 20 % of its last value.
update Instructors
	Set Salary += Salary * 0.2



--!####################################################################################################################
--########## Part 02
			--## 1.	Display all the employees Data.
Select *
From Employee

			--## 2.	Display the employee First name, last name, Salary and Department number.
Select Fname, Lname, Salary, Dno
From Employee

			--## 3.	Display all the projects names, locations and the department which is responsible for it.
Select P.Pname, P.Plocation, D.Dnum
From Project P, Departments D
where D.Dnum = P.Dnum

Select Pname, Plocation, Dnum
From Project 

			--## 4.	If you know that the company policy is to pay an annual commission for 
					--	each employee with specific percent equals 10% of his/her annual salary 
					--	Display each employee full name and his annual commission in an ANNUAL COMM column (alias).
Select Fname + ' ' + Lname as [full name] , Salary * 0.1 * 12 as [ANNUAL COMM]
From Employee

			--## 5.	Display the employees Id, name who earns more than 1000 LE monthly.
Select SSN, Fname
From Employee
Where Salary > 1000

			--## 6.	Display the employees Id, name who earns more than 10000 LE annually.
Select SSN, Fname
From Employee
Where Salary * 12 > 10000

			--## 7.	Display the names and salaries of the female employees 
Select Fname, Salary
From Employee
Where Sex = 'F'

			--## 8.	Display each department id, name which is managed by a manager with id equals 968574.
Select Dnum, Dname
From Departments
Where MGRSSN = 968574

			--## 9.	Display the ids, names and locations of  the projects which are controlled with department 10.
Select Pnumber, Pname, Plocation
From Project
Where Dnum = 10

--!####################################################################################################################
--########## Part 03 -- ⮚	Restore ITI Database and then:
			--## 1.	Get all instructors Names without repetition
Select Distinct Name
From Instructors

			--## 2.	Display instructor Name and Department Name 
Select Ins.Name, Dep.Name
From Instructors Ins Inner Join Departments Dep
On Ins.DepId = Dep.Id

			--## 3.	Display student full name and the name of the course he is taking For only courses which have a grade  
Select Std.FName + ' ' + Std.LName as FullName, C.Name as [Courses Name]
From Students Std , StudCourse SC , Courses C
Where SC.StudId = Std.Id  and C.Id = SC.CourseId

			--## Bouns)	Display results of the following two statements and explain what is the meaning of @@AnyExpression
					-- select @@VERSION,	select @@SERVERNAME
select @@VERSION
-- @@VERSION ==> Global Variable
/*
	Microsoft SQL Server 2019 (RTM) - 15.0.2000.5 (X64) 
    Sep 24 2019 13:48:23 
    Copyright (C) 2019 Microsoft Corporation
    Developer Edition (64-bit) on Windows 10 Pro  (Build 19042: )
*/

select @@SERVERNAME

-- SELECT @@VERSION ==> System Variables

SELECT @@ROWCOUNT;

--!####################################################################################################################
--########## Part 04 -- ⮚	Using MyCompany Database and try to  create the following Queries:
			--## 1.	Display the Department id, name and id and the name of its manager.
Select D.Dnum, D.Dname, E.SSN, E.Fname
From Departments D Inner Join Employee E
On D.MGRSSN = E.Superssn

			--## 2.	Display the name of the departments and the name of the projects under its control.
Select D.Dname, P.Pname
From Departments D Inner Join Project P
On D.Dnum = P.Dnum

			--## 3.	Display the full data about all the dependence associated with the name of the employee they depend on .
Select D.*, E.Fname as Employee
From Employee E Inner Join Dependent D
On E.SSN = D.ESSN

			--## 4.	Display the Id, name and location of the projects in Cairo or Alex city.
Select Pnumber, Pname, Plocation
From Project
Where City = 'Cairo' or City = 'Alex'

Select Pnumber, Pname, Plocation
From Project
Where City In ('Cairo','Alex' )

			--## 5.	Display the Projects full data of the projects with a name starting with "a" letter.

SELECT *
From Project
Where Pname Like 'a%'

			--## 6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
Select *
From Employee 
Where Dno = 30 And Salary Between 1000 and 2000

			--## 7.	Retrieve the names of all employees in department 10 who work more than or equal 10 hours per week on the "AL Rabwah" project.
SELECT E.Fname
From Employee E, Works_for W, Project P
Where E.SSN = W.ESSn 
	And P.Pnumber = W.Pno
	AND  Dno = 10  
	AND W.Hours >= 10
	And P.Pname = 'AL Rabwah'

			--## 8.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
Select E.Fname, P.Pname
From Employee E ,Project P, Works_for W
Where E.SSN = W.ESSn AND P.Pnumber = W.Pno
Order By P.Pname

			--## 9.	For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
Select P.Pnumber, D.Dname, Manger.Lname [Manager Name], Manger.Address [Manager Address], Manger.Bdate [Manager Bdate]
From Project P, Departments D, Employee Manger
Where P.City = 'Cairo' AND P.Dnum = D.Dnum AND D.MGRSSN = Manger.Superssn
