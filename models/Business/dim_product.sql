{{ config(

    materialized='table'

) }}

SELECT

    PRODUCT_ID,

    PRODUCT_NAME,

    CATEGORY,

    SUBCATEGORY,

    BRAND,

    UNIT_PRICE,

    COST_PRICE,

    UNIT_PRICE - COST_PRICE AS PROFIT_PER_UNIT

FROM {{ source('raw', 'PRODUCTS') }}




