WITH orders AS (
    SELECT * FROM {{ ref('fact_orders') }}
),
order_items AS (
    SELECT * FROM {{ ref('fact_order_items') }}
),
customers AS (
    SELECT * FROM {{ ref('dim_customers')}}
),

final as (
    select
    orders.order_id,
    COUNT(order_items.order_item_id) AS basket_size,
    SUM(order_items.price) AS order_value,
    customers.customer_id,
    customers.customer_state

    from orders
    left join order_items on orders.order_id = order_items.order_id
    left join customers on customers.customer_id = orders.customer_id
    

    group by orders.order_id,
             customers.customer_id,
             customers.customer_state
             
)

select * from final