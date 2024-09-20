import snowflake.snowpark.functions as F
 
def model(dbt,session):
 
    dbt.config(materialized = "table", schema = "reporting")
 
    cusotmers_df = dbt.ref('dim_customers')
 
    orders_df = dbt.ref('fct_orders')
 
    customer_orders_df = (
        orders_df.group_by('customerid')
        .agg(F.min(F.col('orderdate')).alias('first_orderdate'),
         F.max(F.col('orderdate')).alias('recent_order_date'),
         F.count(F.col('orderid')).alias('total_orders')
    )
    )
 
    final_df = (
               
                cusotmers_df.join(customer_orders_df, cusotmers_df.customerid == customer_orders_df.customerid, 'left')
                .select(
                    cusotmers_df.companyname.alias('companyname'),
                    cusotmers_df.contactname.alias('contactname'),
                    customer_orders_df.first_orderdate.alias('first_order_date'),
                    customer_orders_df.recent_order_date.alias('most_recent_order_date'),
                    customer_orders_df.total_orders.alias('total_orders')
               
                )
               
                )
    return final_df