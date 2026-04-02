
  
    
    
    
        
         


        insert into `default`.`agg_exchange_top_characters_today__dbt_backup`
        ("char_id", "trades_initiated", "trades_completed")

select
    char_id,
    countIf(name = 'exchange_start_ok') as trades_initiated,
    countIf(name = 'exchange_approve_ok'
            and JSONExtractBool(attrs, 'completed') = true) as trades_completed
from `default`.`stg_obs_spans`
where name like 'exchange_%'
group by char_id
  