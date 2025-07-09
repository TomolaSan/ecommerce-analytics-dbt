WITH stg_order_reviews AS (
    SELECT * FROM raw_data.order_reviews
)

SELECT 
    review_id,
    order_id,
    review_score,
    review_creation_date,
    review_answer_timestamp

FROM stg_order_reviews