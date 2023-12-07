UPDATE public.medical_record_entries
SET description = (CASE
                    WHEN length(description) > 97 THEN
                        concat(left(description,97), '...')
                    ELSE
                        description
                END);

ALTER TABLE  public.medical_record_entries ALTER COLUMN description TYPE varchar(100);

