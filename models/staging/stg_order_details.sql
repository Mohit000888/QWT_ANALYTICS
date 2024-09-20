{{ config( materialized = 'incremental', unique_key = ['OrderId', 'LineNo'] )}}

with order_details_cte as (
select od.*, o.OrderDate from {{source("qwt_src",'orders_details')}} od
join {{ ref('stg_orders') }} o on  od.OrderID = od.OrderID

{% if is_incremental() %}
    where o.OrderDate > (select max(OrderDate) from {{this}})
{%endif%}

)

select * from order_details_cte
