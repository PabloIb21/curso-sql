create or replace view comments_per_week as
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

select
    *
from
    posts
where
    post_id = 1;
    
select * from comments_per_week;

drop view comments_per_week;