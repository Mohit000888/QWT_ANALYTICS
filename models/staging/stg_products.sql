{{ config(materialized = 'table') }}
 
with cte as (
    select * from qwt_analytics.raw.products limit 5
)
 
select * from cte