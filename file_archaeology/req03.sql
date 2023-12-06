SELECT filename, size
FROM  dtf.madelines_files
WHERE size >
(
    SELECT DISTINCT
    avg(size)
    FROM dtf.madelines_files
)  * 0.75
ORDER BY
    size DESC;
