use ITI
-- Display All Data For All Students
-------------------------------------
select *
from Students

--------------------------------------------------------------
-- Display First Name , Lsat Name And Age For All Students
--------------------------------------------------------------
Select FirstName , LastName , Age
From Students

------------------------------------------------------------------
-- Display Id , First Name , Address And Age For Specific Student
-------------------------------------------------------------------
Select Id , FirstName , Address , Age
from Students
where Id = 1

---------------------------------------------------------------------------------
-- Display Id , First Name And Age For Students That Their Age is More Than 23
-----------------------------------------------------------------------------------
Select Id , FirstName , Age
from Students
Where Age > 23

-----------------------------------------------------------------------------------
-- Display Id , First Name And Age For Students That Their Age is in Range 23 , 30
-----------------------------------------------------------------------------------
Select Id , FirstName , Age
from Students
Where Age >= 23 and Age <= 30

Select Id , FirstName , Age
from Students
Where Age Between 23 and 30

----------------------------------------------------------------------------------------
-- Display Id , First Name And Age For Students That Their Age is Not in Range 23 , 30
----------------------------------------------------------------------------------------
Select Id , FirstName , Age
from Students
Where Age Not Between 23 and 30

----------------------------------------------------------------------------------------
-- Display Student Id , Student FName, Student Address Who Lives In Cairo Or Alex
----------------------------------------------------------------------------------------
Select Id , FirstName , Address
from Students
Where Address = 'Cairo' Or Address = 'Alex'

Select Id , FirstName , Address
from Students
Where Address in ('Cairo' , 'Alex')

----------------------------------------------------------------------------------------
-- Display Student Id , Student FName, Student Address Who Not Lives In Cairo Or Alex
----------------------------------------------------------------------------------------
Select Id , FirstName , Address
from Students
Where Address != 'Cairo' And Address <> 'Alex'

Select Id , FirstName , Address
from Students
Where Address Not in ('Cairo' , 'Alex')

------------------------------------------------------------
--  Display All Data Of All Students Who Hasn't a Supervisor
------------------------------------------------------------
Select *
from Students
where St_super is Null

------------------------------------------------------------
--  Display All Data Of All Students Who Has a Supervisor
------------------------------------------------------------
Select *
from Students
where St_super is Not Null

---------------------------------------------------------------------
-- Display student where second character of Their First name is 'a' 
---------------------------------------------------------------------
Select *
from Students
where FirstName Like '_a%'


/*
Wildcard Characters =>
_   : represents one, single character
%   : represents zero, one, or multiple characters
[]  : Matches any single character within the specified range 
[^] : Matches any single character that is not within the range
*/

-- Examples 

-- _a      => Samy , Manar , Sama , Samar , Yassmin
-- s%      => Shaimaa , Samy , Safaa , Selim 
-- _M%     => Amr , Emad , Amira
-- [sa]%   => Ahmed , Shaimaa , Selim , Amr ,Samy
-- sa%     => Samy , Sama , Samar
-- [^sa]%  => Mohamed , Marwa , Essam 
-- [a-m]%  => Malak , Bola , Eman 
-- [^a-m]% => Omar , Rawan , Salma
-- [463]%  => 6X , 3mr
-- %[%]    => Word% , Laila% 

---------------------------------------------------------------------
-- Display Data Without Duplication
---------------------------------------------------------------------
Select Distinct FirstName
From Students


Select Distinct DepartmentId
From Students
Where DepartmentId is not null

--------------------------------------------
-- Display First Name Of Student In Order 
--------------------------------------------
Select FirstName
from Students
-- Retrieved According To Their Defualt Order In Table [Ordered According PK] 

Select FirstName
From Students
Order by FirstName Asc -- Defualt

Select FirstName
From Students
Order by FirstName Desc 

Select FirstName , LastName
From Students
Order by FirstName , LastName desc

Select FirstName , LastName
From Students
Order by 1 , 2 desc
