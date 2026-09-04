use used_car_sales;
USE used_car_sales;

SHOW TABLES;
DESCRIBE car_sales;
SHOW COLUMNS FROM car_sales;
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
USE used_car_sales;

SELECT COUNT(*) AS current_rows
FROM car_sales;
TRUNCATE TABLE car_sales;
SELECT COUNT(*) AS current_rows
FROM car_sales;
CREATE DATABASE IF NOT EXISTS used_car_sales;

USE used_car_sales;

CREATE TABLE car_sales (
    year INT,
    make VARCHAR(100),
    model VARCHAR(100),
    trim VARCHAR(150),
    body VARCHAR(100),
    transmission VARCHAR(50),
    state VARCHAR(10),
    vehicle_condition DECIMAL(10,2),
    odometer DECIMAL(12,2),
    color VARCHAR(50),
    interior VARCHAR(50),
    seller VARCHAR(255),
    mmr DECIMAL(12,2),
    sellingprice DECIMAL(12,2),
    saledate DATETIME,
    sale_year INT,
    vehicle_age INT,
    price_difference DECIMAL(12,2),
    price_difference_pct DECIMAL(12,2),
    sale_month INT,
    sale_month_name VARCHAR(20),
    sale_quarter VARCHAR(10)
);
DROP TABLE IF EXISTS car_sales;
SHOW TABLES;
CREATE DATABASE IF NOT EXISTS used_car_sales;

USE used_car_sales;

CREATE TABLE car_sales (
    year INT,
    make VARCHAR(100),
    model VARCHAR(100),
    trim VARCHAR(150),
    body VARCHAR(100),
    transmission VARCHAR(50),
    state VARCHAR(10),
    vehicle_condition DECIMAL(10,2),
    odometer DECIMAL(12,2),
    color VARCHAR(50),
    interior VARCHAR(50),
    seller VARCHAR(255),
    mmr DECIMAL(12,2),
    sellingprice DECIMAL(12,2),
    saledate DATETIME,
    sale_year INT,
    vehicle_age INT,
    price_difference DECIMAL(12,2),
    price_difference_pct DECIMAL(12,2),
    sale_month INT,
    sale_month_name VARCHAR(20),
    sale_quarter VARCHAR(10)
);
CREATE DATABASE IF NOT EXISTS used_car_sales;

USE used_car_sales;

DROP TABLE IF EXISTS car_sales;

CREATE TABLE car_sales (
    year INT,
    make VARCHAR(100),
    model VARCHAR(100),
    trim VARCHAR(150),
    body VARCHAR(100),
    transmission VARCHAR(50),
    state VARCHAR(10),
    `condition` DECIMAL(10,2),
    odometer DECIMAL(12,2),
    color VARCHAR(50),
    interior VARCHAR(50),
    seller VARCHAR(255),
    mmr DECIMAL(12,2),
    sellingprice DECIMAL(12,2),
    saledate DATETIME,
    sale_year INT,
    vehicle_age INT,
    price_difference DECIMAL(12,2),
    price_difference_pct DECIMAL(12,2),
    sale_month INT,
    sale_month_name VARCHAR(20),
    sale_quarter VARCHAR(10)
);
USE used_car_sales;

SHOW TABLES;
DESCRIBE car_sales;
USE used_car_sales;

LOAD DATA LOCAL INFILE
'E:/sales data analysis project/used_car_sales_analysis/data/cleaned/car_prices_cleaned.csv'
INTO TABLE car_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SHOW VARIABLES LIKE 'local_infile';
USE used_car_sales;

LOAD DATA LOCAL INFILE
'E:/sales data analysis project/used_car_sales_analysis/data/cleaned/car_prices_cleaned.csv'
INTO TABLE car_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) AS total_rows
FROM car_sales;
SELECT *
FROM car_sales
LIMIT 20;
SELECT *
FROM car_sales;
SELECT
    SUM(year IS NULL) AS year_nulls,
    SUM(make IS NULL) AS make_nulls,
    SUM(model IS NULL) AS model_nulls,
    SUM(trim IS NULL) AS trim_nulls,
    SUM(body IS NULL) AS body_nulls,
    SUM(transmission IS NULL) AS transmission_nulls,
    SUM(state IS NULL) AS state_nulls,
    SUM(`condition` IS NULL) AS condition_nulls,
    SUM(odometer IS NULL) AS odometer_nulls,
    SUM(color IS NULL) AS color_nulls,
    SUM(interior IS NULL) AS interior_nulls,
    SUM(seller IS NULL) AS seller_nulls,
    SUM(mmr IS NULL) AS mmr_nulls,
    SUM(sellingprice IS NULL) AS sellingprice_nulls,
    SUM(saledate IS NULL) AS saledate_nulls,
    SUM(sale_year IS NULL) AS sale_year_nulls,
    SUM(vehicle_age IS NULL) AS vehicle_age_nulls,
    SUM(price_difference IS NULL) AS price_difference_nulls,
    SUM(price_difference_pct IS NULL) AS price_difference_pct_nulls,
    SUM(sale_month IS NULL) AS sale_month_nulls,
    SUM(sale_month_name IS NULL) AS sale_month_name_nulls,
    SUM(sale_quarter IS NULL) AS sale_quarter_nulls
