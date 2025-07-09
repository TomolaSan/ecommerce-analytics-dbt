WITH sellers AS (
    SELECT * FROM {{ref('stg_sellers')}}
)

select * from sellers