CREATE TABLE rr_times.translated_headlines
(
id serial PRIMARY KEY,
title text NOT NULL,
subtitle text
);


CREATE TABLE rr_times.issues
(
    id serial PRIMARY KEY,
issued_at date DEFAULT now()::date,
language varchar(2),
country varchar(2),
translated_headline_id integer 
    REFERENCES rr_times.translated_headlines (id) ON DELETE RESTRICT,

FOREIGN KEY
(
    language, country
) REFERENCES rr_times.locales (language_code, country_code) ON DELETE SET NULL
);
