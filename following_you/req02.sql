(SELECT 
    sl.id,
    sl.street_id,
    sl.created_at,
    person_id
FROM backup.street_logs as sl
)
EXCEPT
(SELECT 
    sl.id,
    sl.street_id,
    sl.created_at,
    person_id
FROM public.street_logs as sl
)

