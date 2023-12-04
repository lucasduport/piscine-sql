SELECT id, reservation_name, reservation_date
FROM public.gusto_reservations
WHERE reservation_date::date = '2059-12-03'
AND reservation_date::time BETWEEN '18:00' AND '21:00'
AND cancelled = FALSE;
