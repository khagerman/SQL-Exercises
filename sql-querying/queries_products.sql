-- Comments in SQL Start with dash-dash --
-- Add a product to the table with the name of “chair”, price of 44.00, and can_be_returned of false.
-- Add a product to the table with the name of “stool”, price of 25.99, and can_be_returned of true.
-- Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of false.
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00,false);
INSERT 0 1
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99,true);
INSERT 0 1
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00,false);
INSERT 0 1

-- Display all of the rows and columns in the table.
                      
products_db=# SELECT * from products;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t
  3 | table |   124 | f

-- Display all of the names of the products.
products_db=# SELECT name FROM products;                                         name  
-------
 chair
 stool
 table

-- Display all of the names and prices of the products.
SELECT name,price  FROM products;
 name  | price 
-------+-------
 chair |    44
 stool | 25.99
 table |   124
(3 rows)

-- Add a new product - make up whatever you would like!
INSERT INTO products (name, price, can_be_returned) VALUES ('dog', 4444444444444.00,false);

-- Display only the products that can_be_returned.
products_db=# SELECT name  FROM products WHERE can_be_returned=true;                name  
-------
 stool
(1 row)

-- Display only the products that have a price less than 44.00.
 name  
-------
 stool
(1 row)

-- Display only the products that have a price in between 22.50 and 99.99.
SELECT name FROM products WHERE price >  22.50 AND price < 99.99;
 name  
-------
 chair
 stool
(2 rows)

-- There’s a sale going on: Everything is $20 off! Update the database accordingly.
UPDATE products SET price = price-20
 id | name  |       price       | can_be_returned 
----+-------+-------------------+-----------------
  1 | chair |                24 | f
  2 | stool | 5.989999999999998 | t
  3 | table |               104 | f
  4 | dog   |     4444444444424 | f
-- Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.
 DELETE FROM products WHERE price < 25         

-- And now the sale is over. For the remaining products, increase their price by $20.
UPDATE products SET price = price+20      
-- There is a new company policy: everything is returnable. Update the database accordingly.
UPDATE products SET can_be_returned = true      
 id | name  |     price     | can_be_returned 
----+-------+---------------+-----------------
  3 | table |           124 | t
  4 | dog   | 4444444444444 | t
