INSERT INTO nexus_stores.cashier_shifts
VALUES
    (10004854,
    '68cdd3ec',
    NULL,
    78,
    '2059-12-01 13:00:00',
    '2059-12-01 15:00:00');

INSERT INTO nexus_stores.sales
VALUES
    (10448944,
    (
        SELECT id FROM nexus_stores.products WHERE name LIKE 'Golden Apple' LIMIT 1
    ),
    '68cdd3ec',
    78,
    '2059-12-01 14:47:07');
