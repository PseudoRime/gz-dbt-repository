select orders_id, margin,
ROUND(margin + final_shipping_fee - logcost - ship_cost,2) AS operational_margin
from {{ ref('int_order_margin') }} s
left join (
    select 
        final_shipping_fee, 
        logcost, 
        ship_cost
    from {{ ref('stg_gz_raw__ship') }}
) p
on s.orders_id = p.orders_id