# DDL & Data Constraints
> Environment Setup, Domains & Table Creation

## Environment Initialization
Run the following Docker commands to set up the PostgreSQL environment:
```bash
docker run -d --name sql_class_pg -e POSTGRES_PASSWORD=postgres -p 5433:5432 postgres:15
docker exec -it sql_class_pg psql -U postgres
```

## Creating a Database
```sql
CREATE DATABASE sql_class_1_db;
-- CREATE DATABASE web_dev_cohort_db;
```

## Basic Table Creation
Let's model the "Web Dev Cohort 2026" students and see different data types and constraints in action:

```sql
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY, -- Auto-incrementing ID, acts as Primary Key
    
    first_name VARCHAR(50) NOT NULL, -- Cannot be empty
    last_name VARCHAR(50), -- Can be null
    
    email VARCHAR(100) UNIQUE NOT NULL, -- Must be unique and present
    phone_number CHAR(10) UNIQUE, -- Fixed length string
    
    -- CHECK CONSTRAINT: Ensure age is reasonable
    age INT CHECK (age > 12),
    
    -- DEFAULT and CHECK: Track student status
    current_status VARCHAR(20) DEFAULT 'active' 
                   CHECK (current_status IN ('active', 'graduated', 'dropped_out', 'on_leave')),
    
    masterji_handle VARCHAR(50) UNIQUE,
    has_joined_masterji BOOLEAN DEFAULT FALSE,
    
    -- NUMERIC/DECIMAL: Aggregate assignment score percentage
    current_score NUMERIC(5, 2) CHECK (current_score >= 0 AND current_score <= 100),
    
    enrollment_date DATE DEFAULT CURRENT_DATE
);
```

## Inserting Data Reference
```sql
INSERT INTO students (first_name, last_name, email, phone_number, age, current_status, masterji_handle, has_joined_masterji, current_score)
VALUES ('John', 'Doe', 'john.doe@example.com', '9876543210', 22, 'active', '@john_codes', TRUE, 85.50);
```

## Altering Tables (DDL isn't just CREATE)
Often, you will need to add new columns to existing structures:
```sql
ALTER TABLE students 
ADD COLUMN batch_name VARCHAR(50) DEFAULT 'Web Dev 2026';

-- Example to add constraints to existing structures:
-- ALTER TABLE submissions ADD CONSTRAINT check_link_format CHECK (submission_link LIKE 'http%');
```

---

## 📌 Concept Summary
* **PRIMARY KEY:** Uniquely identifies rows (e.g., `student_id`).
* **FOREIGN KEY:** Links tables together (e.g., matching IDs across tables).
* **CHECK:** Validates mathematical or list-based data rules (e.g., `age > 12`, `status IN (...)`).
* **UNIQUE:** Ensures no duplicated values (e.g., `email`, `masterji_handle`).
* **NOT NULL:** Marks fields as mandatory.
* **DEFAULT:** Provides automatic fallback values if none are provided during insert.
* **Data Types Used:** `INT`, `VARCHAR`, `CHAR`, `BOOLEAN`, `DATE`, `TIMESTAMP`, `NUMERIC`.
