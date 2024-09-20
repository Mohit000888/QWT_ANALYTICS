{{ config(materialized = 'table', schema = 'transforming') }}
 
with product_cte as (
    select 
    productid,
    productname,
    supplierid,
    categoryid,
    quantityperunit,
    unitcost,
    unitprice,
    unitsinstock,
    unitsonorder,
    IFF(unitsonorder - unitsinstock > 0 , 'Product is available', 'Product is not available') 
    as productavailability
     from {{ ref('stg_products') }}
)
 
select * from product_cte