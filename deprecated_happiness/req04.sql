ALTER TABLE migration.patients_records ADD COLUMN person_id integer;
ALTER TABLE migration.patients_records
ADD FOREIGN KEY (person_id) REFERENCES public.people(id);

INSERT INTO migration.patients_records
SELECT DISTINCT pi.person_id
FROM migration.patients_ids AS pi
JOIN migration.patients_records AS pr
ON pr.id = pi.patient_id;
