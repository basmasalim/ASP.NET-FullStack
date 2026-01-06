-- 1. Insert 
--===========
-- 1.1 Simple Insert  (Insert Just Only One Row)
--===============================================
use Company

Insert Into Employees
Values('Basma' , 'Salim' ,'Giza', 'F' , '15000' , '05-22-1990' , Null , Null)

-- 1.2 Row Constructor Insert (More Than One Row)
--===============================================

Insert Into Employees
Values ('Sama' , 'Khaled' ,'Giza' , 'F' ,'15000' , '12-10-2000' , 1 , null) , 
('Samy' , 'Sabry' ,'Alex', 'M' ,'12000' , '06-07-1999', 1 , null) , 
('Manar' , 'Ahmed' ,'Cairo', 'F' ,'5000' , '04-27-1998' , 2 , null),
('Mohamed' , 'Amr' ,'New Cairo', 'M','1000' , '09-20-1995' , 3 , null)

-- 1.3 Using Column List
--===============================================
Insert Into Employees(FName , Gender)
Values ('Amr' ,'M')

/* If a column is not in column_list, the Database Engine must be able to provide a value 
based on the definition of the column; otherwise, the row cannot be loaded. 
The Database Engine automatically provides a value for the column if the column:*/

-- 1. Has an IDENTITY property. The next incremental identity value is used.
-- 2. Has a default. The default value for the column is used.
-- 3. Has a timestamp data type. The current timestamp value is used.
-- 4. Is nullable. A null value is used.
-- 5. Is a computed column. The calculated value is used.

Insert Into Employees (Fname , Birthdate)
Values ('Mona' , '06-27-2000'),
('Malak' , '07-25-2000'),
('Ahmed' , '12-01-1995')