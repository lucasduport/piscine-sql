SELECT 
     people.id AS person_id,
     people.first_name,
     people.last_name,
     people.birth_date,
     cases.classification,
     cases.description
INTO TEMPORARY not_guilty
FROM justice.trials, justice.cases, public.people, justice.outcomes, justice.defendants
WHERE justice.trials.case_id =  justice.cases.id
AND justice.outcomes.trial_id = justice.trials.id
AND justice.defendants.trial_id = justice.trials.id
AND justice.defendants.person_id = public.people.id
AND justice.outcomes.outcome = 'NOT_GUILTY'
ORDER BY 
    classification,
    case_id;

