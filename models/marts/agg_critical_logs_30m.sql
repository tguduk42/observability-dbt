{{ config(materialized='table') }}

select
    ts,
    name,
    char_id,
    account_id,
    err_class,
    result_code,
    attrs
from {{ ref('stg_obs_spans') }}
where critical = true
