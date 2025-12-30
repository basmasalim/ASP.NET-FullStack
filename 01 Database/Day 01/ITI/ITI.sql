-- Create Database
Create Database ITI

USE ITI;

-- Create Table: Students
Create Table Students
(
	Id int Primary Key Identity(1, 1),
	FName varchar(20) not null, --Required
	LName varchar(20),
	Age int,
	Address varchar(50),
	DepId int --references Departments(Id)
)

-- Create Table: Departments
Create Table Departments
(
	Id int Primary Key Identity(10, 10),
	Name varchar(20) not null,
	HiringDate date,
	InstructorId int --references Instructors(Id)
)

-- Create Table: Instructors
Create Table Instructors
(
	Id int Primary Key Identity(1, 1),
	Name varchar(20) not null,
	Address varchar(50),
	Bouns decimal(10, 2),
	Salary decimal(10, 2),
	HourRate decimal,
	DepId int references Departments(Id) --references Departments(Id)
)

-- Create Table: Courses
Create Table Courses
(
	Id int Primary Key Identity(100, 100),
	Name varchar(20) not null,
	Duration decimal,
	Description varchar(50),
	topId int  --references Topics(Id)
)

-- Create Table: Topics
Create Table Topics
(
	Id int Primary Key Identity(1, 1),
	Name varchar(20) not null,
)

-- Create Table: StudCourse
Create Table StudCourse
(
	StudId int references Students(Id),
	CourseId int references Courses(Id),
	Primary Key(StudId, CourseId),
	Grade decimal
)

-- Create Table: CourseInstructor
Create Table [Course Instructor]
(
	CourseId int references Courses(Id),
	InstId int references Instructors(Id),
	Primary Key(CourseId, InstId),
	Evaluation varchar(50)
)

-- Alter Tables for Foreign Keys
Alter Table Students
Add Foreign Key(DepId) references Departments(Id)

Alter Table Departments
Add Foreign Key(InstructorId) references Instructors(Id)

Alter Table Courses
Add Foreign Key(topId) references Topics(Id)

-- Observations and potential improvements 

Alter Table Courses
Alter Column topId int not null 

Alter Table Courses
Add Constraint UQ_topId unique(topId)

