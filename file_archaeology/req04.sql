SELECT
    parent_id AS folder_id,
    count(*) 
FROM  dtf.madelines_files
WHERE permissions SIMILAR TO '%x%'
GROUP BY parent_id
HAVING count(*) > 3
ORDER BY
    parent_id NULLS FIRST;
