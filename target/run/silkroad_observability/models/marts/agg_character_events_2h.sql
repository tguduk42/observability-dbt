
  
    
    
    
        
         


        insert into `default`.`agg_character_events_2h__dbt_backup`
        ("ts", "char_id", "name", "level", "attrs")

select
    e.ts,
    s.char_id,
    e.name,
    e.level,
    e.attrs
from `default`.`stg_obs_events` e
inner join `default`.`stg_obs_spans` s on s.span_id = e.span_id
where s.char_id > 0
  