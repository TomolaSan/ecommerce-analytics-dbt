WITH dim_products AS (
    SELECT * FROM {{ ref('stg_products') }}
),
category_english AS (
    SELECT * FROM {{ ref('stg_product_categories')}}
),
final as (
    select 
    dim_products.product_id,
    category_english.product_cat_englishnname,
    dim_products.product_length,
    dim_products.product_width,
    dim_products.product_height,
    dim_products.product_weight,
    dim_products.desc_length,
    product_photo_count

    from dim_products
    left join category_english on dim_products.product_category_name = category_english.product_cat_name
)
select * from final
