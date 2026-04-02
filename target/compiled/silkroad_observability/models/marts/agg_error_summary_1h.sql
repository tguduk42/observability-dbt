

select
    name,
    err_class,
    count() as total,
    countIf(status = 'error') as errors,
    round(countIf(status = 'error') / count() * 100, 2) as error_pct,
    round(avg(duration_ms), 1) as avg_ms,
    max(duration_ms) as max_ms
from `default`.`stg_obs_spans`
where ts >= now() - INTERVAL 1 HOUR
  and status = 'error'
group by name, err_class