SELECT
    mfs.id,
    mfs.size AS stored_size,
    mfs.decrypted,
        CASE
        WHEN mfs.size IS NULL AND mfs.decrypted = true THEN CAST((SELECT avg(size) 
            FILTER (WHERE parent_id IS NOT NULL and decrypted = true) 
                                    FROM dtf.madelines_files_results as mf) AS bigint)
        WHEN mfs.size IS NULL AND decrypted = false THEN CAST((SELECT avg(size) 
        FILTER (WHERE parent_id IS NOT NULL and decrypted = false) 
                                FROM dtf.madelines_files_results) AS bigint)

        ELSE mfs.size
        END AS calculated_size
FROM dtf.madelines_files_results as mfs
WHERE parent_id IS NOT NULL
ORDER BY id
