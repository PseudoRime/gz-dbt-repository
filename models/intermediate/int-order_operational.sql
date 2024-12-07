select 
    s.orders_id, 
    s.margin,
    purchase_cost,
    ROUND(s.margin + p.final_shipping_fee - p.logcost - p.ship_cost, 2) AS operational_margin
from {{ ref('int_order_margin') }} s
left join (
    select 
        orders_id, 
        final_shipping_fee, 
        logcost, 
        ship_cost
    from {{ ref('stg_gz_raw__ship') }}
) p
on s.orders_id = p.orders_id