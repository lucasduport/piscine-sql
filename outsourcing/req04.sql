SELECT 
     people.id AS person_id,
     people.first_name,
     people.last_name,
     outcomes.created_at,
     outcomes.serving_time,
      outcomes.created_at + interval '1 month' * outcomes.serving_time
        - interval '1 month' * COALESCE((
                SELECT amount
                FROM justice.sentence_reductions
                WHERE justice.sentence_reductions.outcome_id = justice.outcomes.id
            ), 0)
    AS release_date
INTO public.release_dates
FROM justice.trials, justice.cases, public.people, justice.outcomes, justice.defendants
WHERE justice.trials.case_id =  justice.cases.id
AND justice.outcomes.trial_id = justice.trials.id
AND justice.defendants.trial_id = justice.trials.id
AND justice.defendants.person_id = public.people.id
AND justice.outcomes.outcome = 'GUILTY'
ORDER BY 
    release_date DESC,
    serving_time DESC;
