

select
    ts,
    char_id,
    name,
    request_kind,
    status,
    duration_ms,
    err_class,
    attrs
from `default`.`stg_obs_spans`
where char_id > 0