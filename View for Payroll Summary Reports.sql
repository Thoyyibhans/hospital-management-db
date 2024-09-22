-- View for Payroll Summary Reports
CREATE OR REPLACE VIEW Payroll_Summary AS
SELECT e.first_name || ' ' || e.last_name AS employee_name, p.salary, p.bonuses, p.deductions
FROM Employee e
JOIN Payroll p ON e.employee_id = p.employee_id;