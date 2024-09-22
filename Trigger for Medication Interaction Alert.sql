 Trigger for Medication Interaction Alert
CREATE OR REPLACE TRIGGER tr_check_med_interaction
BEFORE INSERT ON Prescribed_Med
FOR EACH ROW
DECLARE
    v_conflict VARCHAR2(255);
BEGIN
    -- Placeholder logic: Assume medication interaction check happens here
    v_conflict := NULL; -- Replace this with actual logic if needed

    IF v_conflict IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Medication interaction detected: ' || v_conflict);
    END IF;
END;
/

-- Trigger to log employee salary changes into Payroll
CREATE OR REPLACE TRIGGER tr_employee_salary
AFTER UPDATE OF salary ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Payroll (employee_id, salary, bonuses, deductions)
    VALUES (:NEW.employee_id, :NEW.salary, 0, 0);
END;
/