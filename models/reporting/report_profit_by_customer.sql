SELECT
    customerid
    ,segment
    ,country
    ,sum(orderprofit)as profit
FROm {{ ref('stg_order') }}
GROUP BY customerid, segment, country