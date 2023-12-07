UPDATE  public.epix_posts
SET   downvotes = upvotes * ( 
    (SELECT 
        (sum(ep.downvotes::numeric/ep.upvotes::numeric) / 3)
        FROM  public.epix_posts as ep
        WHERE author_id = 933 AND id <> 139))
WHERE id = 139;
