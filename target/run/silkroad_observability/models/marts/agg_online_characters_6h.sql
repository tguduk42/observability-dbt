
  
    
    
    
        
         


        insert into `default`.`agg_online_characters_6h__dbt_backup`
        ("bucket", "online_chars")

select
    toStartOfMinute(ts) as bucket,
    uniqExact(char_id) as online_chars
from `default`.`stg_obs_spans`
where ts >= now() - INTERVAL 6 HOUR
  and char_id > 0
group by bucket
  