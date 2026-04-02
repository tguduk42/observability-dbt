

select
    name,
    JSONExtractString(attrs, 'reason') as reason,
    JSONExtractString(attrs, 'code') as code,
    count() as cnt
from `default`.`stg_obs_events`
where name like 'exchange_%_fail'
group by name, reason, code