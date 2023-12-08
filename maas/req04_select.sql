REFRESH MATERIALIZED VIEW memorin.outdated_devices;
SELECT * FROM  memorin.outdated_devices
ORDER BY
    released_at,
    serial_number;
