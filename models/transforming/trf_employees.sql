{{ config(materialized='table', schema='transforming')}}

with employee_cte as (
    select 
    emp.empid,
    emp.firstname as employeename,
    emp.title as role,
    emp.hiredate as doj,
    emp.yearsalary as salary,
    IFF(mrg.firstname = null, emp.firstname , mrg.firstname) as managername,
    IFF(mrg.title = null, emp.title , mrg.title) as managerrole,
    ofc.address,
    ofc.city,
    ofc.phone,
    ofc.postalcode,
    ofc.country


     from {{ ref('stg_employee') }} emp

     left  join  {{ref('stg_employee')}} mrg on emp.empid = mrg.reportsto

     left  join {{ref('stg_office')}} ofc on emp.office = ofc.officeid
)
 
select * from employee_cte