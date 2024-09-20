{{ config(materialized = 'table', schema = 'salemart') }}


{% set min_orderdate = get_min_order()%}
{% set max_orderdate = get_max_order()%}

{{dbt_date.get_date_dimension(min_orderdate,max_orderdate)}}