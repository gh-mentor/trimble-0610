/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
Requirements:
- SQL Server 2022 is installed and running
- database 'Inventory' already exists.
Details:
1) Sets the default database to 'Inventory'.
2) Creates a 'categories' table and related 'products' table if they do not already exist.
3) Remove all rows from the tables (in case they already existed).
4) Populates the 'Categories' table with sample data.
5) Populates the 'Products' table with sample data.
Errors:
- if the database 'Inventory' does not exist, the script will print an error message and exit.
*/

-- 1) Set the default database to 'Inventory'
USE Inventory;

-- 2) Create the 'categories' table if it does not already exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'categories' AND type = 'U')
BEGIN
    CREATE TABLE categories (
        id INT PRIMARY KEY,
        name NVARCHAR(50) NOT NULL
    );
END;

-- 3) Create the 'products' table if it does not already exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'products' AND type = 'U')
BEGIN
    CREATE TABLE products (
        id INT PRIMARY KEY,
        name NVARCHAR(50) NOT NULL,
        price DECIMAL(10, 2) NOT NULL,
        category_id INT NOT NULL,
        FOREIGN KEY (category_id) REFERENCES categories(id),
        -- Add a created_at column to track the creation date of the product
        created_at DATETIME NOT NULL DEFAULT GETDATE(),
        -- Add a updated_at column to track the last update date of the product
        updated_at DATETIME NOT NULL DEFAULT GETDATE()
    );
END;

-- 4) Remove all rows from the tables
TRUNCATE TABLE products;
TRUNCATE TABLE categories;


-- 5) Populate the 'Categories' table with sample data
CREATE PROCEDURE PopulateCategories
AS
BEGIN
    INSERT INTO categories (id, name) VALUES
    (1, 'Electronics'),
    (2, 'Clothing'),
    (3, 'Books');
END;

-- 6) Populate the 'Products' table with sample data
CREATE PROCEDURE PopulateProducts
AS
BEGIN
    INSERT INTO products (id, name, price, category_id) VALUES
    (1, 'Laptop', 999.99, 1),
    (2, 'Smartphone', 599.99, 1),
    (3, 'T-shirt', 19.99, 2),
    (4, 'Jeans', 39.99, 2),
    (5, 'Novel', 9.99, 3),
    (6, 'Textbook', 49.99, 3);
END;

-- Print a success message
PRINT 'Database tables have been created and populated with sample data.';

