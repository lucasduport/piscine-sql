SELECT
    id,
    size AS stored_size,
    decrypted,
        CASE
        WHEN size IS NULL THEN CAST((SELECT avg(size) FILTER (WHERE size IS NOT NULL AND mf.decrypted = mfs.decrypted) 
                                    FROM dtf.madelines_files_results as mf) AS bigint)
        ELSE size
        END AS calculated_size
FROM dtf.madelines_files_results as mfs
WHERE parent_id IS NOT NULL;
