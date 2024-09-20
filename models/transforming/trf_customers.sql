{{ config(materialized = 'table', schema = 'transforming') }}
 
with customer_cte as (
    select 
    customerid,
    companyname,
    contactname,
    city,
    country,
    divisionid,
    address,
    fax,
    phone,
    postalcode,
    IFF(stateprovince = '', 'NA' , stateprovince) as statename
     from {{ ref('stg_customers') }}
)
 
select * from customer_cte