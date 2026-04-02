{{ config(materialized='table') }}

select
    toStartOfFifteenMinutes(ts) as bucket,
    request_kind,
    count() as total,
    countIf(status = 'error') as errors
from {{ ref('stg_obs_spans') }}
group by bucket, request_kind
