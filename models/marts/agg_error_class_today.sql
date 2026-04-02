{{ config(materialized='table') }}

select
    err_class,
    count() as total
from {{ ref('stg_obs_spans') }}
where err_class != ''
group by err_class
