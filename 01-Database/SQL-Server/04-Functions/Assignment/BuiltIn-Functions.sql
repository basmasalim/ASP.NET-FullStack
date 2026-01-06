-----------------------------------------------------------
-- Part 01 (Use ITI DB)
-------------------
USE ITI;

-- 1.	Retrieve a number of students who have a value in their age. 
Select COUNT(St_Age) [Number Of Student]
From Student
Where St_Age is not null

-- 2.	Display number of courses for each topic name 
Select T.Top_Name, COUNT(C.Crs_Id) [Number Of Student]
From Course C, Topic T
Where C.Top_Id = T.Top_Id
GROUP BY T.Top_Name

-- 3.	Display student with the following Format (use isNull function)
Select S.St_Id [Student ID], ISNULL(CONCAT(S.St_Fname, ' ', S.St_Lname ), ' ') [Student Full Name], D.Dept_Name [Department name]
From Student S, Department D
WHERE S.Dept_Id = D.Dept_Id

-- 4.	Select instructor name and his salary but if there is no salary display value ‘0000’ . “use one of Null Function” 
Select Ins_Name, ISNULL(Salary, 0) [Salary]
From Instructor 

-- 5.	Select Supervisor first name and the count of students who supervises on them
Select Super.St_Fname, COUNT(*) [Number Of Student]
From Student S, Student Super
Where S.St_super = Super.St_Id
GROUP BY Super.St_Fname

-- 6.	Display max and min salary for instructors
Select MAX(Salary) [Max Salary] , MIN(Salary) [Min Salary]
From Instructor

-- 7.	Select Average Salary for instructors 
Select AVG(Salary) [Average Salary for instructors]
From Instructor

-----------------------------------------------------------
-- Part 02 (Use MyCompany DB)
-------------------------------
USE MyCompany;

-- 1.	For each project, list the project name and the total hours per week (for all employees) spent on that project.
SELECT P.Pname, SUM(W.Hours) [Total hours per week]
FROM Project P, Works_for W
WHERE P.Pnumber = W.Pno
GROUP BY P.Pname

-- 2.	For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
SELECT D.Dname,MAX(E.Salary) [Max Salary] , MIN(E.Salary) [Min Salary], AVG(E.Salary)  [Average Salary]
FROM Departments D, Employee E
WHERE D.Dnum = E.Dno
GROUP BY D.Dname

