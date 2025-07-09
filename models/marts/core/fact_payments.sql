with fact_payments as (
    select * from {{ ref('stg_payments')}}
)

select * from fact_payments