{{ config(materialized = 'view', schema = 'salemart') }}

select od.*,
o.* 

from {{ref('trf_orders')}} as o
inner join {{'trf_orderdetails'}} as od
on o.orderid = od.orderid