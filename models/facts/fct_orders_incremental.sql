{{ config(

    materialized = 'incremental',

    incremental_strategy = 'merge',

    unique_key = 'ORDER_ID',

    on_schema_change = 'sync_all_columns'

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

{% if is_incremental() %}

WHERE ORDER_DATE >= (

    SELECT DATEADD(

        DAY,

        -3,

        MAX(ORDER_DATE)

    )

    FROM {{ this }}

)

{% endif %}




