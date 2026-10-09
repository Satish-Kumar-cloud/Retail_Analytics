{{ config(

    materialized='table'

) }}

SELECT

    DATE_ID,

    FULL_DATE,

    DAY,

    MONTH,

    MONTH_NAME,

    QUARTER,

    YEAR,

    WEEK,

    DAY_NAME

FROM {{ source('raw', 'DATE') }}




