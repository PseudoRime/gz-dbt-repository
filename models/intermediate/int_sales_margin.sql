select
    s.date_date,
    s.orders_id,
    s.products_id,
    s.quantity,
    s.revenue,
    cast(p.purchase_price as float64) as purchase_price,
    ROUND(purchase_price*quantity, 2) AS purchase_cost,
from {{ ref('stg_gz_raw__sales') }} s
left join {{ ref('stg_gz_raw__product') }} p
on s.products_id = p.products_id
