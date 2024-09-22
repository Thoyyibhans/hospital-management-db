CREATE OR REPLACE FUNCTION calculate_risk(patient_id NUMBER) RETURN VARCHAR2 IS
    risk_level VARCHAR2(20);
    heart_rate NUMBER;
    blood_pressure VARCHAR2(20);
BEGIN
    SELECT heart_rate, blood_pressure INTO heart_rate, blood_pressure 
    FROM IoT_Monitoring 
    WHERE patient_id = patient_id AND ROWNUM = 1 ORDER BY timestamp DESC;

    IF heart_rate > 100 OR blood_pressure = 'high' THEN
        risk_level := 'High Risk';
    ELSE
        risk_level := 'Low Risk';
    END IF;

    RETURN risk_level;
END;
/
