CREATE TEMPORARY VIEW devices_metrics AS
SELECT
    dl.device_serial,
    dl.version_id,
    dl.id as log_id,
    dl.latitude as lat,
    dl.longitude as long,
    dl.temperature as temp,
    dl.battery_percentage as battery,
    dl.signal_strength
FROM memorin.devices AS d
JOIN  memorin.device_logs as dl ON dl.device_serial = d.serial_number
WHERE d.deactivated_at IS NULL
ORDER BY
    device_serial,
    version_id DESC,
    log_id;
