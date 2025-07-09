WITH fact_order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
)

select * from fact_order_items