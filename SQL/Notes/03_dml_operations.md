# DML Operations (Insert, Update, Delete)
> Adding, Modifying, and Removing Records safely.

## 1. INSERT (The 'C' in CRUD)
To put new data into a table:

```sql
-- A. Insert Single Row
INSERT INTO canteen_menu (item_name, category, price) 
VALUES ('Vada Pav', 'Snacks', 15);

-- B. Insert Multiple Rows at Once (Bulk Insert)
INSERT INTO canteen_menu (item_name, category, price) VALUES 
('Masala Chai', 'Beverages', 10),
('Samosa', 'Snacks', 12),
('Rajma Chawal', 'Meals', 60),
('Maggi', 'Snacks', 25),
('Ice Tea', 'Beverages', 40);
```

## 2. UPDATE (The 'U' in CRUD)
> ⚠️ **CRITICAL:** Always use a `WHERE` clause when updating data, otherwise every row will be changed!

```sql
-- Single target update
UPDATE canteen_menu 
SET price = 20 
WHERE item_name = 'Vada Pav';

-- Bulk Update / Mathematical update
UPDATE canteen_menu
SET price = price - 5
WHERE category = 'Beverages';

-- Boolean Status Update
UPDATE canteen_menu
SET is_available = FALSE
WHERE item_name = 'Samosa';
```

## 3. DELETE (The 'D' in CRUD)
> ⚠️ **CRITICAL:** Always use a `WHERE` clause when deleting, otherwise you wipe the entire table clean!

```sql
-- Delete a specific item
DELETE FROM canteen_menu 
WHERE item_name = 'Cold Coffee';

-- Delete based on conditions
DELETE FROM canteen_menu 
WHERE price > 50;

-- ☠️ THE DANGER ZONE ☠️
-- The following command completely rips out all rows of the table:
-- DELETE FROM canteen_menu;
```
