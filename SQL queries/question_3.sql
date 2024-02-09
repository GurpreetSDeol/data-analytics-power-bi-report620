SELECT 
    dim_store.store_type AS german_store_type,
    SUM(orders.product_quantity * dim_product.sale_price) AS revenue
FROM 
    orders
INNER JOIN 
    dim_product ON dim_product.product_code = orders.product_code
INNER JOIN 
    dim_store ON dim_store.store_code = orders.store_code
INNER JOIN 
    dim_date ON orders.order_date = dim_date.date
WHERE 
    dim_store.country = 'Germany' AND dim_date.year = 2022
GROUP BY 
    german_store_type
ORDER BY 
    revenue DESC
LIMIT 1;