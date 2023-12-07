SELECT
    cashier_shifts.id,
    cashier_shifts.checkout_id,
    cashier_shifts.employee_id,
        cashier_shifts.store_id as shift_store_id,
    checkouts.store_id as checkout_store_id,
 cashier_shifts.start_timestamp,
 cashier_shifts.end_timestamp
FROM nexus_stores.cashier_shifts JOIN nexus_stores.checkouts
ON cashier_shifts.checkout_id = checkouts.id;

