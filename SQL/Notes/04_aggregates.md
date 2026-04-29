# Aggregations & Group By
> Generating calculated insights and summaries from raw data.

## 1. Basic Aggregations
Standard mathematical aggregates applied over an entire column.

```sql
-- COUNT: How many total records do we have?
SELECT COUNT(*) AS total_transactions FROM smart_watch_sales;

-- SUM: What is the total combined metrics?
SELECT SUM(units_sold * price_per_unit) AS total_revenue FROM smart_watch_sales;

-- AVG: What is the average value?
SELECT AVG(price_per_unit) AS avg_watch_price FROM smart_watch_sales;

-- MIN / MAX: Identify extremes
SELECT MIN(price_per_unit) AS cheapest, MAX(price_per_unit) AS costliest FROM smart_watch_sales;
```

## 2. GROUP BY (The Data Powerhouse)
`GROUP BY` groups rows that have the same values into summary rows. Often executed alongside aggregate functions (`COUNT, MAX, MIN, SUM, AVG`).

**Sales by Brand ("Who has majority market share?")**
```sql
SELECT brand, SUM(units_sold) AS total_units_sold
FROM smart_watch_sales
GROUP BY brand
ORDER BY total_units_sold DESC;
```

**Revenue by Region ("Where are the rich people?")**
```sql
SELECT city, SUM(units_sold * price_per_unit) AS city_revenue
FROM smart_watch_sales
GROUP BY city
ORDER BY city_revenue DESC;
```

**Multi-Level Grouping (Brand sales within each City)**
```sql
SELECT city, brand, SUM(units_sold) AS units
FROM smart_watch_sales
GROUP BY city, brand
ORDER BY city ASC, units DESC;
```

## 3. HAVING (Filtering Created Groups)
> **Rule of Thumb:** You cannot use `WHERE` for aggregate checks (like `SUM(units)`), because `WHERE` filters *rows* before grouping. `HAVING` filters *groups* after aggregation.

**Show brands that have sold more than 20 units total:**
```sql
SELECT brand, SUM(units_sold) AS total_units, MAX(price_per_unit)
FROM smart_watch_sales
GROUP BY brand
HAVING SUM(units_sold) > 20;   -- Condition evaluated after the grouping sum
```

**Show cities with an average sale price above 10,000 (Premium Markets):**
```sql
SELECT city, AVG(price_per_unit) AS avg_price
FROM smart_watch_sales
GROUP BY city
HAVING AVG(price_per_unit) > 10000;
```
