CREATE VIEW memorin.zoned_devices_logs AS
SELECT
    dl.device_serial,
    dl.version_id,
    dl.zone_id,
    dl.latitude as lat,
    dl.longitude as long,
    dl.temperature as temp,
    dl.battery_percentage as battery,
    dl.signal_strength
FROM memorin.device_logs as dl 
WHERE (SELECT da.deactivated_at
        FROM memorin.devices AS da
        WHERE da.serial_number = dl.device_serial) IS NULL
AND dl.temperature BETWEEN 34 AND 45
AND dl.signal_strength BETWEEN 0 AND 5
AND dl.battery_percentage BETWEEN 0 AND 100
AND dl.latitude BETWEEN 
(SELECT gz.min_latitude
FROM memorin.geographic_zones as gz
WHERE gz.id = dl.zone_id) 
AND
(SELECT gz.max_latitude
FROM memorin.geographic_zones as gz
WHERE gz.id = dl.zone_id)
AND dl.longitude
BETWEEN
(SELECT gz.min_longitude
FROM memorin.geographic_zones as gz
WHERE gz.id = dl.zone_id)
AND 
(SELECT gz.max_longitude
FROM memorin.geographic_zones as gz
WHERE gz.id = dl.zone_id)
ORDER BY
    device_serial,
    version_id DESC
WITH CHECK OPTION;


