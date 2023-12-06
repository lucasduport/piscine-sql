CREATE TABLE dtf.shifts_and_sales_78
(
    sales_id text,
    product_id integer,
    checkout_id text,
    sale_timestamp timestamp,
    shift_id text,
    employee_id text,
    shift_start_timestamp timestamp,
    shift_end_timestamp timestamp
);

INSERT INTO dtf.shifts_and_sales_78
SELECT
    sales.id,
    sales.product_id,
    cashier_shifts.checkout_id,
    sales.sale_timestamp,
    cashier_shifts.id,
    cashier_shifts.employee_id,
    cashier_shifts.start_timestamp,
    cashier_shifts.end_timestamp
FROM nexus_stores.sales JOIN nexus_stores.cashier_shifts 
ON sales.checkout_id = cashier_shifts.checkout_id
WHERE end_timestamp = '2059-12-01 19:00:00'
AND sales.store_id = 78;
