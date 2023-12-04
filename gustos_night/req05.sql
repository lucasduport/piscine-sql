SELECT 
     public.gusto_guests.id, 
     public.gusto_guests.reservation_id
FROM public.gusto_guests,  public.gusto_reservations
WHERE public.gusto_reservations.reservation_date::date = '2059-12-03'
AND public.gusto_reservations.reservation_date::time BETWEEN '18:00' AND '21:00'
AND public.gusto_reservations.cancelled = FALSE
AND public.gusto_guests.reservation_id = public.gusto_reservations.id;
