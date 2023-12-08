ALTER TABLE migration.medical_record_entries ALTER COLUMN description TYPE varchar(100)
USING (CASE
    WHEN length(description) > 100 THEN
            concat(description::varchar(97), '...')
        ELSE
            description
        END);
