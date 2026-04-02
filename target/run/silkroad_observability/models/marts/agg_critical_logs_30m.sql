
  
    
    
    
        
         


        insert into `default`.`agg_critical_logs_30m__dbt_backup`
        ("ts", "name", "char_id", "account_id", "err_class", "result_code", "attrs")

select
    ts,
    name,
    char_id,
    account_id,
    err_class,
    result_code,
    attrs
from `default`.`stg_obs_spans`
where ts >= now() - INTERVAL 30 MINUTE
  and critical = true
  