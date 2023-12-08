SELECT 
    gz.name as zone_name,
    (SELECT count(*) FILTER (WHERE g.data_center_id = g.id AND g.zone_id = gz.id)
    FROM  memorin.server_hierarchy g)
    AS data_center_count,
    (SELECT count(*) FILTER (WHERE g.zone_id = gz.id)
    FROM  memorin.server_hierarchy g)
    AS total_servers,
    (SELECT sum(g.core_count) FILTER (WHERE g.zone_id = gz.id)
    FROM  memorin.server_hierarchy g)
    AS total_cores,
    (SELECT sum(g.ram) FILTER (WHERE g.zone_id = gz.id)
    FROM  memorin.server_hierarchy g)
    AS total_ram,
    (SELECT sum(g.storage) FILTER (WHERE g.zone_id = gz.id)
    FROM  memorin.server_hierarchy g)
    AS total_storage
FROM memorin.server_hierarchy sh
JOIN memorin.geographic_zones gz
ON sh.zone_id = gz.id
GROUP BY
gz.id,
    zone_name
ORDER BY
    data_center_count DESC,
total_servers DESC,
zone_name;
