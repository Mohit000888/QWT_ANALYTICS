{% snapshot shipments_snapshot -%}

{{
    config(
    target_datebase= 'QWT_ANALYTICS',
    target_schema= 'snapshot',
    unique_key="orderid||'-'||lineno",
    strategy='timestamp',
    updated_at='shipmentdate'
    )

}}

select * from {{ref('stg_shipments')}}

{%- endsnapshot %}