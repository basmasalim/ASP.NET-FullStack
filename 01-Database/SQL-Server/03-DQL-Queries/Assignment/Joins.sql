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