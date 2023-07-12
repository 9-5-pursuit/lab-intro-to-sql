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
create table gifts (id serial primary key, gift VARCHAR(50), giver VARCHAR(50), 
value INT, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
-- 
\d gifts


-- 
\echo Alter the table so that the column value is changed to price 
-- 

alter table gifts rename value to price;


-- 
\echo Insert a peach candle, given by 'Santa' thats price is 9 and has been previously regifted
-- 
insert into gifts (gift, giver, value, previously_regifted) values ('peach', 'Santa', 9, true);

--
\echo Query for all the columns in your gifts table
-- 
select * from gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', 9, TRUE),
('cinnamon candle', 'Nick', 19, TRUE),
('soap on a rope', 'Rudolf', 29, FALSE),
('potpurri', 'Elf on the Shelf', 39, TRUE),
('mango candle', 'The Boss', 49, FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('red candle', 'bill', 2, TRUE),
('lemon', 'shell', 99, FALSE),
('anchor', 'cary', 55, FALSE),
('whale candle', 'waterfall', 77, TRUE),
('flower', 'The New One', 2, TRUE)
;
--
\echo Query for gifts with a price greater than or equal to 20
--
select * from gifts where value >= 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
select gift from gifts where gift ilike '%candle%';

--
\echo Query for every gift whose giver is Santa OR price is greater than 30
--
select gift from gifts where giver = 'Santa' or value > 30;

--
\echo Query for every gift whose giver is NOT Santa
--
select gift from gifts where giver != 'Santa';

--
\echo Update the second gift to have a price of 2999
--

update gifts set price = 2999 where id = 2;


--
\echo Query for the updated item
--
select * from gifts where id = 2;
--
\echo Delete all the gifts from Santa and return the 'price' and 'gift' of the gift you have deleted
--
delete from gifts where giver = 'Santa' returning gift, price;

--
\echo Query for all the columns in your gifts table one more time
--
select * from gifts;
-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
select COUNT(*) from (select * from gifts where gift ilike '%candle%') a;

--
\echo Get the AVERAGE price from all the gifts
--
select AVG(price) avg_price from gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
select * from gifts order by price desc offset 2 limit 3;
--id|gift        |giver           |price|previously_regifted|
----+------------+----------------+-----+-------------------+
-- 9|anchor      |cary            |   55|false              |
-- 6|mango candle|The Boss        |   49|false              |
-- 5|potpurri    |Elf on the Shelf|   39|true               |
--
-- finish
--
DROP TABLE IF EXISTS gifts;