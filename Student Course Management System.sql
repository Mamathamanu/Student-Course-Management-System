drop database  if exists studentdb;

create database studentdb;
use studentdb;

create table students( student_id int primary key,
						name varchar(30),
                        gender enum('male','female'),
                        age int,
                        city varchar(30));
                        
create table course(course_id int primary key ,
					course_name varchar(30),
                    duration_months int,
                    fee decimal(7,2));
               
create table enrollments(enrollment_id int primary key,
						student_id int,
                        course_id int,
                        enrollment_date date,
                        grade char(3),
                        foreign key(student_id) references students(student_id),
                        foreign key(course_id) references course(course_id));

desc students;



insert into students(student_id,name,gender,age,city) values
(1,'Aarav', 'Male', 19, 'Bangalore'),
(2,'Sneha', 'Female', 22, 'Hyderabad'),
(3,'Rahul', 'Male', 19, 'Chennai'),
(4,'Priya', 'Female', 21, 'Mumbai'),
(5,'Kiran', 'Male', 23, 'Delhi');
select * from students;
insert into course(course_id,course_name,duration_months,fee) values
(1,'MySQL', 3, 15000),
(2,'Python', 4, 20000),
(3,'Power BI', 2, 18000),
(4,'Tableau', 3, 17000),
(5,'Excel Analytics', 1, 10000);

INSERT INTO Enrollments(enrollment_id,student_id, course_id, enrollment_date, grade)
VALUES
(1,1, 1, '2026-05-01', 'A'),
(2,2, 3, '2026-05-03', 'B'),
(3,3, 2, '2026-05-05', 'A'),
(4,4, 4, '2026-05-07', 'C'),
(5,5, 5, '2026-05-10', 'B');

#UPDATE and DELETE Operations
#UPDATE Example
#Change Priya’s city to Pune.

set sql_safe_updates=0;
update students set city='Pune' where  name="priya";

select * from students;

#Delete enrollment record with ID 5.
delete from enrollments where enrollment_id=5;
select * from enrollments;

/*
Write DQL queries to retrieve and analyze data as per the following examples:
   - Display all student details.
   - Display students from a particular city.
   - Display student names with courses and grades using JOIN.
   - Find average course fee.
   - Count students enrolled per course.
   - Display top 2 most expensive courses.
*/
#Display all student details.
select * from students;

#Display students from a particular city.
select * from students where city="pune";

#Display student names with courses and grades using JOIN.

select  s.name,
		c.course_name,
        e.grade from students s
        join enrollments e on s.student_id=e.student_id
        join course c on c.course_id=e.course_id;





# Find average course fee.
select avg(fee)as avg_course_fee from course;

#Count students enrolled per course.
select c.course_name,count(e.student_id)as total_student
from course c
left join enrollments e on c.course_id=e.course_id
group by c.course_name;


#Display top 2 most expensive courses.
select * from course 
order by fee desc
limit 2;

#Add Email Column Using ALTER TABLE
alter table students add column email varchar(30);

#Create a VIEW combining Students, Courses, and Enrollments.
CREATE VIEW STDCRSEN AS (
		SELECT S.STUDENT_ID,S.NAME,
				C.COURSE_ID,C.COURSE_NAME,
                E.ENROLLMENT_ID,E.GRADE
		FROM STUDENTS s
        JOIN ENROLLMENTS E ON E.STUDENT_ID=S.STUDENT_ID
        JOIN COURSE C ON C.COURSE_ID=E.COURSE_ID);

SELECT *FROM STDCRSEN;
CREATE VIEW StudentCourseView AS
SELECT 
    s.name,
    s.city,
    c.course_name,
    e.grade
FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Course c
ON c.course_id = e.course_id;

SELECT * FROM STUDENTCOURSEVIEW;

#Apply CHECK constraints (e.g., age ≥ 18).
alter table students add constraint check(age>=18);

#Students with Grade A
select s.student_id,s.name,e.grade
from students s
left join enrollments e on s.student_id=e.student_id
where grade="A";

#students with course
SELECT s.name, c.course_name
FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Course c
ON c.course_id = e.course_id
WHERE e.grade = 'A';

#students name ,course,grade="a"

select s.name,
		c.course_name,
        e.grade
	from students s
    left join enrollments e on s.student_id=e.student_id
    left join course c on c.course_id=e.course_id
    where grade="a";

#Highest Fee Course
select course_name,fee
from course 
order by fee desc
limit 1;

#Total Number of Students
select count(*) as totla_students from students;