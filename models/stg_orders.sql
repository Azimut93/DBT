select
    order_id,
    customer_id,
    order_date::date as order_date,
    year(order_date) as order_year,
    {{ normalize_order_status('order_status') }} as order_status

from {{ source('raw','raw_orders') }}
