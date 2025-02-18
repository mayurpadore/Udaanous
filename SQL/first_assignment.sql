-- CREATE DATABASE sample_database ;

USE sample_database  ;

-- DROP sample_database ;

-- ALTER DATABASE sample_database  CHARACTER SET ascii COLLATE ascii_general_ci ENCRYPTION = "Y" READ ONLY = 0; 

SHOW DATABASES ;


ALTER TABLE courses_data RENAME COLUMN `Course ID` TO course_id ;
ALTER TABLE courses_data RENAME COLUMN `Course Name` TO course_name ;
ALTER TABLE courses_data RENAME COLUMN `Course Level` TO course_level ;

ALTER TABLE enrollments_data RENAME COLUMN `Enrollment ID` TO enroll_id ;
ALTER TABLE enrollments_data RENAME COLUMN `Student ID` TO student_id ;
ALTER TABLE enrollments_data RENAME COLUMN `Course ID` TO course_id;

ALTER TABLE student_info RENAME COLUMN `Student ID` TO student_id ;
ALTER TABLE student_info RENAME COLUMN `First Name` TO first_name ;
ALTER TABLE student_info RENAME COLUMN `Last Name` TO last_name ;


ALTER TABLE courses_data  ADD PRIMARY KEY (course_id);
ALTER TABLE enrollments_data  ADD PRIMARY KEY (enroll_id);
ALTER TABLE student_info  ADD PRIMARY KEY (student_id);


ALTER TABLE enrollments_data
ADD CONSTRAINT fk_student FOREIGN KEY (student_id) 
REFERENCES student_info(student_id);

ALTER TABLE enrollments_data 
ADD CONSTRAINT fk_course FOREIGN KEY (course_id) 
REFERENCES courses_data(course_id);







SELECT * FROM courses_data ; 
SELECT * FROM enrollments_data ; 
SELECT * FROM student_info ; 

SELECT COUNT(first_name) FROM student_info ;

SELECT DISTINCT COUNT(first_name) FROM student_info ;

SELECT COUNT(course_name) FROM courses_data ;

SELECT DISTINCT course_name FROM courses_data ;

SELECT COUNT(DISTINCT course_name) FROM courses_data ;

SELECT COUNT(DISTINCT course_name) AS COURSES FROM courses_data ;

ALTER TABLE student_info RENAME COLUMN `GPA` TO grade_point_average ;

ALTER TABLE student_info RENAME COLUMN `grade_point_average` TO GPA ;

SELECT credits, grade, gpa FROM courses_data, enrollments_data, student_info ;

SELECT c.credits, e.grade, s.gpa FROM courses_data AS c , enrollments_data AS e , student_info AS s ;


SELECT gender, department, gpa 
FROM student_info
WHERE age > 20 ;





CREATE TABLE sports_depart
(
sports_id INT NOT NULL PRIMARY KEY,
sports VARCHAR(10), 
height INT,
weight INT
);





CREATE TABLE table_truncate
(
Gender VARCHAR(25),  
Age INT
);

INSERT INTO table_truncate
VALUES 
('Male' , 45), ('Female', 27), ('Male', 33),('Female', 38)
;

SELECT * FROM table_truncate ;

INSERT INTO table_truncate
VALUES 
('Male' , 50), ('Female', 71), ('Male', 63),('Female', 48)
;










