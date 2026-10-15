{{ config(materialized="table") }}

select

    c.customer_id,

    o.order_id,

    c.customer_name,

    c.city || c.state || c.country as "ADDRESS",

    to_char(o.order_date, 'DD-MON-YYYY') as "ORDER_DATE",

    o.quantity as "ORDERED_QUANTATITY",

    o.unit_price as "PRICE"

from {{ ref("fct_orders") }} o

left join {{ ref("dim_date") }} d on o.order_date = d.full_date

left join {{ ref("dim_customer") }} c on o.customer_id = c.customer_id

order by o.order_id, customer_id asc

