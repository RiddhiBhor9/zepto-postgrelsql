drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
Category VARCHAR(250),
namee VARCHAR(250),
mrp VARCHAR(250),
discountPercent VARCHAR(250),
availableQuantity VARCHAR(250),
discountedSellingPrice VARCHAR(250),
weightInGms VARCHAR(250),
outOfStock VARCHAR(250),
quantity VARCHAR(250)

);
--data exploration
Select count  (*) from zepto;

--sample data
select * from zepto
limit 10;

--num values
select * from zepto
WHERE namee IS NULL
or
Category IS NULL
or
mrp IS NULL
or
discountPercent IS NULL
or
availableQuantity IS NULL
or
discountedSellingPrice IS NULL
or
weightInGms IS NULL
or
outofstock IS NULL
or
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;


--product name present multiple times
SELECT outOfStock, COUNT(*)
FROM zepto
GROUP BY outOfStock;

--. Average MRP per category
SELECT category, AVG(mrp)
FROM zepto
GROUP BY category;

--. Highest priced product
SELECT namee, MAX(mrp) FROM zepto GROUP BY namee;



--. Discount distribution
SELECT discountPercent, COUNT(*)
FROM zepto
GROUP BY discountPercent
ORDER BY discountPercent;

--. Out of stock count
SELECT outOfStock, COUNT(*)
FROM zepto
GROUP BY outOfStock;

--. Avg discounted price by category
SELECT category, AVG(discountedSellingPrice)
FROM zepto
GROUP BY category;

--. Top 10 expensive products
SELECT namee, mrp
FROM zepto
ORDER BY mrp DESC
LIMIT 10;

--. Cheapest products
SELECT namee, mrp
FROM zepto
ORDER BY mrp ASC
LIMIT 10;

--. Total inventory quantity
SELECT SUM(quantity::INTEGER)
FROM zepto;

--11. Category-wise inventory
SELECT category, SUM(quantity::INTEGER)
FROM zepto
GROUP BY category;

--. Avg weight per category
SELECT category, AVG(weightInGms::INTEGER)
FROM zepto
GROUP BY category;

--. Products with high discount (>30%)
SELECT * FROM zepto
WHERE discountPercent > 30;

--. Price vs Discount relationship
SELECT mrp, discountPercent FROM zepto;


--. Count of available products
SELECT COUNT(*)
FROM zepto
WHERE outOfStock = false;

--. Category with highest avg discount
SELECT category, AVG(discountPercent)
FROM zepto
GROUP BY category
ORDER BY AVG(discountPercent) DESC
LIMIT 1;

--. Total revenue potential
SELECT SUM(discountedSellingPrice * quantity::INTEGER)
FROM zepto;

--. Top categories by revenue
SELECT category, 
       SUM(discountedSellingPrice * quantity::INTEGER) AS revenue
FROM zepto
GROUP BY category;

--. Products with low stock (<10)
SELECT *
FROM zepto
WHERE CAST(quantity AS INTEGER) < 10;

-- Avg price difference (MRP - Selling)
ALTER TABLE zepto
ALTER COLUMN mrp TYPE NUMERIC USING mrp::NUMERIC,
ALTER COLUMN discountedSellingPrice TYPE NUMERIC USING discountedSellingPrice::NUMERIC;

-- Most common weight
SELECT weightInGms, COUNT(*)
FROM zepto
GROUP BY weightInGms
ORDER BY COUNT(*) DESC
LIMIT 5;

--. Category-wise out of stock
ALTER TABLE zepto
ALTER COLUMN outOfStock TYPE BOOLEAN
USING outOfStock::BOOLEAN;

--. Products with zero discount
SELECT * FROM zepto
WHERE discountPercent = 0;

-- Rank products by price
SELECT namee, mrp,
RANK() OVER (ORDER BY mrp DESC)
FROM zepto;

--. Running total of revenue
ALTER TABLE zepto
ALTER COLUMN discountPercent TYPE INTEGER
USING discountPercent::INTEGER;