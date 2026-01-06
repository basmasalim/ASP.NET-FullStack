﻿-----------------------------------------------------------
-- DML With Joins 
-------------------
-- Update 
------------
Update StdCrs
Set Grade += 10 --Grade = Grade + 10
from Student Std join Stud_Course StdCrs
on Std.St_Id = StdCrs.St_Id
Where Std.St_Address = 'Cairo'

------------------------------------------------------------
-- Delete 
Select Distinct Std.St_Id , St_Fname
from Student Std join Stud_Course StdCrs
on Std.St_Id = StdCrs.St_Id
Where Std.St_Age = 28

Delete Std
from Student Std join Stud_Course StdCrs
on Std.St_Id = StdCrs.St_Id
Where Std.St_Age = 28

Select  Std.St_Id , St_Fname 
from Student Std join Stud_Course StdCrs
on Std.St_Id = StdCrs.St_Id
Where Std.St_Address = 'Cairo'

Delete StdCrs
from Student Std join Stud_Course StdCrs
on Std.St_Id = StdCrs.St_Id
Where Std.St_Address = 'Cairo'


--------------- Functions ----------------------
------------------------------------------------
Use MyCompany
------------ Aggregate Functions ---------------
-- Count 
Select COUNT(*) [Count Of ALL] , COUNT(SSN) [Count Of SSN], COUNT(Dno) [Count Of Dept Number]
From Employee

-- Sum
Select SUM(Salary) [Sum Of Salaries]
From Employee

-- Avg
Select AVG(Salary) [Average Of Salaries]
From Employee

Select SUM(Salary)/COUNT(Salary) [Average Of Salaries]
From Employee

-- Max , Min
Select Max(Salary) [Max Salary] , MIN(Salary) [Min Salary]
From Employee

Select Min(Fname) , Max(Fname) -- Ahmed , Noha
From Employee

Select Distinct dno ,  Min(Salary) Over(Partition by dno) [Min Salary]
, Max(Salary) Over(Partition by dno) [Max Salary]
From Employee

Select dno ,  Min(Salary) [Min Salary] , Max(Salary) [Max Salary] 
From Employee
group by Dno

------------ Null Functions ---------------
-- ISNULL
Select ISNULL(Lname , 'Not Found')
From Employee

Select ISNULL(Lname , Fname)
From Employee

Select ISNULL(Salary , 0) 
From Employee

Select ISNULL(Salary , Fname) -- Invalid
From Employee

Select ISNULL(Lname , Salary) -- valid
From Employee

Select ISNULL(Lname , Address )
From Employee

Select ISNULL(Lname , ISNULL(Address , Fname))
From Employee


Select Fname + ' ' + Lname -- + => String + NULL = NULL 
From Employee

Select Fname + ' ' + ISNULL(Lname , ' ')
From Employee

-- Coalesce 
Select COALESCE(Lname , Address , Fname )
From Employee


------------ Date and Time Functions ---------------

Select SysDateTime() -- 2024-11-14 08:30:08.1571479

Select SYSUTCDATETIME() -- 2024-11-14 06:30:42.2019742

Select GetDate() -- 2024-11-14 08:31:07.643

Select GETUTCDATE() -- 2024-11-14 06:31:24.023

Select DATENAME(day, '11-14-2024') -- 14

Select DATEPART(day ,'11-14-2024') -- 14

Select DATENAME(weekday, '11-14-2024') -- Thursday

Select DAY('11-14-2024') -- 14

Select Month('11-14-2024') -- 11

Select YEAR('11-14-2024') -- 2024

Select EOMONTH ('11-14-2024') -- 2024-11-30

Select ISDATE('11-14-2024') -- 1

Select ISDATE('14-11-2024') -- 0

------------ Conversion Functions ---------------
-- Convert 
Select Fname + ' _ ' + Convert(Varchar(20),Salary) 
From Employee

Select Fname + ' _ ' + ISNULL(Convert(Varchar(20),Salary) , ' ')
From Employee

-- Cast
Select Fname + ' ' + Cast(Salary as Varchar(20))
From Employee

Select Fname + ' ' + ISNULL(Cast(Salary as Varchar(20)) , '')
From Employee

