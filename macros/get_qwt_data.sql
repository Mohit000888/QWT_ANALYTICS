{% macro get_order_linenos() -%}
 
{% set lineno__query %}
select distinct
Lineno
from {{ ref('stg_order_details') }}
order by 1
{% endset %}
 
{% set results = run_query(lineno__query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{%- endmacro %}

{% macro get_min_order() -%}

 
{% set orderdate__query %}
select min(orderdate)
from {{ ref('stg_orders') }}
{% endset %}
 
{% set results = run_query(orderdate__query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{%- endmacro %}

{% macro get_max_order() -%}

 
{% set orderdate__query %}
select max(orderdate)
from {{ ref('stg_orders') }}
{% endset %}
 
{% set results = run_query(orderdate__query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{%- endmacro %}
