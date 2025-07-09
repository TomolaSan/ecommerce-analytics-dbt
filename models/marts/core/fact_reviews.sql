WITH fact_reviews AS (
    select * from {{ ref('stg_order_reviews')}}
)

select * from fact_reviews