-- AI-powered Function to Calculate Risk Score and Trends
CREATE OR REPLACE FUNCTION calculate_risk_and_trends(
    p_age IN NUMBER,
    p_has_diabetes IN VARCHAR2,
    p_has_heart_disease IN VARCHAR2,
    p_appointments_per_year IN NUMBER
) RETURN NUMBER AS
    v_risk_score NUMBER := 0;
BEGIN
    IF p_age > 50 THEN
        v_risk_score := v_risk_score + 10;
    END IF;
    
    IF p_has_diabetes = 'YES' THEN
        v_risk_score := v_risk_score + 20;
    END IF;
    
    IF p_has_heart_disease = 'YES' THEN
        v_risk_score := v_risk_score + 30;
    END IF;

    -- Add risk if the patient has frequent appointments
    IF p_appointments_per_year > 5 THEN
        v_risk_score := v_risk_score + 15;
    END IF;

    RETURN v_risk_score;
END;
/