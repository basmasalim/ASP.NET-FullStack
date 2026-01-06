-----------------------------------------------------------
-------------------------- Joins --------------------------
-----------------------------------------------------------
-- Cross Join (Cartisian product)
----------------------------------
-- Old Syntax
Select FirstName , Name
From Students , Departments

-- New Syntax
Select FirstName , Name
From Students Cross Join Departments

-----------------------------------------------------------
-- Inner Join (Equi Join)
----------------------------------
-- Old Syntax 
Select FirstName , Name
From Students S , Departments D
Where D.Id = S.Id and D.Name = 'Java'

-- New Syntax 
Select FirstName , Name
from Students S inner join Departments D
On D.Id = S.Id and D.Name = 'Java'

Select FirstName , Name
from Students S join Departments D
On D.Id = S.Id
where D.Name = 'Java'

-----------------------------------------------------------
-- Outer Joins 
---------------
-- 1. Left Outer Join 
-----------------------
select S.FirstName, D.Name
from  Students S left outer join Departments D 
on D.Id = S. Id


select S.FirstName, D.Name
from  Departments D left join  Students S
on D.Id = S.Id
 ----------------------------------------------------------------------
-- 2. Right Outer Join 
-----------------------
select S.FirstName, D.Name
from  Students S Right outer join Departments D 
on D.Id = S. Id


select S.FirstName, D.Name
from  Departments D Right join  Students S
on D.Id = S.Id

---------------------------------------------------------------------------------
-- 3. Full Outer Join 
-----------------------
Select S.FirstName , D.Name
from Students S Full outer Join Departments D
on D.Id = S.Id


Select S.FirstName , D.Name
from Students S Full Join Departments D
on D.Id = S.Id

--------------------------------------------------------------------------------------------------
-- Self Join
---------------
-- Get Id and Name Of Studentss That Have a Supervisor And Get Supervisor Name 
-------------------------------------------------------------------------------
Select Stud.Id As StudentsId, Stud.FirstName As StudentsName , Supervisors.FirstName As SupervisorName
from Students Stud , Students Supervisors
where Supervisors.Id = Stud.St_super

Select Stud.Id [Students Id], Stud.FirstName 'Students Name'  , Supervisors.FirstName [Supervisor Name]
from Students Stud Inner join Students Supervisors
on Supervisors.Id = Stud.St_super

Select Stud.Id [Students Id], Stud.FirstName 'Students Name'  , Supervisors.FirstName [Supervisor Name]
from Students Stud  join Students Supervisors
on Supervisors.Id = Stud.St_super



-- Get All Data Of Studentss That Have a Supervisor Or Not 
-- And If He Has a Supervisor Get Supervisor Name 
------------------------------------------------------------
Select Stud.* , Supervisors.FirstName [Supervisor Name]
from Students Stud Left join Students Supervisors
on Supervisors.Id = Stud.St_super


-----------------------------------------------------------
-- Multiple-Table Joins 
------------------------
Select FirstName , Name , Grade
from Students Std , Courses Crs , StudentCourse StdCrs
Where Std.Id = StdCrs.StudentId And Crs.Id = StdCrs.StudentId And StdCrs.Grade > 100


Select FirstName , Name , Grade
from Students Std 
inner join StudentCourse StdCrs
On Std.Id = StdCrs.StudentId
inner join Courses Crs
on Crs.Id = StdCrs.StudentId
Where StdCrs.Grade > 100

-----------------------------------------------------------
-- DML With Joins 
-------------------
-- Update 
------------
Update StdCrs
Set Grade += 10 --Grade = Grade + 10
from Students Std join StudentCourse StdCrs
on Std.Id = StdCrs.Id
Where Std.Address = 'Cairo'

------------------------------------------------------------
-- Delete 
Select Distinct Std.Id , FirstName
from Students Std join StudentCourse StdCrs
on Std.Id = StdCrs.StudentId
Where Std.Age = 28

Delete Std
from Students Std join StudentCourse StdCrs
on Std.Id = StdCrs.StudentId
Where Std.Age = 28

Select  Std.Id , FirstName 
from Students Std join StudentCourse StdCrs
on Std.Id = StdCrs.StudentId
Where Std.Address = 'Cairo'

Delete StdCrs
from Students Std join StudentCourse StdCrs
on Std.Id = StdCrs.StudentId
Where Std.Address = 'Cairo'