--=================== Comment ===================
--==================================================--
-- Single Line Comment

/*
MultiLine
Comment
*/

-- Ctrl+K , Ctrl+C => Comment
-- Ctrl+K , Ctrl+U => Uncomment

--==================================================--
--=================== Global Variables [Built-in] ===================
Print @@ServerName
Print @@Version

--=================== Local Variables [User-Defined] ===================
Declare @StudentName varchar(10) = 'Ahmed' --5
Print @StudentName

Set @StudentName = 'Mahmoud' --7
Print @studentname -- No Case Sensitive

Declare @StudentAge int = 25
Print @StudentAge
--=========================================================
-- 1) DDL ======================================

--=================== 1.Create ===================

-- The primary key will not accept NULL values whereas 
--  the Unique key can accept NULL values.

Create Database Company

Use Company

Create Table Employees
(
	Id int Primary Key Identity(1,1), --(seding) Auto Generated
	SSN char(14) not null Unique,
	FName varchar(40) not null,
	LName varchar(40), -- optional
	Address varchar(50) default 'Cairo',
	Gender char(1), -- M/F (tinyint )
	Salary decimal(8,2),
	Birthdate date,  
	SupervisorId int references Employees(Id),-- Self Relationship
	DepartmentNo int -- references Department(DNumber)
);


Create Table Departments
(
	DNumber int Primary Key Identity(10,10),
	Dname varchar(40) not null,
	ManagerId int references Employees(Id), -- not null unique (1-1 relationship)
	[Hiring Date] date,
);


Create Table [Department Locations]
(
	DNumber int references Departments(DNumber),	
	Location varchar(100)
	Primary Key(DNumber, Location)
);

Create Table Projects
(
	PNumber int Primary Key Identity(100,100),
	PName varchar(50) not null,
	Location varchar(30),
	City varchar(30),
	DNumber int references Departments(DNumber), -- not null (total particepation)
);

Create Table Dependents
(
	EmployeesId int references Employees(Id),
	Name varchar(50),
	Primary Key(EmployeesId, Name),
	Birthdate date,
	Gender char(1)
);

Create Table [Employee In Projects]
(
	EmployeesId int references Employees(Id),
	PNumber int references Projects(PNumber),
	Primary Key(EmployeesId, PNumber),
	[Working Hours] int 
);

Select *
From [Employee In Projects]

--=================== 2.Alter ===================
Use Master

Alter Database Company
Modify Name = Company01

-- Alter Database Object -> Table
Alter Table Employees
Add NetSalary int

Alter Table Employees
Alter Column NetSalary bigint

Alter Table Employees
Drop Column NetSalary

----------------------------------------------
Alter Table Departments
Add Constraint UQ_MangaerId Unique(ManagerId)

Alter Table Departments
Drop Constraint [FK__Departmen__Manag__5535A963]

Alter Table Departments
Alter Column ManagerId int not null 

----------------------------------------------
Alter Table Employees
Add Foreign Key(DepartmentNo) references Departments(DNumber)

--=================== 2.Drop [Delete Structure] ===================
Drop Database [Company]

Drop Table Employees

-- Drop View [View Name]
-- Drop Function [Function Name]

-- Truncate Table Employees