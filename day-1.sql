-- Single Line Comment

/*
Multi
Line
Comments
*/

## This is also used as single line comment in sql

/*
Usage of Comments

1. Documentation:
   - Explains the purpose of queries.
2️. Debugging:
   - Temporarily disable parts of code.
3️. Collaboration:
   - Helps teams understand each other’s logics in a team..
*/

-- ----------------------------------------- Database Queries ------------------------------------------

-- create a database first
create database myCollege;

-- to work on this database, you need to use it first
-- to execute (ctrl + enter)
use myCollege;

-- to delete database
drop database MyCollege;

-- SQL is not a case-sensitive language (As- AGE or age will be treated as same word)

-- ---------------------------------------- Database Analysis -------------------------------------
/*
T1 – Student(id, name, dob, gender, city, email, phone, admission_date, department_id, hostel_id);

T2 – Faculty(id, name, gender, subject, designation, department_id, salary, contact, email, join_date);

T3 – Department(id, name, hod, contact_email, contact_phone, building, established_year, total_faculty, total_students, accreditation_status);

T4 – Timetable(id, department_id, semester, subject, day, start_time, end_time, faculty_id, room_no, mode);  -- mode: online/offline

T5 – Hostel(id, name, type, warden_name, contact, total_rooms, capacity, occupied_rooms, location, established_year);

T6 – Canteen_Menu(id, item_name, category, price, availability, ingredients, calories, vendor_name, preparation_time, last_updated);

T7 – Library(id, book_title, author, category, isbn, publisher, edition, year_published, total_copies, available_copies);

T8 – Attendance(id, student_id, subject, date, status, remarks, faculty_id, class_type, period, recorded_time);

T9 – Placement_Record(id, student_id, company_name, role_offered, package, placement_date, interview_rounds, location, hr_contact, status);

T10 – Events(id, name, type, date, venue, organizer, department_id, description, target_audience, registration_required);
*/


-- --------------------------------------- Table Related Queries ---------------------------------

-- Table-1 T1 – Student(id, name, dob, gender, city, email, phone, admission_date, department_id, hostel_id);

-- create student table with 10 meaningful columns
create table Student (
    id INT PRIMARY KEY,                            -- primary key = unique + not null
    name VARCHAR(100) NOT NULL,                    -- student full name
    dob DATE NOT NULL,                             -- date of birth
    gender VARCHAR(10) CHECK(gender IN ('Male', 'Female', 'Other')),  -- gender constraint
    city VARCHAR(50),                              -- hometown city
    email VARCHAR(100) UNIQUE NOT NULL,            -- unique email
    phone VARCHAR(15) NOT NULL,                    -- contact number
    admission_date DATE ,      -- date of admission
    department_id INT,                             -- foreign key (to Department table)
    hostel_id INT                                   -- foreign key (to Hostel table)
);

-- to display table data
select * from Student;

-- insert a single value into the Student table
insert into Student(id, name, dob, gender, city, email, phone, admission_date, department_id, hostel_id)
values
(1, 'Kajal', '2006-07-15', 'Female', 'Mumbai', 'kajal@example.com', '9876543210', '2023-06-01', 101, 1);

-- insert record without specifying column names (must follow order)
insert into Student 
values
(2, 'Kavya', '2006-08-20', 'Female', 'Pune', 'kavya@example.com', '9988776655', '2023-06-01', 101, 1);

-- insert multiple student records
insert into Student 
values
(3, 'Riya', '2006-01-05', 'Female', 'Mumbai', 'riya@example.com', '9876500011', '2023-06-01', 101, 1),
(4, 'Omkar', '2005-12-12', 'Male', 'Nagpur', 'omkar@example.com', '9876500022', '2023-06-01', 102, 2),
(5, 'Anamika', '2006-04-18', 'Female', 'Nashik', 'anamika@example.com', '9876500033', '2023-06-01', 103, 1),
(6, 'Yash', '2005-11-25', 'Male', 'Pune', 'yash@example.com', '9876500044', '2023-06-01', 101, 1),
(7, 'Prasad', '2006-02-10', 'Male', 'Mumbai', 'prasad@example.com', '9876500055', '2023-06-01', 104, 2),
(8, 'Rahul', '2006-05-05', 'Male', 'Thane', 'rahul@example.com', '9876500066', '2023-06-01', 102, 2),
(9, 'Trisha', '2006-09-15', 'Female', 'Aurangabad', 'trisha@example.com', '9876500077', '2023-06-01', 103, 1),
(10, 'Riya', '2006-10-20', 'Female', 'Mumbai', 'riya2@example.com', '9876500088', '2023-06-01', 101, 1);

