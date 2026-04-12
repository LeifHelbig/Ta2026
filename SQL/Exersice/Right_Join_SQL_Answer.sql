--------------------------------------------------
-- RIGHT JOIN QUERIES
--------------------------------------------------

--------------------------------------------------
-- 3A. RIGHT JOIN: patients + appointments
-- Show all appointments, including those without a matching patient
--------------------------------------------------
SELECT 
    a.appointmentID,
    a.appointmentDate,
    a.department,
    a.status,
    p.patientID,
    p.name AS patientName
FROM patients p
RIGHT JOIN appointments a
    ON p.patientID = a.patientsID;

--------------------------------------------------
-- 3B. RIGHT JOIN: appointments + medicalStaff
-- Show all appointments, including those without a matching staff member
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
RIGHT JOIN appointments a
    ON m.staffID = a.staffID;

--------------------------------------------------
-- 3C. RIGHT JOIN: patients + appointments + medicalStaff
-- Show all appointments, even if patient or staff data is missing
--------------------------------------------------
SELECT 
    a.appointmentID,
    a.appointmentDate,
    a.department,
    a.status,
    p.name AS patientName,
    m.name AS staffName,
    m.role
FROM patients p
RIGHT JOIN appointments a
    ON p.patientID = a.patientsID
LEFT JOIN medicalStaff m
    ON a.staffID = m.staffID;