FROM car_sales;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT_WS('|',
        year, make, model, trim, body, transmission,
        state, `condition`, odometer, color, interior,
        seller, mmr, sellingprice, saledate
    )) AS unique_records
FROM car_sales;
SELECT *
FROM car_sales
ORDER BY saledate
LIMIT 10;
SELECT *
FROM car_sales
ORDER BY saledate DESC
LIMIT 10;
SELECT COUNT(*) AS total_sales
FROM car_sales;
SELECT COUNT(*) AS total_rows
FROM car_sales;
SELECT COUNT(*) AS total_sales
FROM car_sales;
SELECT ROUND(SUM(sellingprice), 2) AS total_revenue
FROM car_sales;
SELECT ROUND(AVG(price_difference), 2) AS avg_price_difference
FROM car_sales;
SELECT
    make,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
WHERE make IS NOT NULL
GROUP BY make
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    make,
    COUNT(*) AS total_sales,
    ROUND(SUM(sellingprice), 2) AS total_revenue
FROM car_sales
WHERE make IS NOT NULL
GROUP BY make
ORDER BY total_revenue DESC
LIMIT 10;
SELECT
    state,
    COUNT(*) AS total_sales,
    ROUND(SUM(sellingprice), 2) AS revenue,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
WHERE state IS NOT NULL
GROUP BY state
ORDER BY total_sales DESC;
SELECT
    sale_year,
    sale_quarter,
    COUNT(*) AS total_sales,
    ROUND(SUM(sellingprice), 2) AS revenue
FROM car_sales
GROUP BY sale_year, sale_quarter
ORDER BY sale_year, sale_quarter;
SELECT
    CASE
        WHEN price_difference > 0 THEN 'Above MMR'
        WHEN price_difference < 0 THEN 'Below MMR'
        ELSE 'At MMR'
    END AS price_category,
    COUNT(*) AS total_sales,
    ROUND(AVG(price_difference), 2) AS avg_difference,
    ROUND(AVG(price_difference_pct), 2) AS avg_difference_pct
FROM car_sales
GROUP BY price_category;
SELECT
    `condition`,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
GROUP BY `condition`
ORDER BY `condition`;
SELECT
    make,
    model,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
WHERE make IS NOT NULL
  AND model IS NOT NULL
GROUP BY make, model
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    make,
    model,
    COUNT(*) AS total_sales,
    ROUND(SUM(sellingprice), 2) AS total_revenue
FROM car_sales
WHERE make IS NOT NULL
  AND model IS NOT NULL
GROUP BY make, model
ORDER BY total_revenue DESC
LIMIT 10;
SELECT
    vehicle_age,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
GROUP BY vehicle_age
ORDER BY vehicle_age;
SELECT
    CASE
        WHEN odometer < 30000 THEN 'Under 30K'
        WHEN odometer < 60000 THEN '30K-60K'
        WHEN odometer < 100000 THEN '60K-100K'
        ELSE '100K+'
    END AS mileage_category,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
WHERE odometer IS NOT NULL
GROUP BY mileage_category
ORDER BY avg_selling_price DESC;
SELECT
    CASE
        WHEN sellingprice > mmr THEN 'Above MMR'
        WHEN sellingprice < mmr THEN 'Below MMR'
        ELSE 'At MMR'
    END AS price_category,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price,
    ROUND(AVG(mmr), 2) AS avg_mmr
FROM car_sales
GROUP BY price_category;
SELECT
    seller,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
WHERE seller IS NOT NULL
GROUP BY seller
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    sale_year,
    sale_month,
    sale_month_name,
    COUNT(*) AS total_sales,
    ROUND(SUM(sellingprice), 2) AS revenue
FROM car_sales
GROUP BY sale_year, sale_month, sale_month_name
ORDER BY sale_year, sale_month;
SELECT
    transmission,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price,
    ROUND(SUM(sellingprice), 2) AS total_revenue
FROM car_sales
WHERE transmission IS NOT NULL
GROUP BY transmission
ORDER BY total_sales DESC;
SELECT
    color,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
WHERE color IS NOT NULL
GROUP BY color
ORDER BY total_sales DESC;
SELECT
    `condition`,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price,
    ROUND(AVG(price_difference), 2) AS avg_price_difference
FROM car_sales
WHERE `condition` IS NOT NULL
GROUP BY `condition`
ORDER BY `condition`;
SELECT
    state,
    COUNT(*) AS total_sales,
    ROUND(SUM(sellingprice), 2) AS total_revenue,
    ROUND(AVG(sellingprice), 2) AS avg_selling_price
FROM car_sales
WHERE state IS NOT NULL
GROUP BY state
ORDER BY total_revenue DESC;
SELECT
    make,
    COUNT(*) AS total_sales,
    ROUND(AVG(price_difference), 2) AS avg_price_difference,
    ROUND(AVG(price_difference_pct), 2) AS avg_price_difference_pct
FROM car_sales
WHERE make IS NOT NULL
GROUP BY make
ORDER BY avg_price_difference DESC
LIMIT 10;
SELECT
    year,
    make,
    model,
    trim,
    sellingprice,
    mmr,
    price_difference
FROM car_sales
ORDER BY sellingprice DESC
LIMIT 20;
SELECT
    year,
    make,
    model,
    trim,
    sellingprice,
    mmr,
    price_difference
FROM car_sales
ORDER BY sellingprice ASC
LIMIT 20;



