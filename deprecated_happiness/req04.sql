ALTER TABLE migration.patients_records ADD COLUMN person_id integer;
ALTER TABLE migration.patients_records
ADD FOREIGN KEY (person_id) REFERENCES public.people(id);

UPDATE migration.patients_records AS par
SET person_id = pi.person_id
FROM medical_confidential.patients_ids AS pi
WHERE par.id = pi.patient_id;
