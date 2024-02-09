SELECT
    dp.category,
    SUM(op.product_quantity * (dp.sale_price - dp.cost_price)) AS total_profit
FROM
    orders op
INNER JOIN
    dim_product dp ON dp.product_code = op.product_code
INNER JOIN
    dim_store ds ON ds.store_code = op.store_code
INNER JOIN
    dim_date dd ON dd.date = op.order_date
WHERE
    ds.country_region = 'Wiltshire'
    AND dd.year = 2021
GROUP BY
    dp.category
ORDER BY
    total_profit DESC
LIMIT 1;