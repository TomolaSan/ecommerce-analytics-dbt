WITH stg_customers AS (
    SELECT * FROM raw_data.customers
)
SELECT customer_id,
       customer_unique_id,
       customer_zip_code_prefix as customer_zip_code,
       UPPER(customer_city) AS customer_city,
       customer_state
FROM 
    stg_customers

-- Note to self: create a schema to put your models