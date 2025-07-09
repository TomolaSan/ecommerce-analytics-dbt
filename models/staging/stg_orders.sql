WITH stg_orders AS (
    SELECT * FROM raw_data.orders
)

SELECT order_id,
       customer_id,
       order_status,
       order_purchase_timestamp AS order_purchase_timestamp,
       order_approved_at AS order_approval_timestamp,
       order_delivered_carrier_date AS carrier_delivery_date,
       order_delivered_customer_date AS customer_delivery_date,
       order_estimated_delivery_date AS order_estimated_delivery_date


FROM stg_orders