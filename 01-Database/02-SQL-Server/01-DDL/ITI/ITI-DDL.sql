-- Create Database
Create Database ITI

USE ITI;

-- Create Table: Students
Create Table Students
(
	Id int Primary Key Identity(1, 1),
	FirstName varchar(20) not null, --Required
	LastName varchar(20),
	Age int,
	Address varchar(50),
	DepartmentId int --references Departments(Id)
);

-- Create Table: Departments
Create Table Departments
(
	Id int Primary Key Identity(10, 10),
	Name varchar(20) not null,
	HiringDate date,
	InstructorId int --references Instructors(Id)
);

-- Create Table: Instructors
Create Table Instructors
(
	Id int Primary Key Identity(1, 1),
	Name varchar(20) not null,
	Address varchar(50),
	Bouns decimal(10, 2),
	Salary decimal(10, 2),
	HourRate decimal,
	DepartmentId int references Departments(Id) --references Departments(Id)
);

-- Create Table: Courses
Create Table Courses
(
	Id int Primary Key Identity(100, 100),
	Name varchar(20) not null,
	Duration decimal,
	Description varchar(50),
	topicId int  --references Topics(Id)
);

-- Create Table: Topics
Create Table Topics
(
	Id int Primary Key Identity(1, 1),
	Name varchar(20) not null,
);

-- Create Table: StudentCourse
Create Table StudentCourse
(
	StudentId int references Students(Id),
	CourseId int references Courses(Id),
	Primary Key(StudentId, CourseId),
	Grade decimal
);

-- Create Table: CourseInstructor
Create Table [Course Instructor]
(
	CourseId int references Courses(Id),
	InstructorId int references Instructors(Id),
	Primary Key(CourseId, InstructorId),
	Evaluation varchar(50)
);

-- Alter Tables for Foreign Keys
Alter Table Students
Add Foreign Key(DepartmentId) references Departments(Id)

Alter Table Departments
Add Foreign Key(InstructorId) references Instructors(Id)

Alter Table Courses
Add Foreign Key(topicId) references Topics(Id)

-- Observations and potential improvements 

Alter Table Courses
Alter Column topicId int not null 

Alter Table Courses
Add Constraint UQ_topicId unique(topicId)