-- to remove complete records from Student table
truncate table Student;

-- to remove table structure (and all data)
drop table Student;


-- T2 – Faculty(id, name, gender, subject, designation, department_id, salary, contact, email, join_date);
create table Faculty (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10) CHECK(gender IN ('Male', 'Female', 'Other')),
    subject VARCHAR(100) NOT NULL,
    designation VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    contact VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    join_date DATE
);

-- Insert records
insert into Faculty values
(1, 'Dr. Sharma', 'Male', 'Physics', 'Professor', 101, 95000.00, '9876500001', 'sharma@example.com', '2018-06-01'),
(2, 'Ms. Mehta', 'Female', 'Mathematics', 'Assistant Professor', 102, 72000.00, '9876500002', 'mehta@example.com', '2020-08-15'),
(3, 'Mr. Verma', 'Male', 'Chemistry', 'Lecturer', 103, 58000.00, '9876500003', 'verma@example.com', '2021-01-20'),
(4, 'Mrs. Joshi', 'Female', 'Biology', 'Professor', 104, 98000.00, '9876500004', 'joshi@example.com', '2016-09-05'),
(5, 'Dr. Khan', 'Male', 'Computer Science', 'Associate Professor', 105, 88000.00, '9876500005', 'khan@example.com', '2019-07-11');

-- Display faculty data
select * from Faculty;

-- Remove all faculty records
truncate table Faculty;

-- Drop faculty table
drop table Faculty;


-- T3 – Department(id, name, hod, contact_email, contact_phone, building, established_year, total_faculty, total_students, accreditation_status);
create table Department (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    hod VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(15),
    building VARCHAR(50),
    established_year YEAR,
    total_faculty INT,
    total_students INT,
    accreditation_status VARCHAR(20)
);

-- Insert records
insert into Department values
(101, 'Physics', 'Dr. Sharma', 'physics@example.com', '9999900001', 'Block A', 2001, 10, 200, 'NAAC-A'),
(102, 'Mathematics', 'Ms. Mehta', 'math@example.com', '9999900002', 'Block B', 2003, 8, 180, 'NAAC-A'),
(103, 'Chemistry', 'Mr. Verma', 'chem@example.com', '9999900003', 'Block C', 2005, 7, 160, 'NAAC-B'),
(104, 'Biology', 'Mrs. Joshi', 'bio@example.com', '9999900004', 'Block D', 2000, 9, 170, 'NAAC-A+'),
(105, 'Computer Science', 'Dr. Khan', 'cs@example.com', '9999900005', 'Block E', 2010, 15, 300, 'NAAC-A++');

-- Display department data
select * from Department;

-- Remove all department records
truncate table Department;

-- Drop department table
drop table Department;


-- T4 – Timetable(id, department_id, semester, subject, day, start_time, end_time, faculty_id, room_no, mode);  -- mode: online/offline
create table Timetable (
    id INT PRIMARY KEY,
    department_id INT,
    semester INT CHECK(semester BETWEEN 1 AND 8),
    subject VARCHAR(100),
    day VARCHAR(20),
    start_time TIME,
    end_time TIME,
    faculty_id INT,
    room_no VARCHAR(10),
    mode VARCHAR(10) CHECK(mode IN ('Online', 'Offline'))
);

-- Insert records
insert into Timetable values
(1, 101, 1, 'Mechanics', 'Monday', '09:00', '10:00', 1, '101A', 'Offline'),
(2, 102, 2, 'Calculus', 'Tuesday', '10:00', '11:00', 2, '102B', 'Offline'),
(3, 103, 1, 'Organic Chemistry', 'Wednesday', '11:00', '12:00', 3, '103C', 'Online'),
(4, 104, 3, 'Genetics', 'Thursday', '01:00', '02:00', 4, '104D', 'Offline'),
(5, 105, 4, 'Data Structures', 'Friday', '03:00', '04:00', 5, '105E', 'Online');

