select * from comments_per_week;

alter view comments_per_week rename to posts_per_week;

alter materialized view comments_per_week_mat rename to posts_per_week_mat;