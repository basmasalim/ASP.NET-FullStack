-- 2. Update 
--===========

Update Employees
set SupervisorId =  2
where Id = 8


update Employees
set Gender = 'F' , Lname = 'Amr'
Where Id = 7

update Employees
set Salary = Salary + Salary *0.1
where Gender = 'F' and Salary <= 5000