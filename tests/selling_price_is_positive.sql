WITH orders as
(
    SELECT *
    FROM {{ ref('raw_order') }}
)
SELECT
    orderid
    ,sum(ordersellingprice) as total_sp
FROM orders
GROUP BY orderid
HAVING total_sp < 0