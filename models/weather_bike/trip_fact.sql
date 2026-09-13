with trips as( 
    select
    ride_id,
    rideable_type,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS trip_date,
    start_statio_id as start_station_id,
    end_station_id,
    member_csual AS member_casual,
    TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT) ) AS trip_duration_secs
    from {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'
)

select * from trips