

select
    e.ts,
    s.char_id,
    e.name,
    e.level,
    e.attrs
from `default`.`stg_obs_events` e
inner join `default`.`stg_obs_spans` s on s.span_id = e.span_id
where e.ts >= now() - INTERVAL 2 HOUR
  and s.char_id > 0