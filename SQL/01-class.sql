-- serial add automatic number on each data id like 
-- row insert --> student_id 1
-- row insert --> student_id 2
-- row insert --> student_id 3
-- Primary Key is a unique key added on each student data , so that no one can get wrong data , it cannot be same , it will be always unique 
CREATE TABLE students (
    --if you want to write in camel case or snake case , use it in double class like "Students"
    student_id SERIAL PRIMARY KEY,
    -- serial auto incremented integer , Primary key is unique + never be null
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45),
    email VARCHAR(322) UNIQUE NOT NULL,
    phone_number VARCHAR(10) UNIQUE,
    -- don`t add Number(10) because it take 4000 bytes vs 10 bytes
    country_code VARCHAR(4),
    age INT CHECK (age > 12),
    current_status VARCHAR(20) DEFAULT 'active' CHECK (
        current_status IN ('active', 'graduated', 'dropped_out')
    ),
    masterji_handle VARCHAR(50) UNIQUE,
    --masterji username
    has_joined_masterji BOOLEAN DEFAULT FALSE,
    current_score INT DEFAULT 0 CHECK (
        current_score >= 0
        AND current_score <= 100
    ),
    enrollment_date DATE DEFAULT CURRENT_DATE --This is UTC time when the record is inserted into the table (2024-06-25 UTC)
);

ALTER TABLE students --Alter table is used to change the structure of the table after it has been created or for adding constraints, columns, indexes, etc.
ADD COLUMN batch_name VARCHAR(50) DEFAULT 'WEB DEV COHORT 2026';

-- DROP TABLE students; 
--This command is used to delete the entire table and all of its data permanently from the database. Use with caution!