SELECT
    id,
    size AS stored_size,
    decrypted,
        CASE
        WHEN size IS NULL AND decrypted = true THEN CAST((SELECT avg(size) 
            FILTER (WHERE size IS NOT NULL and decrypted = true) 
                                    FROM dtf.madelines_files_results as mf) AS bigint)
        WHEN size IS NULL AND decrypted = false THEN CAST((SELECT avg(size) 
            FILTER (WHERE size IS NOT NULL and decrypted = false) 
                                    FROM dtf.madelines_files_results as mf) AS bigint)

        ELSE size
        END AS calculated_size
FROM dtf.madelines_files_results as mfs
WHERE parent_id IS NOT NULL;
