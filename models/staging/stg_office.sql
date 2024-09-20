{{ config(materialized = 'table', schema = 'staging')}}

with office_cte as (
    select 
    Office as officeid,
    OfficeAddress as address,
    OfficePostalCode as postalcode,
    OfficeCity as city,
    OfficeStateProvince as stateprovince,
    OfficePhone as phone,
    OfficeFax as fax,
    OfficeCountry as country

    from {{source('qwt_src', 'office')}}
)

select * from office_cte

