{{ config(materialized = 'view', schema = 'reporting') }}

select
e.employeename,
o.ordermonth,
e.city,

sum(o.linesaleamount) as sales,
avg(o.margin) as margin

from {{ref('fct_orders')}} as o 
inner join {{ref('dim_employees')}}

where city = {{var('city')}} and o.orderyear =2010

group by e.employeename, o.ordermonth

order by sale desc
