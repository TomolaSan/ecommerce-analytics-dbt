WITH stg_products AS (
    select * from raw_data.products
)

SELECT product_id,
       product_category_name,
       product_length_cm AS product_length,
       product_weight_g AS product_weight,
       product_height_cm AS product_height,
       product_width_cm AS product_width,
       product_description_lenght as desc_length,
       product_photos_qty as product_photo_count

FROM 
    stg_products
