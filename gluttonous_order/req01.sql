SELECT public.scrooge_eats_accounts.id
FROM public.companies, public.scrooge_eats_accounts
WHERE public.scrooge_eats_accounts.company_id = public.companies.id
AND name ILIKE 'dtf';
