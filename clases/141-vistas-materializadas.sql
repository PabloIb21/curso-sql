create materialized view comments_per_week_mat as
select
    date_trunc('week', posts.created_at) as weeks,
    sum(claps.counter) as total_claps,
    count(distinct posts.post_id) as number_of_posts,
    count(*) as number_of_claps
from
    posts
    inner join claps on claps.post_id = posts.post_id
group by
    weeks
order by
    weeks desc;
    
select * from comments_per_week;

select * from comments_per_week_mat;

refresh materialized view comments_per_week_mat;

select * from posts where post_id = 1;