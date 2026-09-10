WITH daily_weather AS (
    select 
    DATE(TIME) AS daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from {{ source('demo', 'weather') }}
    ORDER BY daily_weather 
    LIMIT 5000
),
date_weather AS (
    select
    daily_weather,
    AVG(temp) AS avg_temp,
    AVG(pressure) AS avg_pressure,
    AVG(humidity) AS avg_humidity,
    AVG(clouds) AS avg_clouds,
    weather
    FROM daily_weather
    GROUP BY daily_weather, weather
    QUALIFY ROW_NUMBER() OVER(partition by daily_weather order by count(*) DESC ) = 1
)


SELECT * FROM date_weather