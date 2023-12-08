SELECT 
    gz.name as zone_name,
    count(DISTINCT sh.data_center_id)
    AS data_center_count,
    count(sh.zone_id)
    AS total_servers,
    sum(sh.core_count)
    AS total_cores,
    sum(sh.ram) 
    AS total_ram,
    sum(sh.storage)
    AS total_storage
FROM memorin.server_hierarchy sh
JOIN memorin.geographic_zones gz
ON sh.zone_id = gz.id
GROUP BY
    zone_name
ORDER BY
    data_center_count DESC,
total_servers DESC,
zone_name;
