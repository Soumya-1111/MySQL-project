-- student_management_full.sql
-- Beginner MySQL project: Student Management System with extended data

-- Create database
CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

-- Drop tables if exist (for rerun convenience)
DROP TABLE IF EXISTS marks;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS students;

-- Create tables
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    course VARCHAR(100)
);

CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100),
    max_marks INT DEFAULT 100
);

CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    marks_obtained INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- Insert students (10 students)
INSERT INTO students (name, age, gender, course) VALUES
('Soumya', 19, 'Female', 'B.Com'),
('Ravi', 20, 'Male', 'BCA'),
('Priya', 21, 'Female', 'B.Sc'),
('Arjun', 22, 'Male', 'B.Com'),
('Sneha', 19, 'Female', 'BBA'),
('Karthik', 21, 'Male', 'B.Sc'),
('Anjali', 20, 'Female', 'BCA'),
('Vikram', 22, 'Male', 'B.Com'),
('Nithya', 19, 'Female', 'BBA'),
('Harish', 20, 'Male', 'B.Sc');

-- Insert subjects (7 subjects)
INSERT INTO subjects (subject_name) VALUES
('Accounts'),
('Economics'),
('Business Law'),
('English'),
('Statistics'),
('Computer Science'),
('Marketing');

-- Insert marks for all students (each subject)
INSERT INTO marks (student_id, subject_id, marks_obtained) VALUES
-- Soumya
(1,1,85),(1,2,78),(1,3,90),(1,4,88),(1,5,92),(1,6,75),(1,7,80),
-- Ravi
(2,1,65),(2,2,70),(2,3,72),(2,4,60),(2,5,68),(2,6,80),(2,7,75),
-- Priya
(3,1,88),(3,2,82),(3,3,85),(3,4,82),(3,5,91),(3,6,87),(3,7,90),
-- Arjun
(4,1,60),(4,2,67),(4,3,58),(4,4,62),(4,5,65),(4,6,70),(4,7,68),
-- Sneha
(5,1,95),(5,2,88),(5,3,92),(5,4,90),(5,5,85),(5,6,80),(5,7,87),
-- Karthik
(6,1,75),(6,2,70),(6,3,72),(6,4,78),(6,5,80),(6,6,85),(6,7,88),
-- Anjali
(7,1,82),(7,2,85),(7,3,80),(7,4,87),(7,5,90),(7,6,92),(7,7,95),
-- Vikram
(8,1,68),(8,2,70),(8,3,65),(8,4,72),(8,5,74),(8,6,78),(8,7,80),
-- Nithya
(9,1,90),(9,2,92),(9,3,88),(9,4,85),(9,5,87),(9,6,89),(9,7,91),
-- Harish
(10,1,70),(10,2,68),(10,3,65),(10,4,72),(10,5,75),(10,6,80),(10,7,78);

-- Sample queries for practice
-- Show all students
SELECT * FROM students;
-- Show all subjects
SELECT * FROM subjects;
-- Show marks of each student
SELECT s.name, sub.subject_name, m.marks_obtained
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id;
-- Average marks per student
SELECT s.name, AVG(m.marks_obtained) AS average_marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
GROUP BY s.name;
-- Students with average marks above 80
SELECT s.name, AVG(m.marks_obtained) AS avg_score
FROM marks m
JOIN students s ON m.student_id = s.student_id
GROUP BY s.name
HAVING avg_score > 80;
