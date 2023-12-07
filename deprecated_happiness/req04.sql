ALTER TABLE public.patients_records ADD person_id integer;
ALTER TABLE public.patients_records ADD FOREIGN KEY (person_id)
REFERENCES public.people(id);

INSERT INTO public.patients_records
SELECT DISTINCT pi.person_id
FROM medical_confidential.patients_ids AS pi
JOIN  public.patients_records AS pr
ON pr.id = pi.patient_id;
