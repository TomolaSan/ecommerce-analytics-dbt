WITH stg_geolocation AS (
    SELECT * FROM raw_data.geolocation
)

SELECT 
    geolocation_zip_code_prefix AS geolocation_zip_code,
    geolocation_lat AS geolocation_latitude,
    geolocation_lng AS geolocation_longitude,
    geolocation_city AS city,
    geolocation_state AS state 

FROM stg_geolocation