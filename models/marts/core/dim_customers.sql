WITH customers as (
    select * from {{ref ('stg_customers') }} 
)

select * from customers