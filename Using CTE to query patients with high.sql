-- Using CTE to query patients with high risk scores
WITH high_risk_patients AS (
    SELECT p.first_name, p.last_name, calculate_risk_and_trends(p.age, p.has_diabetes, p.has_heart_disease, COUNT(a.appointment_id)) AS risk_score
    FROM Patient p
    JOIN Appointment a ON p.patient_id = a.patient_id
    GROUP BY p.first_name, p.last_name, p.age, p.has_diabetes, p.has_heart_disease
)
SELECT * FROM high_risk_patients WHERE risk_score > 50;