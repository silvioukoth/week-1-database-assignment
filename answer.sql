USE students_management;
-- =====================================================
-- STUDENT MANAGEMENT DATABASE
-- MySQL Database Assignment
-- =====================================================

-- 1. CREATE DATABASE
-- This creates a new database called student_management.

CREATE DATABASE student_management;


-- 2. SELECT THE DATABASE
-- USE tells MySQL which database we want to work with.

USE student_management;


-- =====================================================
-- 3. CREATE STUDENTS TABLE
-- =====================================================

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE,
    gender VARCHAR(10)
);


-- =====================================================
-- 4. CREATE COURSES TABLE
-- =====================================================

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE,
    duration_months INT
);


-- =====================================================
-- 5. CREATE ENROLLMENTS TABLE
-- =====================================================

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);


-- =====================================================
-- 6. INSERT STUDENTS
-- =====================================================

INSERT INTO students
(first_name, last_name, age, email, gender)
VALUES
('Silvio', 'Ukoro', 30, 'silvio@example.com', 'Male'),
('John', 'Otieno', 24, 'john@example.com', 'Male'),
('Mary', 'Achieng', 22, 'mary@example.com', 'Female'),
('Grace', 'Wanjiku', 25, 'grace@example.com', 'Female'),
('David', 'Kiptoo', 27, 'david@example.com', 'Male');


-- =====================================================
-- 7. INSERT COURSES
-- =====================================================

INSERT INTO courses
(course_name, course_code, duration_months)
VALUES
('Software Engineering', 'SE101', 12),
('Web Development', 'WD101', 6),
('Database Management', 'DB101', 6),
('Data Science', 'DS101', 12);


-- =====================================================
-- 8. INSERT ENROLLMENTS
-- =====================================================

INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(1, 1, '2026-01-10'),
(2, 2, '2026-01-15'),
(3, 3, '2026-02-01'),
(4, 2, '2026-02-05'),
(5, 4, '2026-02-10');


-- =====================================================
-- 9. DISPLAY ALL STUDENTS
-- =====================================================

SELECT * FROM students;


-- =====================================================
-- 10. DISPLAY ALL COURSES
-- =====================================================

SELECT * FROM courses;


-- =====================================================
-- 11. DISPLAY ALL ENROLLMENTS
-- =====================================================

SELECT * FROM enrollments;


-- =====================================================
-- 12. SELECT SPECIFIC COLUMNS
-- =====================================================

SELECT first_name, last_name, email
FROM students;


-- =====================================================
-- 13. USE WHERE TO FIND STUDENTS
-- =====================================================

SELECT *
FROM students
WHERE age > 24;


-- =====================================================
-- 14. FIND FEMALE STUDENTS
-- =====================================================

SELECT *
FROM students
WHERE gender = 'Female';


-- =====================================================
-- 15. SORT STUDENTS BY AGE
-- =====================================================

SELECT *
FROM students
ORDER BY age ASC;


-- =====================================================
-- 16. SORT STUDENTS FROM OLDEST TO YOUNGEST
-- =====================================================

SELECT *
FROM students
ORDER BY age DESC;


-- =====================================================
-- 17. COUNT STUDENTS
-- =====================================================

SELECT COUNT(*) AS total_students
FROM students;


-- =====================================================
-- 18. FIND AVERAGE AGE
-- =====================================================

SELECT AVG(age) AS average_age
FROM students;


-- =====================================================
-- 19. FIND OLDEST STUDENT
-- =====================================================

SELECT MAX(age) AS oldest_student
FROM students;


-- =====================================================
-- 20. FIND YOUNGEST STUDENT
-- =====================================================

SELECT MIN(age) AS youngest_student
FROM students;


-- =====================================================
-- 21. UPDATE A STUDENT
-- =====================================================

UPDATE students
SET age = 31
WHERE student_id = 1;


-- Check the updated record

SELECT *
FROM students
WHERE student_id = 1;


-- =====================================================
-- 22. UPDATE A STUDENT'S EMAIL
-- =====================================================

UPDATE students
SET email = 'silvio.ukoro@example.com'
WHERE student_id = 1;


-- =====================================================
-- 23. DELETE A STUDENT
-- =====================================================

-- This example deletes student number 5.

DELETE FROM students
WHERE student_id = 5;


-- Check remaining students

SELECT * FROM students;


-- =====================================================
-- 24. ADD A NEW COLUMN
-- =====================================================

ALTER TABLE students
ADD phone VARCHAR(20);


-- =====================================================
-- 25. UPDATE THE NEW COLUMN
-- =====================================================

UPDATE students
SET phone = '+254700000000'
WHERE student_id = 1;


-- =====================================================
-- 26. VIEW TABLE STRUCTURE
-- =====================================================

DESCRIBE students;


-- =====================================================
-- 27. JOIN STUDENTS AND ENROLLMENTS
-- =====================================================

SELECT
    students.first_name,
    students.last_name,
    enrollments.enrollment_date
FROM students
JOIN enrollments
ON students.student_id = enrollments.student_id;


-- =====================================================
-- 28. JOIN STUDENTS, COURSES AND ENROLLMENTS
-- =====================================================

SELECT
    students.first_name,
    students.last_name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
ON enrollments.student_id = students.student_id
JOIN courses
ON enrollments.course_id = courses.course_id;


-- =====================================================
-- END OF ASSIGNMENT
-- =====================================================