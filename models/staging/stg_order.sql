SELECT
    --from raw_orders
    o.orderId
    ,o.orderdate
    ,o.shipdate
    ,o.shipmode
    ,o.ordersellingprice - o.ordercostprice as orderprofit
    ,o.ordercostprice
    ,o.ordersellingprice
    --from raw_customer
    ,c.customerid
    ,c.customername
    ,c.segment
    ,c.country
    --from raw_product
    ,p.productid
    ,p.category
    ,p.productname
    ,p.subcategory
FROM {{ ref('raw_order') }} as o
left join {{ ref('raw_customer') }} as c
    on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
    on o.productid = p.productid