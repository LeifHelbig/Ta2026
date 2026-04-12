--------------------------------------------------
-- INNER JOIN QUERIES
--------------------------------------------------

--------------------------------------------------
-- 1A. INNER JOIN: patients + appointments
-- Show only patients who have at least one appointment
--------------------------------------------------
SELECT 
    p.patientID,
    p.name AS patientName,
    a.appointmentID,
    a.appointmentDate,
    a.department,
    a.status
FROM patients p
INNER JOIN appointments a
    ON p.patientID = a.patientsID;

--------------------------------------------------
-- 1B. INNER JOIN: appointments + medicalStaff
-- Show only appointments that have a matching staff member
--------------------------------------------------
SELECT 
    a.appointmentID,
    a.appointmentDate,
    a.department,
    a.status,
    m.staffID,
    m.name AS staffName,
    m.role
FROM appointments a
INNER JOIN medicalStaff m
    ON a.staffID = m.staffID;

--------------------------------------------------
-- 1C. INNER JOIN: patients + appointments + medicalStaff
-- Show only fully matched rows across all three tables
--------------------------------------------------
SELECT 
    p.name AS patientName,
    a.appointmentDate,
    a.department,
    a.status,
    m.name AS staffName,
    m.role
FROM appointments a
INNER JOIN patients p
    ON a.patientsID = p.patientID
INNER JOIN medicalStaff m
    ON a.staffID = m.staffID;