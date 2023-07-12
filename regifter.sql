-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code
​
--
-- Write your code below each prompt
​
--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean
​ CREATE TABLE gifters (
   id SERIAL,
   gift TEXT,
   giver TEXT,
   value INT,
   previously_regifted BOOLEAN
 ); 
​
-- 
\echo See details of the table you created
-- 
​ \d+ gifters

        Column        |  Type   | Collation | Nullable |               Default               | Storage  | Compression | Stats target | Description
 ---------------------+---------+-----------+----------+-------------------------------------+----------+-------------+--------------+-------------
  id                  | integer |           | not null | nextval('gifters_id_seq'::regclass) | plain    |             |              |
  gift                | text    |           |          |                                     | extended |             |              |
  giver               | text    |           |          |                                     | extended |             |              |
  value               | integer |           |          |                                     | plain    |             |              |
  previously_regifted | boolean |           |          |                                     | plain    |             |              |

​
-- 
\echo Alter the table so that the column value is changed to price 
-- 
​ALTER TABLE gifters DROP COLUMN value;
​ALTER TABLE gifters ADD COLUMN price INT;

                                                              Table "public.gifters"
       Column        |  Type   | Collation | Nullable |               Default               | Storage  | Compression | Stats target | Description
---------------------+---------+-----------+----------+-------------------------------------+----------+-------------+--------------+-------------
 id                  | integer |           | not null | nextval('gifters_id_seq'::regclass) | plain    |             |              |
 gift                | text    |           |          |                                     | extended |             |              |
 giver               | text    |           |          |                                     | extended |             |              |
 previously_regifted | boolean |           |          |                                     | plain    |             |              |
 price               | integer |           |          |                                     | plain    |             |              |
-- 
\echo Insert a peach candle, given by 'Santa' thats price is 9 and has been previously regifted
-- 
​INSERT INTO gifters(gift,giver,previously_regifted, price)
VALUES('peach candle', 'Santa', TRUE, 9);

​INSERT 0 1
--
\echo Query for all the columns in your gifts table
-- 
​SELECT * FROM gifters;
​
 id |     gift     | giver | previously_regifted | price
----+--------------+-------+---------------------+-------
  1 | peach candle | Santa | t                   |     9
(1 row)

--
\echo Uncomment below to insert 5 more gifts
-- 
​
INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;
​
regifter=# SELECT * FROM gifts;
 id |      gift       |      giver       | previously_regifted | price
----+-----------------+------------------+---------------------+-------
  1 | peach candle    | Santa            | t                   |     9
  2 | peach candle    | Santa            | t                   |     9
  3 | cinnamon candle | Nick             | t                   |    19
  4 | soap on a rope  | Rudolf           | f                   |    29
  5 | potpurri        | Elf on the Shelf | t                   |    39
  6 | mango candle    | The Boss         | f                   |    49
(6 rows)
-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
​INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('lavender candle', 'Dasher', '10', FALSE),
('chocolate candle', 'Saint', '20', TRUE),
('conker', 'british', '10', FALSE),
('Biryani candle', 'people', '40', TRUE),
('lychee candle', 'The Boss', '49', FALSE)
;
​
​regifter=# SELECT * FROM gifts;
 id |       gift       |      giver       | previously_regifted | price
----+------------------+------------------+---------------------+-------
  1 | peach candle     | Santa            | t                   |     9
  2 | peach candle     | Santa            | t                   |     9
  3 | cinnamon candle  | Nick             | t                   |    19
  4 | soap on a rope   | Rudolf           | f                   |    29
  5 | potpurri         | Elf on the Shelf | t                   |    39
  6 | mango candle     | The Boss         | f                   |    49
  7 | lavender candle  | Dasher           | f                   |    10
  8 | chocolate candle | Saint            | t                   |    20
  9 | conker           | british          | f                   |    10
 10 | Biryani candle   | people           | t                   |    40
 11 | lychee candle    | The Boss         | f                   |    49
 12 | lavender candle  | Dasher           | f                   |    10
 13 | chocolate candle | Saint            | t                   |    20
 14 | conker           | british          | f                   |    10
 15 | Biryani candle   | people           | t                   |    40
 16 | lychee candle    | The Boss         | f                   |    49
(16 rows)
--
\echo Query for gifts with a price greater than or equal to 20
--
​SELECT * FROM gifts WHERE price >= 20;

regifter=# SELECT * FROM gifts WHERE price >= 20;
 id |       gift       |      giver       | previously_regifted | price
----+------------------+------------------+---------------------+-------
  4 | soap on a rope   | Rudolf           | f                   |    29
  5 | potpurri         | Elf on the Shelf | t                   |    39
  6 | mango candle     | The Boss         | f                   |    49
  8 | chocolate candle | Saint            | t                   |    20
 10 | Biryani candle   | people           | t                   |    40
 11 | lychee candle    | The Boss         | f                   |    49
 13 | chocolate candle | Saint            | t                   |    20
 15 | Biryani candle   | people           | t                   |    40
 16 | lychee candle    | The Boss         | f                   |    49
(9 rows)
​
--
\echo Query for every gift that has the word candle in it, only show the gift column
--
​SELECT
  gift
FROM
  gifts
WHERE
  gift Like '%candle%';
​
--
\echo Query for every gift whose giver is Santa OR price is greater than 30
--
​SELECT
  *
FROM
  gifts
WHERE
  giver = 'Santa' OR price > 30;
​
--
\echo Query for every gift whose giver is NOT Santa
--
​SELECT
  *
FROM
  gifts
WHERE
  giver != 'Santa';
​
--
\echo Update the second gift to have a price of 2999
-- 
​UPDATE gifts SET price = 2999 WHERE id = 2;
​
--
\echo Query for the updated item
--
​SELECT * FROM gifts WHERE id = 2;
​
--
\echo Delete all the gifts from Santa and return the 'price' and 'gift' of the gift you have deleted
--
​DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;
​
--
\echo Query for all the columns in your gifts table one more time
--
​
regifter=# SELECT * FROM gifts;
 id |       gift       |      giver       | previously_regifted | price
----+------------------+------------------+---------------------+-------
  3 | cinnamon candle  | Nick             | t                   |    19
  4 | soap on a rope   | Rudolf           | f                   |    29
  5 | potpurri         | Elf on the Shelf | t                   |    39
  6 | mango candle     | The Boss         | f                   |    49
  7 | lavender candle  | Dasher           | f                   |    10
  8 | chocolate candle | Saint            | t                   |    20
  9 | conker           | british          | f                   |    10
 10 | Biryani candle   | people           | t                   |    40
 11 | lychee candle    | The Boss         | f                   |    49
 12 | lavender candle  | Dasher           | f                   |    10
 13 | chocolate candle | Saint            | t                   |    20
 14 | conker           | british          | f                   |    10
 15 | Biryani candle   | people           | t                   |    40
 16 | lychee candle    | The Boss         | f                   |    49
(14 rows)

​
-- BONUSES
​
--
 \echo Count the total number of gifts that have the word candle in it
-- 
​
​
--
\echo Get the AVEREAGE price from all the gifts
--
​
​
-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
​
--
-- finish
--
DROP TABLE IF EXISTS gifts;