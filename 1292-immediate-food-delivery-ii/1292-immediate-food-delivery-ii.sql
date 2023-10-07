# select  round(sum(if (order_date = customer_pref_delivery_date, 1, 0))/count(* ) *100 , 2 ) as immediate_percentage 
Select round(avg(order_date = customer_pref_delivery_date)*100, 2) as immediate_percentage
from Delivery 
where ( customer_id , order_date ) in (

    select customer_id , min(order_date) 
    from delivery
    group by customer_id

)
