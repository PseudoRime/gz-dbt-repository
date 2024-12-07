select *,
    ROUND(margin + final_shipping_fee - logcost - ship_cost, 2) AS operational_margin
from {{ ref('int_order_margin') }} 
left join (
    select 
        orders_id,
        final_shipping_fee, 
        logcost, 
        ship_cost
    from {{ ref('stg_gz_raw__ship') }}
) 
using (orders_id)