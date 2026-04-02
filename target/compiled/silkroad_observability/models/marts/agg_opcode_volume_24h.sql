

select
    toStartOfFifteenMinutes(ts) as bucket,
    request_kind,
    count() as total,
    countIf(status = 'error') as errors
from `default`.`stg_obs_spans`
where ts >= now() - INTERVAL 24 HOUR
group by bucket, request_kind