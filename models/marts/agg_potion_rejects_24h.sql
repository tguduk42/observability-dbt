{{ config(materialized='table') }}

select
    toStartOfHour(ts) as hour,
    count() as rejected,
    uniqExact(char_id) as unique_chars,
    avgIf(duration_ms, status = 'error') as avg_handler_ms
from {{ ref('stg_obs_spans') }}
where ts >= now() - INTERVAL 24 HOUR
  and name = 'use'
  and status = 'error'
group by hour
