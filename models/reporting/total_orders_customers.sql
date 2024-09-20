{{ config( materialized='table', schema='reporting' ) }}

with customers as(
select 
customerid,
companyname,
contactname 
from {{ref('stg_customers')}}
),

orders as (
    select
    orderid,
    customerid,
    orderdate
    from {{ref('stg_orders')}}
),


customers_order as
(
    select
    customers.customerid as customerid,
    customers.companyname as companyname,
    customers.contactname as contactname,
    min(orders.orderdate) as min_orderdate,
    max(orders.orderdate) as max_orderdate,
    count(orders.orderid) as total_order

    from orders inner join customers on orders.customerid = customers.customerid
    group by companyname, contactname
)
