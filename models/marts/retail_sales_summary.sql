{{ config(

    materialized='table'

) }}

SELECT

    d.YEAR,

    d.MONTH,

    d.MONTH_NAME,

    p.CATEGORY,

    p.BRAND,

    st.REGION,

    st.STATE,

    st.STORE_NAME,

    COUNT(DISTINCT s.ORDER_ID) AS TOTAL_ORDERS,

    COUNT(DISTINCT s.CUSTOMER_ID) AS UNIQUE_CUSTOMERS,

    SUM(s.QUANTITY) AS TOTAL_UNITS_SOLD,

    SUM(s.SALES_AMOUNT) AS TOTAL_SALES,

    SUM(s.COST_AMOUNT) AS TOTAL_COST,

    SUM(s.PROFIT_AMOUNT) AS TOTAL_PROFIT,

    AVG(s.SALES_AMOUNT) AS AVG_SALE_AMOUNT

FROM {{ ref('FCT_SALES') }} s

LEFT JOIN {{ ref('dim_date') }} d

    ON s.SALE_DATE = d.FULL_DATE

LEFT JOIN {{ ref('dim_product') }} p

    ON s.PRODUCT_ID = p.PRODUCT_ID

LEFT JOIN {{ ref('dim_store') }} st

    ON s.STORE_ID = st.STORE_ID

GROUP BY

    d.YEAR,

    d.MONTH,

    d.MONTH_NAME,

    p.CATEGORY,

    p.BRAND,

    st.REGION,

    st.STATE,

    st.STORE_NAME









