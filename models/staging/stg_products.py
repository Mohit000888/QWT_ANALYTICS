
def model(dbt, session):
    dbt.config(materialized = "table")
    df = dbt.source("qwt_src", "products")

    return df