CREATE SCHEMA rr_times;

CREATE TABLE rr_times.locales
(
language_code varchar(2) NOT NULL
    CHECK (language_code SIMILAR TO '[a-z]{2}'),
country_code varchar(2) NOT NULL
    CHECK (country_code SIMILAR TO '[A-Z]{2}'),
name varchar(50) UNIQUE NOT NULL
    CHECK (name SIMILAR TO '[a-zA-Z ]+\([a-zA-Z ]+\)'),

PRIMARY KEY (language_code, country_code)
);

CREATE TABLE rr_times.translated_articles
(
id serial PRIMARY KEY,
title text NOT NULL,
body text NOT NULL
);
