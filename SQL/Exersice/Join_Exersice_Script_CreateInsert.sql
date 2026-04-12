PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS medicalStaff;
DROP TABLE IF EXISTS patients;

--------------------------------------------------
-- CREATE TABLE: patients
--------------------------------------------------
CREATE TABLE patients (
    patientID INTEGER PRIMARY KEY,
    cpr TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL
);

--------------------------------------------------
-- CREATE TABLE: medicalStaff
--------------------------------------------------
CREATE TABLE medicalStaff (
    staffID INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    department TEXT NOT NULL
);

--------------------------------------------------
-- CREATE TABLE: appointments
-- No foreign key constraints here on purpose,
-- so students can see unmatched rows in joins
--------------------------------------------------
CREATE TABLE appointments (
    appointmentID INTEGER PRIMARY KEY,
    patientsID INTEGER,
    staffID INTEGER,
    appointmentDate TEXT,
    doctorName TEXT,
    department TEXT,
    status TEXT
);

--------------------------------------------------
-- INSERT PATIENTS
--------------------------------------------------
INSERT INTO patients (patientID, cpr, name) VALUES
(1, '123456-7890', 'Leif'),
(2, '223456-7890', 'Anna'),
(3, '323456-7890', 'Jonas'),
(4, '423456-7890', 'Mette'),
(5, '523456-7890', 'Ali'),
(6, '623456-7890', 'Sara'),
(7, '723456-7890', 'Omar'),
(8, '823456-7890', 'Nina');

--------------------------------------------------
-- INSERT MEDICAL STAFF
--------------------------------------------------
INSERT INTO medicalStaff (staffID, name, role, department) VALUES
(1, 'Dr. Hansen', 'Cardiologist', 'Cardiology'),
(2, 'Dr. Nielsen', 'Oncologist', 'Oncology'),
(3, 'Dr. Larsen', 'Neurologist', 'Neurology'),
(4, 'Dr. Jensen', 'Orthopedic Surgeon', 'Orthopedics'),
(5, 'Dr. Ahmed', 'Dermatologist', 'Dermatology'),
(6, 'Nurse Maria', 'Nurse', 'Emergency'),
(7, 'Dr. Holm', 'General Practitioner', 'General Medicine'),
(8, 'Nurse Peter', 'Nurse', 'Cardiology'),
(9, 'Dr. Sørensen', 'Radiologist', 'Radiology'),
(10, 'Dr. Nguyen', 'Surgeon', 'Surgery');

--------------------------------------------------
-- INSERT APPOINTMENTS
--------------------------------------------------
INSERT INTO appointments (appointmentID, patientsID, staffID, appointmentDate, doctorName, department, status) VALUES
(1, 1, 1, '2024-01-10', 'Dr. Hansen', 'Cardiology', 'Completed'),
(2, 1, 2, '2024-02-15', 'Dr. Nielsen', 'Oncology', 'Scheduled'),
(3, 1, 1, '2024-03-20', 'Dr. Hansen', 'Cardiology', 'Completed'),
(4, 2, 3, '2024-03-05', 'Dr. Larsen', 'Neurology', 'Cancelled'),
(5, 3, 4, '2024-04-12', 'Dr. Jensen', 'Orthopedics', 'Completed'),
(6, 3, 4, '2024-05-01', 'Dr. Jensen', 'Orthopedics', 'Scheduled'),
(7, 6, 5, '2024-06-10', 'Dr. Ahmed', 'Dermatology', 'Completed'),

-- appointment without matching patient
(8, 999, 2, '2024-07-01', 'Dr. Nielsen', 'Oncology', 'Scheduled'),

-- appointment without matching staff
(9, 2, 999, '2024-07-15', 'Dr. Ghost', 'Neurology', 'Cancelled');