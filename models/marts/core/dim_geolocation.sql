WITH geolocation AS (
    select * from {{ ref('stg_geolocation')}}
)

SELECT * FROM geolocation