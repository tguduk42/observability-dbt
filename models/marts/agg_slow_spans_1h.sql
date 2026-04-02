{{ config(materialized='table') }}

select
    name,
    request_kind,
    count() as calls,
    round(avg(duration_ms), 1) as avg_ms,
    quantile(0.95)(duration_ms) as p95_ms,
    quantile(0.99)(duration_ms) as p99_ms,
    max(duration_ms) as max_ms
from {{ ref('stg_obs_spans') }}
where ts >= now() - INTERVAL 1 HOUR
group by name, request_kind
having quantile(0.95)(duration_ms) > 500
