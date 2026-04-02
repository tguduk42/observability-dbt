{{ config(materialized='table') }}

select
    e.ts,
    s.char_id,
    e.name,
    e.level,
    e.attrs
from {{ ref('stg_obs_events') }} e
inner join {{ ref('stg_obs_spans') }} s on s.span_id = e.span_id
where s.char_id > 0
