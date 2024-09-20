{{ config(materialized = 'table', schema = 'transforming') }}
 
with order_cte as (
    select 
    orderid,
    customerid,
    employeeid,
    shipperid,
    freight,
    orderdate,
    month(orderdate) as ordermonth,
    year(orderdate) as orderyear

     from {{ ref('stg_orders') }}
)
 
select * from order_cte