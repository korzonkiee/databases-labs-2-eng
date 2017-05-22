-- Task 1

-- -- a)

Create Table Students (
	StudentId int Not Null,
	Name varchar(100) Not Null,
	Surname varchar(100) Not Null,
	[Group] varchar(50) Not Null,
	Field varchar(50) Not Null,

	Constraint PK_StudentId Primary Key Clustered (StudentId Asc)
);

Create Table Courses (
	CourseId int Not Null,
	TeacherName varchar(100) Not Null,
	TeacherSurname varchar(100) Not Null,
	CourseCode varchar(50) Not Null,
	Field varchar(50) Not Null,
	ExpirationDate date Not Null,
	ECTS int Not Null,

	Constraint PK_CourseId Primary Key Clustered (CourseId Asc)
);

Create Table StudentsCourses (
	StudentId int Not Null,
	CourseId int Not Null,
	RegistrationDate date Not Null,
	FinishDate date Not Null,
	FinalMark tinyint Null,

	Constraint PK_StudentId_CourseId Primary Key Clustered (StudentId Asc, CourseId Asc),

	Constraint FK_StudentsCourses_Students_StudentId Foreign Key (StudentId) References Students(StudentId),
	Constraint FK_StudentsCourses_Courses_CourseId Foreign Key (CourseId) References Courses(CourseId)
)

-- -- b)

Alter Table Students
	Add AverageMark decimal(3, 2) Null

Alter Table Students
	Add PassedCoursesCounter int Default 0

-- -- c)

Insert Into Courses Values(1, 'Jan', 'Spaliñski', 'ANAL', 'Analiza matematyczna', '2017-06-30', 6)
Insert Into Courses Values(2, 'Tomasz', 'Brengos', 'DYSK', 'Dyskretna', '2017-06-28', 4)

-- -- d)

Update Courses Set TeacherName = 'John', TeacherSurname = 'Smith' Where TeacherName = 'Tom' and TeacherSurname = 'Levis'

-- -- e)

Delete From Courses Where CourseCode = 'DB1'




-- Task 2

Create NonClustered Index IDX_Students_Name_Surname On Students (Name, Surname)
Create NonClustered Index IDX_Courses_TeacherName_TeacherSurname On Courses (TeacherName, TeacherSurname)
Create NonClustered Index IDX_StudentsCourses_RegistrationDate_FinishDate On StudentsCourses (RegistrationDate, FinishDate)