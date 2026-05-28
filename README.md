Project Title: Student Course Management System


🎯 Objective of the Project

The objective of this project is to design and implement a simple Student Course Management System using MySQL that demonstrates:
- The use of DDL (Data Definition Language) for creating and modifying database structure.
- The use of DML (Data Manipulation Language) for inserting, updating, and deleting data.
- The use of DQL (Data Query Language) for retrieving and analyzing information.
This project helps students model real-world relationships between Students, Courses, and Enrollments.
🧱 Database Overview


The database consists of three main tables:
1. Students – stores basic information about students.
2. Courses – stores details about available courses.
3. Enrollments – stores which student has enrolled in which course.

🧩 Table Design and Structure
1. Students Table
Column Name	Data Type	Description
student_id	Integer (PK)	Unique identifier for each student
name	Varchar	Name of the student
gender	Enum/Varchar	Gender of the student
Age	Integer	Age of the student
City	Varchar	City where the student resides
Utility: Stores all personal and demographic details of registered students.
2. Courses Table
Column Name	Data Type	Description
course_id	Integer (PK)	Unique identifier for each course
course_name	Varchar	Name of the course
duration_months	Integer	Duration in months
Fee	Decimal	Course fee
Utility: Stores the list of all courses with their duration and fee structure.
3. Enrollments Table
Column Name	Data Type	Description
enrollment_id	Integer (PK)	Unique identifier for each enrollment
student_id	Integer (FK)	Links to student
course_id	Integer (FK)	Links to course
enrollment_date	Date	Date when enrolled
Grade	Char	Grade achieved by student
Utility: Acts as a bridge between Students and Courses, storing enrollment and performance details.
⚙️ Step-by-Step Instructions
1. Create a new database named StudentDB and select it for use.
2. Create the three tables as designed above using DDL commands.
3. Insert at least 3–5 records into each table using DML commands.
4. Perform UPDATE and DELETE operations to modify and remove records.
5. Write DQL queries to retrieve and analyze data as per the following examples:
   - Display all student details.
   - Display students from a particular city.
   - Display student names with courses and grades using JOIN.
   - Find average course fee.
   - Count students enrolled per course.
   - Display top 2 most expensive courses.
🧮 Optional Enhancements
- Add new columns using ALTER TABLE.
- Create a VIEW combining Students, Courses, and Enrollments.
- Apply CHECK constraints (e.g., age ≥ 18).
🧠 Expected Learning Outcomes
After completing this project, students will be able to:
- Design relational tables with proper keys.
- Use DDL, DML, and DQL commands effectively.
- Perform joins, filters, and aggregate queries.
- Model small real-world systems using relational databases.

