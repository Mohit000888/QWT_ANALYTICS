{{ config(materialized = 'view', schema = 'salemart') }}
 
with trfcustomers as (
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
    statename
    from {{ ref('trf_customers') }}
),
 
lkpdivisions as(
    select 
    divisionid,
    divisionname
    from {{ref("lkp_division")}}
),

final as
 
(
select  
trfcustomers.customerid,
trfcustomers.companyname,
trfcustomers.contactname,
trfcustomers.city,
trfcustomers.country,
trfcustomers.address,
trfcustomers.fax,
trfcustomers.phone,
trfcustomers.postalcode,
trfcustomers.statename,
lkpdivisions.divisionname
 
    from trfcustomers inner join lkpdivisions on trfcustomers.divisionid = lkpdivisions.divisionid
 
)
 
select * from final