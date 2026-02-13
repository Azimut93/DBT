select order_item_id as order_item_id, 
order_id as order_id, 
product_id as product_id, 
cast(quantity as number(10, 0)) as quantity, 
unit_price::numeric as   unit_price,
coalesce(discount_amount, 0) as discount_amount, 
(
    cast(quantity as number(10,0))
    * cast(unit_price as number(18,2))
) - coalesce(discount_amount, 0)
as line_amount, 
load_timestamp as load_timestamp
from {{ source('raw','raw_order_items') }}