-- Display timetable
select * from Timetable;

-- Remove timetable data
truncate table Timetable;

-- Drop timetable
drop table Timetable;


-- T5 – Hostel(id, name, type, warden_name, contact, total_rooms, capacity, occupied_rooms, location, established_year);
create table Hostel (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(20) CHECK(type IN ('Boys', 'Girls', 'Co-ed')),
    warden_name VARCHAR(100),
    contact VARCHAR(15),
    total_rooms INT,
    capacity INT,
    occupied_rooms INT,
    location VARCHAR(100),
    established_year YEAR
);

-- Insert records
insert into Hostel values
(1, 'Ganga', 'Girls', 'Mrs. Kulkarni', '9000010001', 50, 150, 45, 'East Wing', 2005),
(2, 'Yamuna', 'Boys', 'Mr. Patil', '9000010002', 60, 180, 50, 'West Wing', 2006),
(3, 'Saraswati', 'Co-ed', 'Dr. Rao', '9000010003', 40, 120, 35, 'North Wing', 2008),
(4, 'Krishna', 'Boys', 'Mr. Deshmukh', '9000010004', 55, 160, 52, 'South Wing', 2007),
(5, 'Godavari', 'Girls', 'Mrs. Joshi', '9000010005', 45, 135, 40, 'Central Block', 2010);

-- View hostels
select * from Hostel;

-- Truncate hostels
truncate table Hostel;

-- Drop hostel
drop table Hostel;


-- T6 – Canteen_Menu(id, item_name, category, price, availability, ingredients, calories, vendor_name, preparation_time, last_updated);
create table Canteen_Menu (
    id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(5,2),
    availability BOOLEAN,
    ingredients TEXT,
    calories INT,
    vendor_name VARCHAR(100),
    preparation_time INT,  -- in minutes
    last_updated DATE
);

-- Insert records
insert into Canteen_Menu values
(1, 'Veg Sandwich', 'Snack', 40.00, true, 'Bread, Veggies, Butter', 250, 'Foodies Pvt Ltd', 10, '2024-07-01'),
(2, 'Masala Dosa', 'Meal', 55.00, true, 'Rice, Potato, Chutney', 400, 'South Delights', 15, '2024-07-01'),
(3, 'Tea', 'Beverage', 15.00, true, 'Milk, Tea Powder', 80, 'TeaTime Ltd', 5, '2024-07-01'),
(4, 'Pizza', 'Meal', 120.00, false, 'Dough, Cheese, Sauce', 600, 'Pizza Point', 20, '2024-06-25'),
(5, 'Coffee', 'Beverage', 20.00, true, 'Milk, Coffee', 100, 'Bean Cafe', 5, '2024-07-01');

-- View menu
select * from Canteen_Menu;

-- Truncate
truncate table Canteen_Menu;

-- Drop
drop table Canteen_Menu;


-- T7 – Library(id, book_title, author, category, isbn, publisher, edition, year_published, total_copies, available_copies);
create table Library (
    id INT PRIMARY KEY,
    book_title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(50),
    isbn VARCHAR(20) UNIQUE,
    publisher VARCHAR(100),
    edition VARCHAR(20),
    year_published YEAR,
    total_copies INT CHECK(total_copies >= 0),
    available_copies INT CHECK(available_copies >= 0)
);

-- Insert records
insert into Library values
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', '9780061122415', 'HarperOne', '1st', 2006, 10, 7),
(2, 'Data Structures', 'Mark Allen Weiss', 'Education', '9780133001361', 'Pearson', '3rd', 2012, 6, 3),
(3, 'Clean Code', 'Robert C. Martin', 'Programming', '9780132350884', 'Prentice Hall', '1st', 2008, 5, 5),
(4, 'Operating System Concepts', 'Silberschatz', 'Education', '9781119456339', 'Wiley', '10th', 2018, 8, 4),
(5, 'Wings of Fire', 'A. P. J. Abdul Kalam', 'Biography', '9788173711466', 'Universities Press', '2nd', 2004, 12, 9);

-- View library records
select * from Library;

-- Remove all library data
truncate table Library;

-- Drop library table
drop table Library;


