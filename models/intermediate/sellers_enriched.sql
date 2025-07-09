WITH order_items AS (
    select * from {{ ref('fact_order_items') }}
),
sellers AS (
    select * from {{ ref('dim_sellers')}}
),
final  as (
    select 
        sellers.seller_id,
        sellers.seller_state,
        SUM(order_items.price) AS total_revenue,
        COUNT(order_items.product_id) AS total_goods_sold
    from sellers
    left join order_items ON sellers.seller_id = order_items.seller_id
    group by sellers.seller_id, sellers.seller_state
    )

    select * from final