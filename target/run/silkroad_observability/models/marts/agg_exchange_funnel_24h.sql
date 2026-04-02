
  
    
    
    
        
         


        insert into `default`.`agg_exchange_funnel_24h__dbt_backup`
        ("started", "confirmed", "completed", "cancelled")

select
    countIf(name = 'exchange_start_ok') as started,
    countIf(name = 'exchange_confirm_ok') as confirmed,
    countIf(name = 'exchange_approve_ok'
            and JSONExtractBool(attrs, 'completed') = true) as completed,
    countIf(name like 'exchange_%_fail'
         or name = 'exchange_cancel_ok') as cancelled
from `default`.`stg_obs_events`
where ts >= now() - INTERVAL 24 HOUR
  