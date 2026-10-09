{{ config(

    materialized='table'

) }}

SELECT

ORDER_ID,

    CUSTOMER_ID,

    PRODUCT_ID,

    STORE_ID,

    ORDER_DATE,

    QUANTITY,

    UNIT_PRICE,

    DISCOUNT,

    PAYMENT_METHOD,

    CHANNEL,

    ORDER_STATUS

    FROM {{ source('raw', 'ORDERS') }}









