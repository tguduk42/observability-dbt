
  
    
    
    
        
         


        insert into `default`.`agg_potion_rejects_24h__dbt_backup`
        ("hour", "rejected", "unique_chars", "avg_handler_ms")

select
    toStartOfHour(ts) as hour,
    count() as rejected,
    uniqExact(char_id) as unique_chars,
    avgIf(duration_ms, status = 'error') as avg_handler_ms
from `default`.`stg_obs_spans`
where ts >= now() - INTERVAL 24 HOUR
  and name = 'use'
  and status = 'error'
group by hour
  