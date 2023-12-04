SELECT person_id,  justice.cases.id, content, justice.cases.description
FROM justice.testimonies, justice.cases
WHERE justice.testimonies.case_id = justice.cases.id
AND content SIMILAR TO '%Nexus N3%'
AND description SIMILAR TO '%(speeding|speed|fast|reckless)%';
