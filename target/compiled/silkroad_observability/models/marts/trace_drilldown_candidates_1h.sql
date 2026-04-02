

select distinct
    trace_id,
    ts,
    name,
    char_id,
    status
from `default`.`stg_obs_spans`
where status = 'error'
  and critical = true