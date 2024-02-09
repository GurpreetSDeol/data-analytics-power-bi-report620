
CREATE VIEW store_type_summary AS
SELECT 
    ds.store_type,
    SUM(op.product_quantity * dp.sale_price) AS total_sales,
    COUNT(op.order_date) AS order_count,
    (SUM(op.product_quantity * dp.sale_price) / SUM(SUM(op.product_quantity * dp.sale_price)) OVER ()) AS percentage_of_total_sales
FROM 
    orders op
INNER JOIN 
    dim_product dp ON dp.product_code = op.product_code
INNER JOIN 
    dim_store ds ON ds.store_code = op.store_code
GROUP BY 
    ds.store_type;

SELECT * FROM store_type_summary;