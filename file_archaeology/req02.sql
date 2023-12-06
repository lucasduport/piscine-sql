SELECT filename, size
FROM  dtf.madelines_files
WHERE created_at 
        BETWEEN '2059-11-27 00:00:00' AND '2059-12-04 00:00:00'
AND size = 
(
    SELECT DISTINCT
    max(size)
    FROM dtf.madelines_files
    WHERE created_at 
    BETWEEN '2059-11-27 00:00:00' AND '2059-12-04 00:00:00'
)
ORDER BY
    filename ASC;
