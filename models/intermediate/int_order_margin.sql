select *,     
ROUND (revenue - purchase_cost, 2) AS margin
from {{ ref('int_sales_margin') }}