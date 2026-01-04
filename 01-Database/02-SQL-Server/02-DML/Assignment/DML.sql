﻿--########## Part 01
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
			--## 1.	Display all the Employeess Data.
Select *
From Employees

			--## 2.	Display the Employees First name, last name, Salary and Department number.
Select Fname, Lname, Salary, Dno
From Employees

			--## 3.	Display all the projects names, locations and the department which is responsible for it.
Select P.Pname, P.Plocation, D.Dnum
From Project P, Departments D
where D.Dnum = P.Dnum

Select Pname, Plocation, Dnum
From Project 

			--## 4.	If you know that the company policy is to pay an annual commission for 
					--	each Employees with specific percent equals 10% of his/her annual salary 
					--	Display each Employees full name and his annual commission in an ANNUAL COMM column (alias).
Select Fname + ' ' + Lname as [full name] , Salary * 0.1 * 12 as [ANNUAL COMM]
From Employees

			--## 5.	Display the Employeess Id, name who earns more than 1000 LE monthly.
Select SSN, Fname
From Employees
Where Salary > 1000

			--## 6.	Display the Employeess Id, name who earns more than 10000 LE annually.
Select SSN, Fname
From Employees
Where Salary * 12 > 10000

			--## 7.	Display the names and salaries of the female Employeess 
Select Fname, Salary
From Employees
Where Sex = 'F'

			--## 8.	Display each department id, name which is managed by a manager with id equals 968574.
Select Dnum, Dname
From Departments
Where MGRSSN = 968574

			--## 9.	Display the ids, names and locations of  the projects which are controlled with department 10.
Select Pnumber, Pname, Plocation
From Projects
Where Dnum = 10