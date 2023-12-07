SELECT
    employees.id as employee_id,
    people.id as person_id,
    people.first_name,
    people.last_name
FROM nexus_stores.employees LEFT JOIN nexus_stores.cashier_shifts
ON cashier_shifts.employee_id = employees.id 
AND cashier_shifts.start_timestamp = '2059-12-01 13:00:00'
JOIN public.people ON employees.person_id = people.id
WHERE employees.store_id = 78 
AND cashier_shifts IS NULL
AND employees.position = 'CASHIER';
