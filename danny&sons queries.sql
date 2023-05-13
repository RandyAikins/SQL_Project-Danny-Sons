SELECT * FROM sales_ds LIMIT 3;

-- 1. Number of sales by brand
SELECT brand, COUNT(brand) AS number_of_sales 
FROM sales_ds
GROUP BY brand;

-- 2. Brand with the highest number of sales
SELECT brand, COUNT(brand) AS number_of_sales 
FROM sales_ds
GROUP BY brand
ORDER BY number_of_sales DESC
LIMIT 5;

-- 3. Total sales by brand
SELECT brand, SUM(selling_price) AS total_sales
FROM sales_ds
GROUP BY brand
ORDER BY total_sales DESC;

-- 4. Total sales
SELECT SUM(selling_price) AS total_sales
FROM sales_ds;

-- 5. Average sales by TV brand
SELECT brand, ROUND(AVG(selling_price)) AS average_price
FROM sales_ds
GROUP BY brand
ORDER BY average_price;

-- 6. Total sales between $1m and $1.5m
SELECT brand, SUM(selling_price) AS total_sales
FROM sales_ds
GROUP BY brand
HAVING SUM(selling_price) BETWEEN 1000000 AND 1500000;

-- 7. Total sales above $500k
SELECT brand, SUM(selling_price) AS total_sales
FROM sales_ds
GROUP BY brand
HAVING SUM(selling_price) > 500000;

-- 8. Brand that begins with 'K' and ends 'AK'
SELECT * FROM sales_ds
WHERE brand LIKE 'K%AK';

-- 9. Top 5 selling brand
SELECT brand, SUM(selling_price) AS total_sales 
FROM sales_ds
GROUP BY brand
ORDER BY total_sales DESC
LIMIT 5;

-- 10. Discount
SELECT brand, original_price, selling_price, (selling_price - original_price) AS discount
FROM sales_ds;

-- 11. Discount Percent
SELECT brand, original_price, selling_price, 
CONCAT(ROUND(((original_price::FLOAT - selling_price::FLOAT)/original_price::FLOAT)*100::FLOAT),'%')
AS discount_percent
FROM sales_ds
ORDER BY discount_percent DESC;

-- 12. Total sales by Hisense and Blaupunkt
SELECT brand, SUM(selling_price) AS total_sales
FROM sales_ds
WHERE brand IN ('Hisense', 'Blaupunkt')
GROUP BY brand;

-- 13. Total sales per Panasonic operating systems
SELECT operating_system, SUM(selling_price)
FROM sales_ds
WHERE brand = 'Panasonic'
GROUP BY operating_system;

SELECT operating_system, SUM(selling_price) AS total_sales
FROM sales_ds
GROUP BY operating_system
ORDER BY total_sales DESC;

SELECT operating_system, COUNT(operating_system) 
FROM sales_ds
GROUP BY operating_system
ORDER BY COUNT(operating_system) DESC;


-- 14. Brands with rating above 3.5
SELECT DISTINCT brand, rating
FROM sales_ds
WHERE rating > 3.5
ORDER BY rating DESC;

-- 15. Total sales of brands with rating above 3.5
SELECT SUM(selling_price) AS total_sales
FROM sales_ds
WHERE rating > 3.5;

-- 16. Average rating by brand
SELECT brand, ROUND(AVG(rating),1) AS average_rating
FROM sales_ds
GROUP BY brand
ORDER BY brand;
