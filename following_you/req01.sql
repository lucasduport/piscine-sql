SELECT
    ppl.first_name,
    ppl.last_name
FROM public.people as ppl JOIN  transport.metro_usage_logs ON metro_usage_logs.person_id = ppl.id
WHERE EXISTS (SELECT person_id FROM transport.metro_usage_logs WHERE station_id = 
    (SELECT id FROM  transport.metro_stations WHERE name like 'Morgane Abeille') AND person_id = ppl.id);
