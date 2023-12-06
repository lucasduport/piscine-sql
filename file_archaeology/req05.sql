SELECT
    owner,
    count(*) as num_files
FROM dtf.madelines_files
GROUP BY
    owner
HAVING count(*) <= ALL(SELECT count(*)
                        FROM  dtf.madelines_files
                        GROUP BY
                            owner)

ORDER BY
    owner ASC


