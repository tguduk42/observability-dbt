{{ config(materialized='table') }}

select
    name,
    JSONExtractString(attrs, 'reason') as reason,
    JSONExtractString(attrs, 'code') as code,
    count() as cnt
from {{ ref('stg_obs_events') }}
where ts >= now() - INTERVAL 24 HOUR
  and name like 'exchange_%_fail'
group by name, reason, code
