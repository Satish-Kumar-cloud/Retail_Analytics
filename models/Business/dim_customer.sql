{{ config(

    materialized='table'

) }}

SELECT

CUSTOMER_ID,

FIRST_NAME || ' ' || LAST_NAME AS CUSTOMER_NAME,

GENDER,

CITY,

STATE,

COUNTRY,

REGISTRATION_DATE,

CUSTOMER_SEGMENT

FROM {{ source('raw', 'CUSTOMERS') }}




