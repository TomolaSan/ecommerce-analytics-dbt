WITH
  stg_orders    AS (
    SELECT * FROM {{ ref('stg_orders') }}
  ),
  stg_payments  AS (
    SELECT * FROM {{ ref('stg_payments') }}
  ),
  stg_customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
  ),

  final AS (
    SELECT
      o.order_id,
      SUM(p.payment_value)       AS total_cost,
      c.customer_unique_id
    FROM stg_orders AS o
    LEFT JOIN stg_payments AS p
      ON p.order_id      = o.order_id
    LEFT JOIN stg_customers AS c
      ON c.customer_id   = o.customer_id
    GROUP BY
      o.order_id,
      c.customer_unique_id
  )

SELECT * 
FROM final
