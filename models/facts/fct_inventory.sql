{{ config(

    materialized='table'

) }}

SELECT

INVENTORY_ID,

    STORE_ID,

    PRODUCT_ID,

    INVENTORY_DATE,

    STOCK_QUANTITY,

    REORDER_LEVEL

FROM {{ source('raw', 'INVENTORY') }}




