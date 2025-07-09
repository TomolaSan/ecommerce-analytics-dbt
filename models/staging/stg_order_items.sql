WITH stg_order_items AS (
    SELECT * FROM raw_data.order_items
)

SELECT 
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value

FROM stg_order_items