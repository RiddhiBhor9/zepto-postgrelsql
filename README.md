# zepto-postgrelsql
# 🛒 Zepto Product Data Analysis (PostgreSQL Project)

## 📌 Project Overview

This project focuses on analyzing a Zepto product dataset using PostgreSQL. The dataset contains product details such as category, price, discount, stock availability, and quantity. The goal is to extract meaningful business insights using SQL queries.

---

## 🗂️ Dataset Description

The dataset includes the following columns:

* `Category` – Product category
* `namee` – Product name
* `mrp` – Maximum retail price
* `discountPercent` – Discount percentage
* `availableQuantity` – Available stock
* `discountedSellingPrice` – Final selling price
* `weightInGms` – Product weight
* `outOfStock` – Stock availability (Yes/No or True/False)
* `quantity` – Quantity sold/available

---

## ⚠️ Data Cleaning

Since the dataset was imported from CSV, most columns were stored as `VARCHAR`.
To perform calculations, columns were converted into appropriate data types:

* Prices → `NUMERIC`
* Quantity → `INTEGER`
* Stock status → `BOOLEAN`

---

## 🛠️ Technologies Used

* PostgreSQL
* SQL (Aggregation, Window Functions, Filtering)
* Optional: Excel / Power BI for visualization

---

## 📊 Key Analysis Performed

* Total number of products
* Category-wise product distribution
* Average price and discount analysis
* Stock availability insights
* Revenue estimation
* Top and least expensive products
* High discount product identification

---

## 📈 Sample Queries

### 1. Category-wise product count

```sql
SELECT category, COUNT(*)
FROM zepto
GROUP BY category;
```

### 2. Total revenue estimation

```sql
SELECT SUM(discountedSellingPrice * quantity)
FROM zepto;
```

### 3. Out-of-stock products

```sql
SELECT category, COUNT(*)
FROM zepto
WHERE outOfStock = true
GROUP BY category;
```

---

## 📉 Insights Gained

* Certain categories dominate product listings
* Discounts significantly impact selling price
* Some categories have higher out-of-stock rates
* Revenue is concentrated in specific product groups

---

## 🚀 How to Run the Project

1. Import CSV into PostgreSQL
2. Create table and define columns
3. Clean data (convert VARCHAR to proper types)
4. Run analysis queries
5. Export results for visualization (optional)

---

## 📌 Conclusion

This project demonstrates how raw data can be transformed into meaningful insights using SQL. It also highlights the importance of proper data types and cleaning in data analysis workflows.

---

## 🙌 Future Improvements

* Build interactive dashboard (Power BI / Tableau)
* Automate data cleaning process
* Add time-based analysis if dataset expands

---
