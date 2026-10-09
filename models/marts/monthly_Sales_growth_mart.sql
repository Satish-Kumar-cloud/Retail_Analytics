{{ config(

    materialized = 'table'

) }}

with monthly_sales as (

    select

        date_trunc('month', SALE_DATE) as sales_month,

        sum(SALES_AMOUNT) as net_sales

    from {{ ref('FCT_SALES') }}

    group by

        date_trunc('month', SALE_DATE)

),

sales_with_previous as (

    select

        sales_month,

        net_sales,

        lag(net_sales) over (

            order by sales_month

        ) as previous_month_sales

    from monthly_sales

)

select

    sales_month,

    net_sales,

    previous_month_sales,

    case

        when previous_month_sales is null

            then null

        when previous_month_sales = 0

            then null

        else

            (

                (net_sales - previous_month_sales)

                / previous_month_sales

            ) * 100

    end as month_over_month_growth_pct

from sales_with_previous




