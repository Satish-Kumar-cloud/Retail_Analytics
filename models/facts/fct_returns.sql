{{ config(

    materialized='table'

) }}

SELECT

    r.RETURN_ID,

    r.ORDER_ID,

    r.PRODUCT_ID,

    r.RETURN_DATE,

    r.RETURN_QUANTITY,

    r.RETURN_AMOUNT,

    r.RETURN_REASON,

    r.RETURN_QUANTITY * p.COST_PRICE AS RETURN_COST,

    r.RETURN_AMOUNT -

        (r.RETURN_QUANTITY * p.COST_PRICE) AS RETURN_LOSS

FROM {{ source('raw', 'RETURNS') }} r

LEFT JOIN {{ ref('dim_product') }} p

    ON r.PRODUCT_ID = p.PRODUCT_ID




