{{ config(materialized = 'table', schema = 'transforming') }}
 
with orderdetails_cte as (
    select 
    od.*,
    (od.UnitPrice * od.Quantity) * (1-Discount) as linesalesamount,
    p.UnitCost * od.Quantity as costofgoodssold,
    ((od.UnitPrice * od.Quantity) * (1-od.Discount)) - (p.UnitCost * od.Quantity) as margin
    

     from {{ ref('stg_order_details') }} as od inner join {{ref('trf_products')}} as p
     on od.productid = p.productid
)
 
select * from orderdetails_cte