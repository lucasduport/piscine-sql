SELECT
    id,
    filename,
    CASE
        WHEN decrypted = true
            THEN 'File was successfully decrypted.'
        WHEN (SELECT mf.decrypted FROM dtf.madelines_files_results as mf
                            WHERE mf.id = mfs.parent_id) = true
            THEN 'File was successfully decrypted because its containing folder was successfully decrypted.'
        ELSE
            'File remains encrypted.'
    END AS     decryption_status
FROM dtf.madelines_files_results as mfs
ORDER BY ID;
