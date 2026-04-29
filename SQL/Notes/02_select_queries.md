# Select Queries (DQL)
> Extracting and Filtering Data efficiently.

## 1. Select Basics
The `SELECT` statement helps display data. Avoid `SELECT *` on massive tables!

```sql
-- Select Everything
SELECT * FROM ipl_players;

-- Select Specific Columns (Recommended for performance)
SELECT name, nickname, team, auction_price_crores FROM ipl_players;
```

## 2. Filtering with `WHERE` Clause

### Exact Matches
```sql
SELECT * FROM ipl_players WHERE team = 'Mumbai Indians';
```

### Comparison Operators (`>`, `<`, `<=`, `>=`)
```sql
SELECT name, nickname, auction_price_crores FROM ipl_players WHERE auction_price_crores > 10.0;
```

### Logic Operators (`AND`, `OR`)
```sql
SELECT * FROM ipl_players WHERE role = 'All-Rounder' AND wickets_taken > 10;
SELECT * FROM ipl_players WHERE team = 'CSK' OR team = 'RCB';
```

### Pattern Matching (`LIKE`)
`%` matches any sequence. `_` matches EXACTLY ONE character.
```sql
-- Starts with R
SELECT * FROM ipl_players WHERE name LIKE 'R%';

-- Second letter is 'a'
SELECT * FROM ipl_players WHERE name LIKE '_a%';
```

### Range (`BETWEEN`)
```sql
SELECT * FROM ipl_players WHERE auction_price_crores BETWEEN 5 AND 12;
```

### NULL Handling (`IS NULL` / `IS NOT NULL`)
```sql
-- Find players without a team
SELECT * FROM ipl_players WHERE team IS NULL;
```

### Exclusions (`!=`, `<>`, `NOT IN`)
```sql
SELECT * FROM ipl_players WHERE team != 'Mumbai Indians';
SELECT * FROM ipl_players WHERE team NOT IN ('Mumbai Indians', 'CSK', 'RCB');
```

## 3. Sorting (`ORDER BY`)
You can sort results dynamically:
```sql
-- Highest run scorers (Descending Order)
SELECT name, nickname, runs_scored FROM ipl_players ORDER BY runs_scored DESC;

-- Lowest Price first (Ascending Order)
SELECT name, nickname, auction_price_crores FROM ipl_players ORDER BY auction_price_crores ASC;

-- Multiple Sort Options (Team name A-Z, then High to Low Price inside team)
SELECT team, name, auction_price_crores FROM ipl_players ORDER BY team ASC, auction_price_crores DESC;
```

## 4. Limit & Offset (Pagination)
Used typically for UIs when creating "Next Page" behavior:
```sql
-- Top 3 Expensive (Page 1)
SELECT name, auction_price_crores FROM ipl_players ORDER BY auction_price_crores DESC LIMIT 3;

-- Next 3 Expensive (Page 2)
SELECT name, auction_price_crores FROM ipl_players ORDER BY auction_price_crores DESC LIMIT 3 OFFSET 3;
```

## 5. Aggregates, Math & Aliases
You can perform mathematical operations directly inside the `SELECT` statment and rename the output (`AS`).
```sql
-- Math
SELECT name, nickname, auction_price_crores, (auction_price_crores * 100) AS price_in_lakhs FROM ipl_players;

-- Complex expressions
SELECT name, nickname, (runs_scored + (wickets_taken * 25)) AS total_impact FROM ipl_players ORDER BY total_impact DESC;

-- Distinct Values (Remove Duplicates from result mapping)
SELECT DISTINCT role FROM ipl_players;
```
