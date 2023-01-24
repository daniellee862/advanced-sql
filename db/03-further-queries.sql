\c nc_flix

\echo '\n The number of films in stock for each genre:'

SELECT COUNT(movie_genres.genre_id)
FROM stock
JOIN movie_genres ON stock.movie_id = movie_genres.movie_id
GROUP BY movie_genres.genre_id
ORDER BY movie_genres.genre_id;

\echo '\n Here is the average rating for films in stock in Newcastle:'

WITH all_stock AS (SELECT movie_id
FROM stock
WHERE store_id IN (SELECT store_id FROM stock WHERE store_id = '3')
)

SELECT AVG(movies.rating) FROM all_stock
JOIN movies ON all_stock.movie_id = movies.movie_id;


\echo '\n Here are all the films made in 90s with above average rating available in Leeds'

WITH all_leeds AS (SELECT movie_id
FROM stock
WHERE store_id IN (SELECT store_id FROM stock WHERE store_id = '1')
)

SELECT movies.title FROM all_leeds
JOIN movies ON all_leeds.movie_id = movies.movie_id
WHERE movies.release_date >= '1990-01-01' AND release_date < '2000-01-01' AND movies.rating > (
    SELECT AVG(movies.rating)
    FROM movies
);

\echo '\n Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:'

with all_films AS (SELECT movie_id
FROM stock
)
SELECT * FROM stock
JOIN movies ON stock.movie_id = movies.movie_id
WHERE movies.release_date IN (SELECT release_date
FROM movies
ORDER BY release_date DESC
LIMIT 5
)
ORDER BY COALESCE(movies.rating, 0) DESC
LIMIT 1;


\echo '\n These are the locations where our customers live which dont have stores:'
SELECT location AS customer_locations_without_stores 
FROM customers
EXCEPT
SELECT city FROM stores;


\echo '\n This store has the highest quantity of stock:'
SELECT store_id, COUNT(store_id) AS store_stock_amount 
from stock
GROUP BY store_id
ORDER BY store_stock_amount DESC
LIMIT 1
;

\echo '\n ...This is a list of all unique customer and store locations'
SELECT city 
from stores
UNION
SELECT location FROM customers;

SELECT location
FROM customers
UNION
SELECT city FROM stores;


\echo '\n ...and this is the most abundant genre in that store:'
/* WITH stock_quantity AS (
    SELECT COUNT(store_id) 
    FROM stock
    )
    SELECT * FROM stock_quantity; */

WITH customer_store_locations AS (
   SELECT city 
   from stores
   INTERSECT
   SELECT location FROM customers
    )
    SELECT  



/* Of the stores which exist in locations that have customers, calculate which store has the largest catalogue of stock. What is the most abundant genre in that store? */
