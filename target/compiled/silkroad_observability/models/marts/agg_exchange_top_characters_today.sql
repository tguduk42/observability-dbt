

select
    char_id,
    countIf(name = 'exchange_start_ok') as trades_initiated,
    countIf(name = 'exchange_approve_ok'
            and JSONExtractBool(attrs, 'completed') = true) as trades_completed
from `default`.`stg_obs_spans`
where ts >= today()
  and name like 'exchange_%'
group by char_id