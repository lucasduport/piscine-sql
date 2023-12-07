(SELECT
    'metro' AS place_type,
    count(DISTINCT ms.person_id) AS entries,
    ms.station_id as place_id
FROM transport.metro_usage_logs as ms
GROUP BY
place_id
)
UNION
(SELECT
    'shop' AS place_type,
    count(DISTINCT ms.person_id) AS entries,
    ms.shop_id as place_id
FROM public.shop_entrance_logs as ms
GROUP BY
    place_id

)
ORDER BY
    entries DESC,
    place_id ASC,
    place_type DESC;