-- T8 – Attendance(id, student_id, subject, date, status, remarks, faculty_id, class_type, period, recorded_time);
create table Attendance (
    id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject VARCHAR(100),
    date DATE NOT NULL,
    status VARCHAR(10) CHECK(status IN ('Present', 'Absent', 'Late')),
    remarks TEXT,
    faculty_id INT,
    class_type VARCHAR(20),         -- lecture/lab/tutorial
    period INT CHECK(period BETWEEN 1 AND 8),
    recorded_time TIME
);

-- Insert records
insert into Attendance values
(1, 1, 'Physics', '2024-07-20', 'Present', '', 1, 'Lecture', 1, '09:05'),
(2, 2, 'Mathematics', '2024-07-20', 'Absent', 'Medical leave', 2, 'Lecture', 2, '10:10'),
(3, 3, 'Chemistry', '2024-07-20', 'Present', '', 3, 'Lab', 3, '11:15'),
(4, 4, 'Biology', '2024-07-20', 'Late', 'Arrived late by 5 min', 4, 'Lecture', 4, '13:05'),
(5, 5, 'Computer Science', '2024-07-20', 'Present', '', 5, 'Tutorial', 5, '14:10');

-- View attendance
select * from Attendance;

-- Truncate attendance
truncate table Attendance;

-- Drop attendance
drop table Attendance;


-- T9 – Placement_Record(id, student_id, company_name, role_offered, package, placement_date, interview_rounds, location, hr_contact, status);
create table Placement_Record (
    id INT PRIMARY KEY,
    student_id INT NOT NULL,
    company_name VARCHAR(100),
    role_offered VARCHAR(100),
    package DECIMAL(8,2),
    placement_date DATE,
    interview_rounds INT CHECK(interview_rounds > 0),
    location VARCHAR(100),
    hr_contact VARCHAR(15),
    status VARCHAR(20) CHECK(status IN ('Selected', 'Rejected', 'Pending'))
);

-- Insert records
insert into Placement_Record values
(1, 1, 'TCS', 'Software Engineer', 450000.00, '2024-06-10', 3, 'Mumbai', '9000112233', 'Selected'),
(2, 2, 'Infosys', 'Analyst', 400000.00, '2024-06-12', 2, 'Pune', '9000112244', 'Selected'),
(3, 3, 'Wipro', 'Intern', 300000.00, '2024-06-14', 2, 'Hyderabad', '9000112255', 'Rejected'),
(4, 4, 'Google', 'SDE', 1200000.00, '2024-06-16', 5, 'Bangalore', '9000112266', 'Pending'),
(5, 5, 'Amazon', 'Support Engineer', 800000.00, '2024-06-18', 4, 'Chennai', '9000112277', 'Selected');

-- View placement data
select * from Placement_Record;

-- Truncate placements
truncate table Placement_Record;

-- Drop placement table
drop table Placement_Record;


-- T10 – Events(id, name, type, date, venue, organizer, department_id, description, target_audience, registration_required);
create table Events (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),                      -- seminar/fest/workshop etc.
    date DATE,
    venue VARCHAR(100),
    organizer VARCHAR(100),
    department_id INT,
    description TEXT,
    target_audience VARCHAR(100),
    registration_required BOOLEAN
);

-- Insert records
insert into Events values
(1, 'TechFest 2024', 'Fest', '2024-08-15', 'Main Auditorium', 'CS Department', 105, 'Annual tech fest with coding & gaming events.', 'All Students', true),
(2, 'Science Fair', 'Exhibition', '2024-08-20', 'Science Block', 'Science Club', 101, 'Exhibition of student science projects.', 'School Visitors', false),
(3, 'Startup Talk', 'Seminar', '2024-08-25', 'Seminar Hall B', 'Entrepreneur Cell', 102, 'Guest talk by startup founders.', 'Students & Alumni', true),
(4, 'Math Olympiad', 'Competition', '2024-09-01', 'Math Dept Hall', 'Mathematics Dept', 102, 'Math problem-solving competition.', 'All Students', false),
(5, 'Blood Donation Camp', 'Social', '2024-09-05', 'College Lawn', 'NSS Unit', 104, 'Camp organized with Red Cross.', 'Open to All', false);

-- View events
select * from Events;

-- Truncate events
truncate table Events;

-- Drop event table
drop table Events;