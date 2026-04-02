

select distinct
    trace_id,
    ts,
    name,
    char_id,
    status
from `default`.`stg_obs_spans`
where ts >= now() - INTERVAL 1 HOUR
  and status = 'error'
  and critical = true