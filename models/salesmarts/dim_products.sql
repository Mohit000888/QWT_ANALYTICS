{{config(materialized='table', schema='salemart')}}


select

p.productid,
p.productname,
p.quantityperunit,
p.unitprice,
p.unitcost,
p.unitsonorder,
p.unitsinstock,
p.productavailability,
s.contactname,
s.companyname


from 
{{ref('trf_products')}} as p
inner join {{ref('trf_suppliers')}} s on p.supplierid = s.supplierid
inner join {{ref('lkp_categories')}} as c
on p.categoryid = c.categoryid