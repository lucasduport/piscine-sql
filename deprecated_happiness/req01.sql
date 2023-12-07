DROP TABLE IF EXISTS migration.companies;
DROP TABLE IF EXISTS migration.jobs;
DROP TABLE IF EXISTS migration.patients_records;
DROP TABLE IF EXISTS migration.medical_record_entries;

CREATE SCHEMA IF NOT EXISTS migration;

CREATE TABLE migration.companies (LIKE public.companies INCLUDING ALL);
CREATE TABLE migration.jobs (like public.jobs including all);
CREATE TABLE migration.patients_records (like public.patients_records including all);
CREATE TABLE migration.medical_record_entries (like public.medical_record_entries including all);

INSERT INTO  migration.companies
    SELECT * FROM public.companies;

INSERT INTO  migration.jobs
    SELECT * FROM public.jobs;

INSERT INTO  migration.patients_records
    SELECT * FROM public.patients_records;

INSERT INTO  migration.medical_record_entries
    SELECT * FROM public.medical_record_entries;
