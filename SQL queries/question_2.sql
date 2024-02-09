
SELECT 
    SUM(orders.product_quantity * dim_product.sale_price) AS revenue,
    dim_date.year,
    dim_date.start_of_monthj

FROM 
    orders
INNER JOIN 
    dim_product ON dim_product.product_code = orders.product_code
INNER JOIN 
    dim_date ON orders.order_date = dim_date.date
WHERE 
    dim_date.year = 2022
GROUP BY 
    dim_date.start_of_monthj,dim_date.year
    LIMIT 1;