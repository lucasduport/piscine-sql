SELECT 
     people.id AS person_id,
     people.first_name,
     people.last_name,
     people.birth_date,
     outcomes.created_at AS conviction_date,
     outcomes.serving_time,
     ((outcomes.created_at + interval '1 month' * outcomes.serving_time)
        > '2059-12-03')
    AS could_be_released
INTO  public.outcome_status
FROM justice.trials, justice.cases, public.people, justice.outcomes, justice.defendants
WHERE justice.trials.case_id =  justice.cases.id
AND justice.outcomes.trial_id = justice.trials.id
AND justice.defendants.trial_id = justice.trials.id
AND justice.defendants.person_id = public.people.id
AND justice.outcomes.outcome = 'GUILTY'
AND justice.cases.classification = 'CRIME'
ORDER BY 
    classification,
    case_id;
