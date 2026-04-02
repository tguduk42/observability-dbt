
  
    
    
    
        
         


        insert into `default`.`agg_error_class_today__dbt_backup`
        ("err_class", "total")

select
    err_class,
    count() as total
from `default`.`stg_obs_spans`
where err_class != ''
group by err_class
  