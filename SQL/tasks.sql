CREATE DATABASE new_table ;

USE new_table ; 


/* 	Task 1 : Create a table named table_truncate
	Use variables Gender (varchar(255)) and Age (integer)
	Add the following values into table_truncate
	('Male', 45)
	('Female', 27)
	('Male', 33)
	('Female', 38)
	Select all the columns of the table and show the result
	Delete all the values of the table
*/

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

TRUNCATE TABLE table_truncate ;
-- DELETE FROM table_truncate ;



----------------------------------------------------------------------------------------------

/*	Task 2 : Create a table named table_check
	Use variables Gender (varchar(255)) and Age (integer)
	Use CHECK function so that the column salary does not accept values less than 10000 USD.
*/

CREATE TABLE table_check
(
Gender VARCHAR(255),
Age INT,
Salary INT
CHECK (Salary >= 10000)
);





---------------------------------------------------------------------------------------------------------

/*	Task 3 : Create a table using the following information: 
	Table name: table_constraint 
	Columns & datatypes: StudentID (integer), StudentNames (varchar(255)), Age (integer) 
	Insert the following values: 
	(1, "Alex", 18.43) 
	(2, "Akash", 27.56) 
	(3, "Ramisha", 21.45) 
	Write necessary code to add constraint StudentID as a Primary Key on the column StudentID 
*/

CREATE TABLE table_constraint
(
StudentID INT, 
StudentNames VARCHAR(255), 
Age DOUBLE
);


INSERT INTO table_constraint
VALUES 
(1, "Alex", 18.43),  (2, "Akash", 27.56),  (3, "Ramisha", 21.45) 
;


ALTER TABLE table_constraint  ADD PRIMARY KEY (StudentID);

SELECT * FROM table_constraint ;


/*	Task 4 : Create a table using the following information: 
	Table name: table_fk 
	Columns & datatypes: CourseID (integer), CourseNames (varchar(255)) 
	Insert the following values: 
	(11, "English") 
	(12, "Math") 
	(13, "Language") 
	Make the CourseID as the primary key for the table table_fk. The constraint name will be CourseID. 

	Create another table using the following information: 
	Table name: table_pk 
	Columns & datatypes: StudentID (integer), CourseID (integer), StudentNames (varchar(255)), Age (integer) 
	Insert the following values: 
	(1, 11, "Alex", 18.43) 
	(2, 12, "Akash", 27.56) 
	(3, 13, "Ramisha", 21.45) 

	Make the StudentID as the primary key for the table table_pk. The constraint name will be StudentID. 

	Write necessary code to add constraint fk_CourseID as a Foreign Key on the column CourseID 
    for the table table_pk where the reference table is table_fk. 

*/

CREATE TABLE table_fk
(
CourseID INT, 
CourseNames VARCHAR(255)
);

INSERT INTO table_fk
VALUES (11, "English"), (12, "Math"), (13, "Language") ;

ALTER TABLE table_fk  ADD PRIMARY KEY (CourseID);

SELECT * FROM table_fk ;

--------------------------------------------------------------------

CREATE TABLE table_pk
(
 StudentID INT, 
 CourseID INT, 
 StudentNames VARCHAR(255), 
 Age DOUBLE
);

INSERT INTO table_pk
VALUES (1, 11, "Alex", 18.43), (2, 12, "Akash", 27.56), (3, 13, "Ramisha", 21.45) ;

SELECT * FROM table_pk ;

ALTER TABLE table_pk  ADD PRIMARY KEY (StudentID);

ALTER TABLE table_pk
ADD CONSTRAINT fk_table FOREIGN KEY (CourseID) 
REFERENCES table_fk(CourseID);


---------------------------------------------------------------------------------------------------------

/*	Task 5 : Create a table using the following information: 
	Table name: drop_constraint 
	Columns & datatypes: StudentID (integer), StudentNames (varchar(255)), Age (integer) 
	Insert the following values: 
	(1, "Alex", 18.43) 
	(2, "Akash", 27.56) 
	(3, "Ramisha", 21.45) 
	
    Add constraint StudentID as a Primary Key on the column StudentID 
	Now drop the primary key 

*/


CREATE TABLE drop_constraint
(
StudentID INT,
StudentNames VARCHAR(255),
Age DOUBLE
);

INSERT INTO drop_constraint
VALUES (1, "Alex", 18.43), (2, "Akash", 27.56), (3, "Ramisha", 21.45) ;

ALTER TABLE drop_constraint ADD PRIMARY KEY (StudentID) ;

ALTER TABLE drop_constraint 
DROP PRIMARY KEY ;

SELECT * FROM drop_constraint ;

SELECT * FROM drop_constraint
WHERE Age IS NULL ;