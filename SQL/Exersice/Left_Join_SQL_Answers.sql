--------------------------------------------------
-- LEFT JOIN QUERIES
--------------------------------------------------

--------------------------------------------------
-- 2A. LEFT JOIN: patients + appointments
-- Show all patients, including those without appointments
--------------------------------------------------
SELECT 
    p.patientID,
    p.name AS patientName,
    a.appointmentID,
    a.appointmentDate,
    a.department,
    a.status
FROM patients p
LEFT JOIN appointments a
    ON p.patientID = a.patientsID;

--------------------------------------------------
-- 2B. LEFT JOIN: medicalStaff + appointments
-- Show all staff members, including those without appointments
--------------------------------------------------
SELECT 
    m.staffID,
    m.name AS staffName,
    m.role,
    a.appointmentID,
    a.appointmentDate,
    a.department,
    a.status
FROM medicalStaff m
LEFT JOIN appointments a
    ON m.staffID = a.staffID;

--------------------------------------------------
-- 2C. LEFT JOIN: patients + appointments + medicalStaff
-- Show all patients, with appointment and staff info if available
--------------------------------------------------
SELECT 
    p.name AS patientName,
    a.appointmentDate,
    a.department,
    a.status,
    m.name AS staffName,
    m.role
FROM patients p
LEFT JOIN appointments a
    ON p.patientID = a.patientsID
LEFT JOIN medicalStaff m
    ON a.staffID = m.staffID;