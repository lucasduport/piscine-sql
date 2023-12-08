CREATE VIEW memorin.devices_summary AS
SELECT 
count(*) as total_devices,
count(*) FILTER(WHERE deactivated_at IS NULL) as active_devices,
count(*) FILTER(WHERE deactivated_at IS NOT NULL) as inactive_devices
FROM memorin.devices;

