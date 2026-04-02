

select
    toStartOfMinute(ts) as bucket,
    uniqExact(char_id) as online_chars
from `default`.`stg_obs_spans`
where char_id > 0
group by bucket