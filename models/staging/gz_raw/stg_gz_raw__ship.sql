with 

source as (

    select * from {{ source('gz_raw', 'ship') }}

),

compared as (
    select *
    from source
    where shipping_fee != shipping_fee_1
),

renamed as (

    select
        orders_id,
        shipping_fee AS final_shipping_fee,
        logcost,
        CAST(ship_cost AS FLOAT64) AS ship_cost

    from source
)

select * from renamed
