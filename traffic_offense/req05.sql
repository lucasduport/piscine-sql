SELECT *
FROM public.traffic_violations
WHERE id = 2058 OR id = 239;
SELECT *
FROM public.traffic_violations
WHERE license_plate = (
    SELECT license_plate
    FROM public.traffic_violations
    WHERE license_plate LIKE 'AZ__36_'
    AND violation_date BETWEEN timestamp '2059-12-03 21:00' - interval '1 hour'
    AND timestamp '2059-12-03 21:00' + interval '1 hour'
    AND (
        description = 'SPEED_AND_TRAFFIC_VIOLATION'
        OR description = 'RECKLESS_AND_DANGEROUS_DRIVING')
    )
AND violation_date BETWEEN timestamp '2059-12-03 00:00'
AND timestamp '2059-12-03 00:00' + interval '1 day'

