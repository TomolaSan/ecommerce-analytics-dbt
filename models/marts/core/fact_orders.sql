WITH orders AS (
    select * from {{ ref('stg_orders') }}
),
 order_items AS (
    select * from {{ ref('stg_order_items') }}
),
 reviews AS (
    select * from {{ref('stg_order_reviews') }}
),

final AS ( 
    select 
    orders.order_id,
    orders.customer_id,
    orders.order_purchase_timestamp,
    orders.order_approval_timestamp,
    orders.order_status,
    customer_delivery_date as delivery_date,
    CASE 
        WHEN orders.customer_delivery_date > orders.order_estimated_delivery_date THEN 'Late'
        ELSE 'On time'
    END AS is_delivered_late,
    SUM(order_items.price) AS total_order_value,
    -- SUM(payments.payment_value) as total_order_value
    MAX(order_items.order_item_id) AS number_of_items,
    SUM(order_items.freight_value) AS freight_value,
    reviews.review_score

FROM orders 
left join order_items  ON orders.order_id = order_items.order_id
left join reviews  ON order_items.order_id = reviews.order_id

group by
    orders.order_id,
    orders.customer_id,
    orders.order_purchase_timestamp,
    orders.order_approval_timestamp,
    orders.order_status,
    orders.customer_delivery_date,
    orders.order_estimated_delivery_date,
    reviews.review_score

)

select * from final