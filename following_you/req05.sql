(SELECT
    mul.person_id,
    ppl.first_name as person_first_name,
    ppl.last_name as person_last_name,
    mul.created_at,
    'street' AS place,
    mul.street_id AS place_id
FROM public.street_logs AS mul
JOIN public.people 
AS ppl ON mul.person_id = ppl.id
WHERE mul.created_at BETWEEN '2059-12-03 17:00' AND '2059-12-03 22:00'
)
UNION
(SELECT
    se.person_id,
        ppl.first_name as person_first_name,
    ppl.last_name as person_last_name,
    se.created_at,
    'shop' AS place,
    se.shop_id AS place_id
FROM public.shop_entrance_logs AS se
JOIN public.people 
AS ppl ON se.person_id = ppl.id
WHERE se.created_at BETWEEN '2059-12-03 17:00' AND '2059-12-03 22:00'
)
UNION
(SELECT
    mul.person_id,
        ppl.first_name as person_first_name,
    ppl.last_name as person_last_name,
    mul.created_at,
    'metro' AS place,
    mul.station_id AS place_id
FROM transport.metro_usage_logs AS mul
JOIN public.people 
AS ppl ON mul.person_id = ppl.id
WHERE mul.created_at BETWEEN '2059-12-03 17:00' AND '2059-12-03 22:00')
ORDER BY
    created_at ASC,
    person_id ASC;
