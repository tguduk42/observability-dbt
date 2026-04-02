
  
    
    
    
        
         


        insert into `default`.`agg_error_summary_1h__dbt_backup`
        ("name", "err_class", "total", "errors", "error_pct", "avg_ms", "max_ms")

select
    name,
    err_class,
    count() as total,
    countIf(status = 'error') as errors,
    round(countIf(status = 'error') / count() * 100, 2) as error_pct,
    round(avg(duration_ms), 1) as avg_ms,
    max(duration_ms) as max_ms
from `default`.`stg_obs_spans`
where status = 'error'
group by name, err_class
  