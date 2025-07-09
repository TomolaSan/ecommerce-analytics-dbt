WITH stg_payments AS (
    SELECT * FROM raw_data.payments
)

SELECT 
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value

FROM stg_payments