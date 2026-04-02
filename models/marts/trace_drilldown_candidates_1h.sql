{{ config(materialized='table') }}

select distinct
    trace_id,
    ts,
    name,
    char_id,
    status
from {{ ref('stg_obs_spans') }}
where ts >= now() - INTERVAL 1 HOUR
  and status = 'error'
  and critical = true
