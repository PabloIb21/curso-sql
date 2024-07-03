select
    followers.*,
    leader.name as leader,
    follower.name as follower
from
    followers
    inner join "user" leader on leader.id = leader_id
    inner join "user" follower on follower.id = followers.follower_id;