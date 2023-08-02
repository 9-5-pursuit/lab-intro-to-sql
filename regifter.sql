-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean

CREATE TABLE gifts (id serial, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
-- 
\dt
--          List of relations
--  Schema | Name  | Type  |   Owner
-- --------+-------+-------+-----------
--  public | gifts | table | ambarimar
-- (1 row)
-- 
\echo Alter the table so that the column value is changed to price 
-- 
alter table gifts rename value to price;
-- ALTER TABLE


-- 
\echo Insert a peach candle, given by 'Santa' thats price is 9 and has been previously regifted
-- 
INSERT INTO gifts (gift, giver, price, previously_regifted) VALUES ('peach candle', 'Santa', 9, true);

--
\echo Query for all the columns in your gifts table
-- 

SELECT * FROM gifts;
--  id |     gift     | giver | price | previously_regifted
-- ----+--------------+-------+-------+---------------------
--   1 | peach candle | Santa |     9 | t
-- (1 row)

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES ('peach candle', 'Santa', '9', TRUE), ('cinnamon candle', 'Nick', '19', TRUE), ('soap on a rope', 'Rudolf', '29', FALSE), ('potpurri', 'Elf on the Shelf', '39', TRUE), ('mango candle', 'The Boss', '49', FALSE);

-- SELECT * FROM gifts;
--  id |      gift       |      giver       | price | previously_regifted
-- ----+-----------------+------------------+-------+---------------------
--   1 | peach candle    | Santa            |     9 | t
--   4 | peach candle    | Santa            |     9 | t
--   5 | cinnamon candle | Nick             |    19 | t
--   6 | soap on a rope  | Rudolf           |    29 | f
--   7 | potpurri        | Elf on the Shelf |    39 | t
--   8 | mango candle    | The Boss         |    49 | f
-- (6 rows)

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

INSERT INTO gifts (gift, giver, price, previously_regifted) VALUES ('pine candle', 'Santa', '10', FALSE), ('cookies', 'Nick', '19', FALSE), ('Bath & Body Works Set', 'Rudolf', '29', FALSE), ('Socks', 'Mom', '39', FALSE), ('Gift Card', 'The Boss', '55', FALSE);

--  id |         gift          |      giver       | price | previously_regifted
-- ----+-----------------------+------------------+-------+---------------------
--   1 | peach candle          | Santa            |     9 | t
--   4 | peach candle          | Santa            |     9 | t
--   5 | cinnamon candle       | Nick             |    19 | t
--   6 | soap on a rope        | Rudolf           |    29 | f
--   7 | potpurri              | Elf on the Shelf |    39 | t
--   8 | mango candle          | The Boss         |    49 | f
--   9 | pine candle           | Santa            |    10 | f
--  10 | cookies               | Nick             |    19 | f
--  11 | Bath & Body Works Set | Rudolf           |    29 | f
--  12 | Socks                 | Mom              |    39 | f
--  13 | Gift Card             | The Boss         |    55 | f
-- (11 rows)

--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts WHERE price >= 20;
--  id |         gift          |      giver       | price | previously_regifted
-- ----+-----------------------+------------------+-------+---------------------
--   6 | soap on a rope        | Rudolf           |    29 | f
--   7 | potpurri              | Elf on the Shelf |    39 | t
--   8 | mango candle          | The Boss         |    49 | f
--  11 | Bath & Body Works Set | Rudolf           |    29 | f
--  12 | Socks                 | Mom              |    39 | f
--  13 | Gift Card             | The Boss         |    55 | f
-- (6 rows)

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT gift FROM gifts WHERE gift like '%candle%';
--       gift
-- -----------------
--  peach candle
--  peach candle
--  cinnamon candle
--  mango candle
--  pine candle
-- (5 rows)

--
\echo Query for every gift whose giver is Santa OR price is greater than 30
--
SELECT * FROM gifts WHERE giver LIKE 'Santa' OR price > 30;
--  id |     gift     |      giver       | price | previously_regifted
-- ----+--------------+------------------+-------+---------------------
--   1 | peach candle | Santa            |     9 | t
--   4 | peach candle | Santa            |     9 | t
--   7 | potpurri     | Elf on the Shelf |    39 | t
--   8 | mango candle | The Boss         |    49 | f
--   9 | pine candle  | Santa            |    10 | f
--  12 | Socks        | Mom              |    39 | f
--  13 | Gift Card    | The Boss         |    55 | f
-- (7 rows)

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gifts WHERE giver != 'Santa';
--  id |         gift          |      giver       | price | previously_regifted
-- ----+-----------------------+------------------+-------+---------------------
--   5 | cinnamon candle       | Nick             |    19 | t
--   6 | soap on a rope        | Rudolf           |    29 | f
--   7 | potpurri              | Elf on the Shelf |    39 | t
--   8 | mango candle          | The Boss         |    49 | f
--  10 | cookies               | Nick             |    19 | f
--  11 | Bath & Body Works Set | Rudolf           |    29 | f
--  12 | Socks                 | Mom              |    39 | f
--  13 | Gift Card             | The Boss         |    55 | f
-- (8 rows)

--
\echo Update the second gift to have a price of 2999
-- 

UPDATE gifts SET price = 2999 WHERE id = 4;

SELECT * FROM gifts;
--  id |         gift          |      giver       | price | previously_regifted
-- ----+-----------------------+------------------+-------+---------------------
--   1 | peach candle          | Santa            |     9 | t
--   5 | cinnamon candle       | Nick             |    19 | t
--   6 | soap on a rope        | Rudolf           |    29 | f
--   7 | potpurri              | Elf on the Shelf |    39 | t
--   8 | mango candle          | The Boss         |    49 | f
--   9 | pine candle           | Santa            |    10 | f
--  10 | cookies               | Nick             |    19 | f
--  11 | Bath & Body Works Set | Rudolf           |    29 | f
--  12 | Socks                 | Mom              |    39 | f
--  13 | Gift Card             | The Boss         |    55 | f
--   4 | peach candle          | Santa            |  2999 | t
-- (11 rows)
-- --
\echo Query for the updated item
--
SELECT * FROM gifts WHERE price = 2999;
--  id |     gift     | giver | price | previously_regifted
-- ----+--------------+-------+-------+---------------------
--   4 | peach candle | Santa |  2999 | t
-- (1 row)

--
\echo Delete all the gifts from Santa and return the 'price' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;
--  price |     gift
-- -------+--------------
--      9 | peach candle
--     10 | pine candle
--   2999 | peach candle
-- (3 rows)

-- DELETE 3

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;
--  id |         gift          |      giver       | price | previously_regifted
-- ----+-----------------------+------------------+-------+---------------------
--   5 | cinnamon candle       | Nick             |    19 | t
--   6 | soap on a rope        | Rudolf           |    29 | f
--   7 | potpurri              | Elf on the Shelf |    39 | t
--   8 | mango candle          | The Boss         |    49 | f
--  10 | cookies               | Nick             |    19 | f
--  11 | Bath & Body Works Set | Rudolf           |    29 | f
--  12 | Socks                 | Mom              |    39 | f
--  13 | Gift Card             | The Boss         |    55 | f
-- (8 rows)

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(gift) FROM gifts WHERE gift LIKE '%candle%';
--  count
-- -------
--      2
-- (1 row)

--
\echo Get the AVEREAGE price from all the gifts
--

SELECT AVG(price) FROM gifts;
-- 
-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT gifts FROM gifts ORDER BY price ASC LIMIT 3 OFFSET 2;
--                   gifts
-- ------------------------------------------
--  (11,"Bath & Body Works Set",Rudolf,29,f)
--  (6,"soap on a rope",Rudolf,29,f)
--  (7,potpurri,"Elf on the Shelf",39,t)
-- (3 rows)
--
-- finish
--
DROP TABLE IF EXISTS gifts;
