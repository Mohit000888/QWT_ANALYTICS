{{ config(materialized='table')}}

select 
* 
from

{{ source('qwt_src','suppliers')}}