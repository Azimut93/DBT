select
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk,
    customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    lower(email) as email,
    country,
    city,
    created_at::timestamp as created_at
from {{ source('raw','raw_customers') }}
qualify row_number() over (partition by customer_id order by created_at desc) = 1
