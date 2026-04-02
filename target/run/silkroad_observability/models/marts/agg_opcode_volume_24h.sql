
  
    
    
    
        
         


        insert into `default`.`agg_opcode_volume_24h__dbt_backup`
        ("bucket", "request_kind", "total", "errors")

select
    toStartOfFifteenMinutes(ts) as bucket,
    request_kind,
    count() as total,
    countIf(status = 'error') as errors
from `default`.`stg_obs_spans`
where ts >= now() - INTERVAL 24 HOUR
group by bucket, request_kind
  