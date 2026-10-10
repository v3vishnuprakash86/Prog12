
USE CollegeDB;

-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

-- Create Faculty table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FacultyID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID),
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

-- Insert Department records
INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(10, 'Computer Science'),
(20, 'Mathematics'),
(30, 'Physics');

-- Insert Student records
INSERT INTO Student (StudentID, StudentName, DepartmentID) VALUES
(1001, 'Arun', 10),
(1002, 'Priya', 20),
(1003, 'Kumar', 10),
(1004, 'Divya', 30);

-- Insert Faculty records
INSERT INTO Faculty (FacultyID, FacultyName, DepartmentID) VALUES
(501, 'Ravi', 10),
(502, 'Meena', 20),
(503, 'Karthik', 30);

-- Insert Course records
INSERT INTO Course (CourseID, CourseName, DepartmentID, FacultyID) VALUES
(201, 'Database Systems', 10, 501),
(202, 'Mathematics', 20, 502),
(203, 'Physics', 30, 503),
(204, 'Data Structures', 10, 501);

-- Insert Enrollment records
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID) VALUES
(1, 1001, 201),
(2, 1001, 204),
(3, 1002, 202),
(4, 1003, 201),
(5, 1004, 203);
