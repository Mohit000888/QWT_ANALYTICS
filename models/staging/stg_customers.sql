{{ config(materialized = 'table') }}
 
with cte as (
    select * from qwt_analytics.raw.customers limit 5
)
 
select * from cte