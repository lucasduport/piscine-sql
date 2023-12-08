ALTER TABLE migration.companies ADD COLUMN growth numeric(6,2) NOT NULL DEFAULT 0;
ALTER TABLE migration.companies ADD CONSTRAINT companies_growth_check
CHECK (growth <= 1000 AND growth >= 0.0);
