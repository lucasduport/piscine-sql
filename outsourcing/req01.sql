SELECT 
    justice.trials.id AS trial_id,
    justice.trials.case_id,
    classification,
    description
INTO definitive_trials
FROM justice.trials, justice.cases
WHERE justice.trials.case_id =  justice.cases.id
AND justice.trials.status = 'FINISHED'
ORDER BY 
    classification,
    case_id;