Declare @Today datetime = GETDATE()	
Select Cast(@Today As varchar(max)) -- 2025-05-25
Select CONVERT(varchar(max),@Today) -- 2025-05-25

Select CONVERT(varchar(max),@Today,101) -- 05/25/2025
Select CONVERT(varchar(max),@Today,102) -- 2025.05.25
Select CONVERT(varchar(max),@Today,103) -- 25/05/2025
Select CONVERT(varchar(max),@Today,104) -- 25.05.2025
Select CONVERT(varchar(max),@Today,105) -- 25-05-2025
Select CONVERT(varchar(max),@Today,106) -- 25 May 2025
Select CONVERT(nvarchar(max),@Today,130) -- 28 ذو القعدة 1446

-- Parse (Use PARSE only for converting from string to date/time and number types)

Select Parse('Sunday, 25 May 2025' as Date USING 'en-US') -- 2025-05-25

SELECT PARSE('$500,10' AS money USING 'en-US')  -- 50010.00
SELECT PARSE('$500.10' AS money USING 'en-US')  -- 500.10
SELECT PARSE('€500,10' AS money USING 'de-DE') -- 500.10
SELECT PARSE('€500.10' AS money USING 'de-DE') -- 50010.00


Select PARSE('Route' as date) -- Error

Select Try_Parse('Route' as Date) -- Null


------------ String Functions ---------------
Select Fname + ' ' + Lname
From Employee

Select Concat(SSN ,' ',Fname ,' ' ,  Lname , ' ' , Address)
From Employee

Select Concat_Ws('_', SSN , Fname , Lname , Address)
From Employee

Select Fname , Lower(Fname) , UPPER(Fname)
From Employee

Select Fname , Len(Fname) [Number of Char]
From Employee

Select LEN('Route Academy') -- 13

Select Fname , SUBSTRING(Fname , 1 , 2) , CONVERT(varchar(2), Fname)
From Employee

Select ASCII('A') -- 65
Select ASCII('a') -- 97
Select ASCII(1) -- 49

Select CHAR(49) -- 1
Select CHAR(65) -- A

Select LEFT('Route Academy' , 5) -- Route

Select Right('Route Academy' , 5) -- ademy

Select LTRIM('     Route Academy') -- Route Academy
Select LTRIM('Route Academy     ') -- Route Academy
Select TRIM('     Route Academy     ') -- Route Academy

Select REVERSE('Route Academy') -- ymedacA etuoR

SELECT SOUNDEX('Route') AS Soundex1 , SOUNDEX('root') AS Soundex1

--------------------------------------------------------------------------------------
------------------------------ Format ------------------------------------------------
Select FORMAT(Salary , '###,###')
From Employee

Select FORMAT(123456789 , '###,###,###')  -- 123,456,789
Select FORMAT(123456789 , '###/###$###') -- 123/456$789
Select FORMAT(123456789 , '#_##_###') -- 1234_56_789
Select FORMAT(1234567 , '###_###_###') -- 1_234_567
Select FORMAT(123456.789 , 'N0') -- 123,457
Select FORMAT(123456.789 , 'N1') -- 123,456.8


Declare @Today Date = GETDATE()
SELECT FORMAT(@Today, 'd', 'en-US')	-- 11/14/2024	
SELECT FORMAT(@Today, 'd', 'ar-SA') -- 12/05/46
SELECT FORMAT(@Today, 'D', 'en-US')  -- Thursday, November 14, 2024
SELECT FORMAT(@Today, 'D', 'ar-SA') -- 12/جمادى الأولى/1446
Select FORMAT(@Today , 'dd MM yy') -- 14 11 24
Select FORMAT(@Today , 'ddd MMM yyy') -- Thu Nov 2024
Select FORMAT(@Today , 'dddd MMMM yyyy') -- Thursday November 2024
Select FORMAT(@Today , 'dd-MM-yyyy hh:mm:ss tt' , 'en-US') -- 14-11-2024 09:32:36 AM
Select FORMAT(@Today , 'dd-MM-yyyy hh:mm:ss tt' , 'ar-SA') --12-05-1446 09:32:36 ص