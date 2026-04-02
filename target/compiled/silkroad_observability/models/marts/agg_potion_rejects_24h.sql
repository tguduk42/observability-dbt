

select
    toStartOfHour(ts) as hour,
    count() as rejected,
    uniqExact(char_id) as unique_chars,
    avgIf(duration_ms, status = 'error') as avg_handler_ms
from `default`.`stg_obs_spans`
where name = 'use'
  and status = 'error'
group by hour