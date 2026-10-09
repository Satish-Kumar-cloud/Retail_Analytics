{{ config(

    materialized='table'

) }}

SELECT

    s.SALE_ID,

    s.ORDER_ID,

    s.CUSTOMER_ID,

    s.PRODUCT_ID,

    s.STORE_ID,

    s.SALE_DATE,

    s.QUANTITY,

    s.UNIT_PRICE,

    s.DISCOUNT,

    s.SALES_AMOUNT,

    s.QUANTITY * p.COST_PRICE AS COST_AMOUNT,

    s.SALES_AMOUNT -

        (s.QUANTITY * p.COST_PRICE) AS PROFIT_AMOUNT,

        {{ calculate_cost(

        's.QUANTITY',

        'p.COST_PRICE'

    ) }} AS COST_AMOUNT_MACRO,
{{ calculate_profit(

        's.SALES_AMOUNT',

        's.QUANTITY',

        'p.COST_PRICE'

    ) }} AS PROFIT_AMOUNT_USING_MACRO











FROM {{ source('raw', 'SALES') }} s

LEFT JOIN {{ ref('dim_product') }} p

    ON s.PRODUCT_ID = p.PRODUCT_ID




