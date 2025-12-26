-- =========================================
-- Enterprise Sales Analytics - Business KPIs
-- =========================================

-- 1. Total Revenue
SELECT SUM(revenue) AS total_revenue
FROM sales_data;

-- 2. Month-over-Month Revenue
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- 3. Product-wise Performance
SELECT
    product,
    SUM(revenue) AS total_revenue,
    SUM(revenue - cost) AS total_profit
FROM sales_data
GROUP BY product
ORDER BY total_revenue DESC;

-- 4. Region-wise Performance
SELECT
    region,
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;

-- 5. Discount Impact on Profit
SELECT
    product,
    ROUND(AVG(discount), 2) AS avg_discount,
    SUM(revenue - cost) AS total_profit
FROM sales_data
GROUP BY product;
