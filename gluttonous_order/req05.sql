INSERT INTO public.scrooge_eats_orders
VALUES (
    10001,
    (
SELECT public.scrooge_eats_accounts.id
FROM public.companies, public.scrooge_eats_accounts
WHERE public.scrooge_eats_accounts.company_id = public.companies.id
AND name ILIKE 'dtf'
    ),
    now(),
    20);
INSERT INTO public.scrooge_eats_basket_items (order_id,item_id, quantity)
VALUES 
(
    10001,
    (
    SELECT id
    FROM public.scrooge_eats_items
    WHERE name ILIKE 'Tacos'
    ),
    1
),
(
    10001,
    (
    SELECT id
    FROM public.scrooge_eats_items
    WHERE name ILIKE 'Coca-cola'
    ),
    4
),
(
    10001,
    (
    SELECT id
    FROM public.scrooge_eats_items
    WHERE name ILIKE 'Kinder Bueno White'
    ),
    1
)
