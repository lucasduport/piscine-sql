CREATE MATERIALIZED VIEW memorin.outdated_devices AS
SELECT
    d.serial_number,
    d.version_id,
    dv.released_at,
    dv.eol_timestamp,
    (SELECT count(DISTINCT id) FILTER (WHERE v.released_at > dv.released_at) 
        FROM memorin.device_versions as v)
    as versions_behind
FROM memorin.devices as d
JOIN memorin.device_versions as dv
ON d.version_id = dv.id
WHERE eol_timestamp IS NOT NULL
AND d.deactivated_at IS NULL;
