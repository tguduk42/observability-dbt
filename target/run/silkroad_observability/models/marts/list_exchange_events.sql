
  
    
    
    
        
         


        insert into `default`.`list_exchange_events__dbt_backup`
        ("ts", "trace_id", "span_id", "char_id", "account_id", "exchange_event", "status", "request_kind", "result_code", "completed", "fail_reason", "fail_code")

select
    ts,
    trace_id,
    span_id,
    char_id,
    account_id,
    name as exchange_event,
    status,
    request_kind,
    result_code,
    JSONExtractBool(attrs, 'completed') as completed,
    JSONExtractString(attrs, 'reason') as fail_reason,
    JSONExtractString(attrs, 'code') as fail_code
from `default`.`stg_obs_spans`
where name like 'exchange_%'
order by ts desc
  