WITH stg_sellers AS (
    SELECT * FROM raw_data.sellers
)

SELECT seller_id,
       seller_zip_code_prefix AS seller_zip_code,
       seller_city,
       seller_state

FROM  stg_sellers