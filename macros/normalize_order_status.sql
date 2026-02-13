{% macro normalize_order_status(status) %}
case
    when upper(trim({{ status }})) in ('COMPLETE','COMPLETED','SUCCESS','PAID')
        then 'COMPLETED'
    when upper(trim({{ status }})) in ('CANCELLED','CANCELED')
        then 'CANCELLED'
    when upper(trim({{ status }})) in ('REFUND','REFUNDED')
        then 'REFUNDED'
    else 'UNKNOWN'
end
{% endmacro %}
