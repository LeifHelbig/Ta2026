--------------------------------------------------
-- FULL OUTER JOIN QUERIES
--------------------------------------------------

--------------------------------------------------
-- 4A. FULL OUTER JOIN: patients + appointments
-- Show all patients and all appointments, matched or unmatched
--------------------------------------------------
SELECT 
    p.patientID,
    p.name AS patientName,
    a.appointmentID,
    a.appointmentDate,
    a.department,
    a.status
FROM patients p
FULL OUTER JOIN appointments a
    ON p.patientID = a.patientsID;

--------------------------------------------------
-- 4B. FULL OUTER JOIN: appointments + medicalStaff
-- Show all appointments and all staff, matched or unmatched
--------------------------------------------------
SELECT 
    a.appointmentID,
    a.appointmentDate,
    a.department,
    a.status,
    m.staffID,
    m.name AS staffName,
    m.role
FROM medicalStaff m
FULL OUTER JOIN appointments a
    ON m.staffID = a.staffID;

--------------------------------------------------
-- 4C. FULL OUTER JOIN: patients + appointments + medicalStaff
-- Show all patients, appointments, and staff, even when relationships are missing
--------------------------------------------------
SELECT 
    p.name AS patientName,
    a.appointmentDate,
    a.department,
    a.status,
    m.name AS staffName,
    m.role
FROM patients p
FULL OUTER JOIN appointments a
    ON p.patientID = a.patientsID
FULL OUTER JOIN medicalStaff m
    ON a.staffID = m.staffID;