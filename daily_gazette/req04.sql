CREATE TABLE rr_times.articles
(
id serial PRIMARY KEY,
translated_article_id int REFERENCES rr_times.translated_headlines (id) ON DELETE CASCADE,
rubric_id int REFERENCES rr_times.rubrics (id) ON DELETE CASCADE,
language varchar(2),
country varchar(2),
FOREIGN KEY
(
    language, country
) REFERENCES rr_times.locales (language_code, country_code) ON DELETE CASCADE
);

