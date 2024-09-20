{{ config(materialized = 'view', schema = 'reporting') }}
 
with reporting_cte as
 
(
    select  
    orderid,
    {% for el in get_order_linenos() %}
    sum(case when lineno = {{el}} then linesalesamount end) as lineno_{{el}}_amount,
    {% endfor %}
    sum(linesalesamount) as totalamount

    from {{ref('trf_orderdetails')}}
    group by orderid
)
 
select * from reporting_cte
