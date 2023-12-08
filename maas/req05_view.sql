CREATE RECURSIVE VIEW memorin.server_hierarchy (id, zone_id, core_count, ram, storage, data_center_id)
AS SELECT 
    s.id,
    s.zone_id,
    s.core_count,
    s.ram,
    s.storage,
    s.id AS data_center_id
FROM memorin.servers as s
WHERE s.master_id IS NULL
UNION ALL
SELECT
    s.id,
    s.zone_id,
    s.core_count,
    s.ram,
    s.storage,
    server_tree.id AS data_center_id
FROM memorin.servers as s
INNER JOIN server_hierarchy server_tree
ON s.master_id = server_tree.id;
