{% macro calculate_profit(sales_amount, quantity, cost_price) %}

    {{ sales_amount }}

    -

    (

        {{ quantity }} * {{ cost_price }}

    )

{% endmacro %}




