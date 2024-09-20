{{config(materialized='table', schema='transforming')}}

select

get(xmlget(supplierinfo, 'SupplierID'), '$') as supplierid,
get(xmlget(supplierinfo, 'CompanyName'), '$') as companyname,
get(xmlget(supplierinfo, 'ContactName'), '$') as contactname,
get(xmlget(supplierinfo, 'Address'), '$') as address,
get(xmlget(supplierinfo, 'City'), '$') as city,
get(xmlget(supplierinfo, 'PostalCode'), '$') as postalcode,
get(xmlget(supplierinfo, 'Country'), '$') as country,
get(xmlget(supplierinfo, 'Phone'), '$') as phone

from {{ref('stg_suppliers')}}