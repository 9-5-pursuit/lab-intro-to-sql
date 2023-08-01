-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
\echo ---------------------- OPENING CREATE A TABLE
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean
-- my code:
CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value INTEGER, previously_regifted BOOLEAN);

\echo ---------------------- CLOSING CREATE A TABLE

-- 
\echo See details of the table you created
-- 
-- my code:
\d gifts;

-- 
\echo Alter the table so that the column value is changed to price 
-- 
-- my code:
ALTER TABLE gifts RENAME COLUMN value TO price;

-- 
\echo Insert a peach candle, given by 'Santa' thats price is 9 and has been previously regifted
-- 
-- my code:
INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES ('peach candle', 'Santa', 9, TRUE);



--
\echo Query for all the columns in your gifts table
-- 
-- my code: 
SELECT * FROM gifts;


--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
-- my code: 
INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('strawberries candle', 'Santa', '10', TRUE),
('vanilla candle', 'Nicole', '15', TRUE),
('car', 'Rudy', '29', FALSE),
('pottery tools', 'Elf', '45', TRUE),
('mango toy', 'Lover', '49', FALSE)

--
\echo Query for gifts with a price greater than or equal to 20
--
--my code: 
SELECT * FROM gifts WHERE price >= 20;


--
\echo Query for every gift that has the word candle in it, only show the gift column
--
--my code: 
SELECT gift FROM gifts WHERE gift LIKE '%candle%';


--
\echo Query for every gift whose giver is Santa OR price is greater than 30
--
--my code: 
SELECT * FROM gifts WHERE giver = 'Santa' OR price > 30;



--
\echo Query for every gift whose giver is NOT Santa
--
--my code: 
SELECT * FROM gifts WHERE giver <> 'Santa';



--
\echo Update the second gift to have a price of 2999
-- 
--my code: 
UPDATE gifts SET price = 2999 WHERE id = 2;



--
\echo Query for the updated item
--
--my code: 
SELECT * FROM gifts WHERE id = 2;


--
\echo Delete all the gifts from Santa and return the 'price' and 'gift' of the gift you have deleted
--
--my code: 
DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;



--
\echo Query for all the columns in your gifts table one more time
--
--my code: 
SELECT * FROM gifts;



-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
-- my code: 
SELECT COUNT(*) FROM gifts WHERE gift LIKE '%candle%';



--
\echo Get the AVEREAGE price from all the gifts
--
-- my code: 
SELECT AVG(price) FROM gifts;


-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
-- my code: 
SELECT * FROM gifts ORDER BY price DESC LIMIT 3 OFFSET 2;


--
-- finish
--
-- DROP TABLE IF EXISTS gifts;
