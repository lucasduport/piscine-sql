DELETE FROM  public.epix_posts AS ep
USING public.epix_hashtags AS eh,  public.epix_accounts AS ea, public.people AS ppl
WHERE ep.hashtag_id = eh.id
AND ep.author_id = ea.id
AND ea.person_id = ppl.id
AND eh.name LIKE 'EndSurveillance'
RETURNING ppl.first_name, ppl.last_name, ea.username, ep.body as post_content;
