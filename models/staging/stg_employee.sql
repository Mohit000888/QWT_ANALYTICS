{{ config(materialized = 'table') }}
 
with cte as (
    select * from {{ source('qwt_src', 'employee') }}
)
 
select * from cte