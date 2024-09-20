{{ config(materialized = 'view', schema = 'salemart') }}

select * 

from {{ref('trf_employees')}}