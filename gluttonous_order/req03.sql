INSERT INTO public.scrooge_eats_basket_items (order_id,item_id, quantity)
VALUES (
    10000,
    (
SELECT id
FROM public.scrooge_eats_items
WHERE name ILIKE 'Kinder Bueno White'
    ),
    1)
