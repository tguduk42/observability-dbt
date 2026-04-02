
  
    
    
    
        
         


        insert into `default`.`agg_character_activity_2h__dbt_backup`
        ("ts", "char_id", "name", "request_kind", "status", "duration_ms", "err_class", "attrs")

select
    ts,
    char_id,
    name,
    request_kind,
    status,
    duration_ms,
    err_class,
    attrs
from `default`.`stg_obs_spans`
where ts >= now() - INTERVAL 2 HOUR
  and char_id > 0
  