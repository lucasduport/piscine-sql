ALTER TABLE migration.companies ADD growth numeric(6,2);
ALTER TABLE migration.companies ADD CHECK (growth <= 1000 AND growth > 0 AND NOT NULL);
ALTER TABLE migration.companies ALTER COLUMN growth SET DEFAULT 0;
