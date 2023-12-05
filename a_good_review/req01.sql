INSERT INTO public.scrooge_eats_reviews (account_id, order_id, rating, review)
VALUES (
    (
SELECT public.scrooge_eats_accounts.id
FROM public.companies, public.scrooge_eats_accounts
WHERE public.scrooge_eats_accounts.company_id = public.companies.id
AND name ILIKE 'dtf'
    ),
    10001,
    5,
    'I really enjoyed it!'
    );
