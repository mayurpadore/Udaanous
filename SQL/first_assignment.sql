CREATE DATABASE sample_database ;

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


