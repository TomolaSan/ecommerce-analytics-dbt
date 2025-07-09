WITH stg_product_categories AS (
    SELECT * FROM raw_data.product_categories
)

SELECT 
    string_field_0 AS product_cat_name,
    string_field_1 AS product_cat_englishnname

FROM stg_product_categories
