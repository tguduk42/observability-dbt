
  
    
    
    
        
         


        insert into `default`.`list_exchange_characters_24h__dbt_backup`
        ("char_id", "trades_started", "trades_confirmed", "trades_completed", "last_exchange_at")

select
    char_id,
    countIf(name = 'exchange_start_ok') as trades_started,
    countIf(name = 'exchange_confirm_ok') as trades_confirmed,
    countIf(
        name = 'exchange_approve_ok'
        and JSONExtractBool(attrs, 'completed') = true
    ) as trades_completed,
    max(ts) as last_exchange_at
from `default`.`stg_obs_spans`
where name like 'exchange_%'
group by char_id
having trades_started > 0
order by trades_completed desc, trades_started desc, char_id asc
  