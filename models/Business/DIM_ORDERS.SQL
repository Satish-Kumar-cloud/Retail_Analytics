{{ config(

    materialized = 'view'

) }}

SELECT

    ORDER_ID,

    CUSTOMER_ID,

    STORE_ID,

    ORDER_DATE,

    UPPER(TRIM(ORDER_STATUS)) AS ORDER_STATUS,

    ORDER_TOTAL,

    CURRENT_TIMESTAMP() AS DBT_LOADED_AT

FROM {{ ref('orders_seed') }}

WHERE ORDER_ID IS NOT NULL




