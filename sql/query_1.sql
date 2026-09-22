SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name,
    j.job_title
FROM hr.employees e
LEFT JOIN hr.departments d
    ON e.department_id = d.department_id
LEFT JOIN hr.jobs j
    ON e.job_id = j.job_id
WHERE e.salary IS NOT NULL;