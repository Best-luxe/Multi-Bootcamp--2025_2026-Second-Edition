DROP TABLE IF EXISTS STUDENTS cascade; 
-- Students Table
CREATE TABLE Students(student_id serial primary key,
first_name varchar(50),last_name
varchar(50),date_of_birth date,enrollment_date date,
major varchar(100));

DROP TABLE IF EXISTS COURSES 
-- Courses Table
CREATE TABLE courses(course_id serial primary key,course_name varchar(100),
credits int,department varchar(100));

DROP TABLE IF EXISTS INSTRUCTORS
-- Instructors Table
CREATE TABLE instructors(instructor_id serial primary key,
first_name varchar(50),last_name varchar(50),hire_date date,
department varchar(100));

-- Enrollments Table
CREATE TABLE enrollments(enrollment_id Serial primary key,
student_id integer,course_id integer,semester varchar(20),
Year INT ,Grade varchar(2));

-- insert at least 10 students

INSERT INTO Students(first_name,last_name,date_of_birth,
enrollment_date,major)
VALUES
('Best','Kosi','2002-05-10','2021-09-01','Data Science'),
('Ada','Chima','2001-03-15','2020-09-01','Business'),
('Victor','Silver','2003-07-20','2022-09-01','Engineering'),
('Smith','Naza','2002-11-25','2021-09-01','Mathematic'),
('Victory','Sam','2001-08-14','2020-09-01','Physics'),
('Solomon','Justin','2003-01-18','2022-09-01','Biology'),
('Jame','Emma','2002-06-09','2021-09-01','Chemistry'),
('Olivia','Thomas','2001-12-30','2020-09-01','Economics'),
('William','Jackson','2002-09-22','2022-09-01','History'),
('Favour','Rita','2003-09-22','2022-09-01','Data Science')

-- Insert at least 8 Courses
INSERT INTO courses(course_name,credits,department)
VALUES
('Database Systems',4,'Data Science'),
('Business Mangement',3,'Business'),
('Engineering Drawing',4,'Engineering'),
('Calculus II',3,'Mathematics'),
('Modern Physics',4,'Physics'),
('Organic Chemistry',3,'Chemistry'),
('Microeconomics',3,'Economics'),
('World History',2,'History');
Insert INTO instructors(first_name,last_name,hire_date,department)
VALUES
('Robert','Miller','2015-06-15','Data Science'),
('Linda','Moore','2017-03-20','Business'),
('David','Clark','2018-01-10','Enginerring'),
('Susan','Hall','2016-09-05','Mathematics'),
('Mark','Lewis','2019-11-25','Physics')

-- Insert at least 20 Entrollment Records
INSERT INTO enrollments(student_id,course_id,
semester,year,grade)
VALUES
(1,1,'Fall',2024,'A'),
(2,2,'Fall',2024,'B'),
(3,3,'Fall',2024,'A'),
(4,4,'Fall',2024,'B'),
(5,5,'Fall',2024,'A'),
(6,6,'Fall',2024,'C'),
(7,6,'Fall',2024,'B'),
(8,7,'Fall',2024,'A'),
(9,8,'fall',2024,'B'),
(10,1,'Fall',2024,'A'),
(1,4,'Spring',2025,'A'),
(2,7,'Spring',2025,'B'),
(3,5,'Spring',2025,'A'),
(4,1,'Spring',2025,'A'),
(5,3,'Spring',2025,'B'),
(6,2,'Spring',2025,'A'),
(7,8,'Spring',2025,'C'),
(8,6,'Spring',2025,'B'),
(9,2,'Spring',2025,'A'),
(10,5,'Spring',2025,'B')
Queries
Select * FROM courses
WHERE credits>3;
-- Find all instructors in a particular
-- department
SELECT * FROM instructors
WHERE department='Data Science'
Select * From Enrollments
Select * From Students

