{{ config(materialized='table') }}

select
    ts,
    char_id,
    name,
    request_kind,
    status,
    duration_ms,
    err_class,
    attrs
from {{ ref('stg_obs_spans') }}
where ts >= now() - INTERVAL 2 HOUR
  and char_id > 0
