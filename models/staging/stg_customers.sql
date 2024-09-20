{{ config(materialized = 'table') }}
 
with cte as (
    select * from {{ source('qwt_src', 'customers') }}
)
 
select * from cte