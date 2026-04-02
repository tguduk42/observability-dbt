

  create or replace view `default`.`stg_obs_events` 
  
    
  
  
    
    
  as (
    select
    ts,
    toDate(ts) as event_date,
    toStartOfHour(ts) as event_hour,
    trace_id,
    span_id,
    name,
    level,
    attrs
from `default`.`obs_events`
    
  )
      
      
                    -- end_of_sql
                    
                    