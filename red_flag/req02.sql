UPDATE  public.epix_posts
SET   downvotes = upvotes * ( 
    (SELECT avg(ep.downvotes/NULLIF(ep.upvotes,0)) FROM  public.epix_posts as ep)
/ (SELECT count(*) FILTER (WHERE ep.author_id = 933) FROM public.epix_posts as ep))
WHERE id = 139;
