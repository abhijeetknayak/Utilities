CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30),
    major VARCHAR(20)
);

DESCRIBE student;

#DROP TABLE student;

ALTER TABLE student ADD gpa DECIMAL(3,2);

ALTER TABLE student DROP COLUMN gpa;

INSERT INTO student VALUES(1, 'Abhijeet', 'Robotics');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student(student_id, student_name) VALUES(3, 'Kate');

SELECT * FROM student;

# Easier way to insert into tables
DROP TABLE student;

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(30),
    major VARCHAR(0) DEFAULT 'Undecided'
);

INSERT INTO student(student_name, major) VALUES('Abhijeet', 'Robotics');
INSERT INTO student(student_name, major) VALUES('Abhijeet', 'Robotics');
INSERT INTO student(student_name, major) VALUES('Kate', 'Sociology');
INSERT INTO student(student_id, student_name) VALUES(3, 'Kate');

# Updating and Deleting

UPDATE student
SET major = 'tyyty';

DELETE FROM student 
WHERE student_id = 1;

DELETE FROM student;

INSERT INTO student(student_name, major) VALUES('Jack', 'Biology');
INSERT INTO student(student_name, major) VALUES('Kate', 'Sociology');
INSERT INTO student(student_name, major) VALUES('Claire', 'Chemistry');
INSERT INTO student(student_name, major) VALUES('Jack', 'Biology');
INSERT INTO student(student_name, major) VALUES('Mike', 'Computer Science');

SELECT *
FROM student
ORDER BY student_name ASC, major DESC, student_id DESC;

SELECT * FROM student
WHERE major = 'Chemistry'
LIMIT 2;

SELECT * FROM student
WHERE student_name IN ('Jack', 'Mike') AND student_id <> 6;