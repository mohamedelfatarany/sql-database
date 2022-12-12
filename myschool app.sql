create database myschool ;
go
use myschool ;
go
create table STAGES
(
       stageid   int constraint pk_staid primary key identity (1,1),
	   stagename nvarchar(25) not null
);
create table CLASSES 
(
       classid   int constraint pk_claid primary key identity (1,1),
	   classname nvarchar(25),
	   stageid   int references STAGES (stageid)
);      
create table STUDENTS 
(      
       studentid int constraint pk_stuid primary key identity (1,1),
       firstname nvarchar(20) not null,
	   lastname  nvarchar(25) not null,
	   gender    nvarchar(1)  not null,
	   birthdate date not null,
	   stageid   int references STAGES (stageid),
	   classid   int references CLASSES (classid)
);
create table SECTIONS
(
       sectionid int constraint pk_secid primary key identity (1,1),
	   sectionname nvarchar(50) not null,
);
create table EMPLOYEES
(
       employeeid int constraint pk_empid primary key identity (1,1), 
	   firstname  nvarchar(25) not null,
	   lastname   nvarchar(25) not null,
	   gender     nvarchar(1) not null,
	   job        nvarchar(25) not null,
	   address    nvarchar(50) not null,
	   sectionid  int references SECTIONS (sectionid)
);
create table SUBJECTS
(
       subjectid int constraint pk_subid primary key identity (1,1),
	   subjectname nvarchar(25) not null,
);
create table MARKS
(
       markid      int constraint pk_marid primary key identity (1,1),
	   subjectname int references SUBJECTS (subjectid),
	   studentid   int references STUDENTS (studentid),
	   mark        bit not null
);
create table PARENTS 
(
       parentid  int constraint pk_parid identity (1,1),
	   firstname nvarchar(25) not null,
	   lastname  nvarchar(25) not null,
	   address   nvarchar(50) 
);
create table PARENTPHONES
(
       parentid    int references PARENTS (parentid),
	   phonenumber nvarchar(25)
	   constraint pk_parph primary key (parentid,phonenumber)
);
