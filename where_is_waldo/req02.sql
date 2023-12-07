(SELECT 
    (SELECT
        (SELECT count(*) FROM nexus_stores.cashier_shifts)
                -  count(employee_id)
            FROM nexus_stores.cashier_shifts JOIN nexus_stores.employees
            ON cashier_shifts.employee_id = employees.id
        )
        as null_employee_id_rows_count,
(SELECT 
    (SELECT count(*) FROM nexus_stores.cashier_shifts)
        -  count(store_id) as null_store_id_rows_count
FROM nexus_stores.cashier_shifts JOIN nexus_stores.stores
ON cashier_shifts.store_id = stores.id))


