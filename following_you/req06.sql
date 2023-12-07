(SELECT
    mul.person_id,
    mul.validation,
    mul.created_at
FROM transport.metro_usage_logs as mul
WHERE mul.created_at BETWEEN '2059-12-03 20:00' AND '2059-12-03 22:00'
ORDER BY created_at ASC
LIMIT 10
)
UNION
(SELECT
    mul.person_id,
    mul.validation,
    mul.created_at
FROM transport.metro_usage_logs as mul
WHERE mul.created_at BETWEEN '2059-12-03 12:00' AND '2059-12-03 14:00'

)
ORDER BY
    created_at DESC;
