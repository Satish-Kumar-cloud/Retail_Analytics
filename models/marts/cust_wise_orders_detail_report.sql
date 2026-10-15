{{ config(

    materialized='table'

) }}

SELECT  

       C.CUSTOMER_ID,

       O.ORDER_ID,

       C.CUSTOMER_NAME,

       C.CITY || C.STATE || C.COUNTRY AS  "ADDRESS",

       O.ORDER_DATE,

       O.QUANTITY AS "ORDERED_QUANTATITY",

       O.UNIT_PRICE AS "PRICE"

FROM  {{ ref('fct_orders') }} O

LEFT JOIN {{ ref('dim_date') }} D

ON O.ORDER_DATE = D.FULL_DATE

LEFT JOIN {{ ref('dim_customer') }} C

ON O.CUSTOMER_ID = C.CUSTOMER_ID

ORDER BY O.ORDER_DATE ASC
