use campus_eats_fall2020;
-- select person.person_name as Driver, SUM(rating.driver_Rating)
-- from campus_eats_fall2020.person, campus_eats_fall2020.rating, campus_eats_fall2020.order
-- where campus_eats_fall2020.person.person_id = campus_eats_fall2020.order.person_id;


-- SELECT p.person_name as Driver
-- from campus_eats_fall2020.person p
-- 	inner JOIN campus_eats_fall2020.order o
-- 	ON o.person_id = p.person_id
-- 		inner JOIN campus_eats_fall2020.rating r
--         ON o.order_id = r.order_id
--         inner JOIN campus_eats_fall2020.driver d
--         ON o.driver_id = d.driver_id;


-- Displays all driver ratings, the driver names, all ratings and comments for the driver.
SELECT p.person_name as Driver, r.driver_Rating, r.comment
from person p
	inner JOIN student s
	ON s.person_id = p.person_id
	inner JOIN driver d
	ON s.student_id = d.student_id
	inner JOIN campus_eats_fall2020.order o
	ON o.driver_id = d.driver_id
	inner JOIN rating r
	ON o.order_id = r.order_id
    order by r.driver_Rating;
    
-- Searches for specific restaurant ratings. Displays restaurant name, rating, and comments.
SELECT res.restaurant_name as Restaurant, r.resturant_Rating, r.comment
from campus_eats_fall2020.restaurant res
	INNER JOIN campus_eats_fall2020.order o
	ON res.restaurant_id = o.restaurant_id
	INNER JOIN campus_eats_fall2020.rating r
	ON o.order_id = r.order_id
	order by r.resturant_Rating;
    
-- Inner join show only resturant orders with ratings, left joins show all resturant ratings with or without orders
-- Searches for specific restaurant ratings. Displays restaurant name, rating, and comments.
SELECT res.restaurant_name as Restaurant, r.resturant_Rating, r.comment
from campus_eats_fall2020.restaurant res
	INNER JOIN campus_eats_fall2020.order o
	ON res.restaurant_id = o.restaurant_id
	INNER JOIN campus_eats_fall2020.rating r
	ON o.order_id = r.order_id
    WHERE res.restaurant_name = "Rath Ltd"
    order by r.resturant_Rating;

    
-- Prototype, this query is a work in progress, the goal is to do the following:
-- Searches for all restaurant ratings. Displays restaurant name, rating, and comments.
SELECT res.restaurant_name as Resturant, r.resturant_Rating, r.comment
FROM
	campus_eats_fall2020.rating as r
LEFT JOIN campus_eats_fall2020.order as o
	ON r.order_id = o.order_id
LEFT JOIN campus_eats_fall2020.restaurant as res
	ON o.restaurant_id = res.restaurant_id
group by res.restaurant_name;
    
-- Complex Query
-- Selects all drivers, displays the driver id, name, and
-- average of all ratings, max rating and min rating.
SELECT
	o1.driver_id,
    p1.person_name AS Driver_Name,
    AVG(r1.driver_rating) AS AvgRating,
    MIN(r1.driver_rating)AS MinRating,
    MAX(r1.driver_rating) AS MaxRating
FROM
	campus_eats_fall2020.rating as r1
LEFT JOIN campus_eats_fall2020.order as o1
	ON r1.order_id = o1.order_id
LEFT JOIN campus_eats_fall2020.driver as d1
	ON o1.driver_id = d1.driver_id
LEFT JOIN campus_eats_fall2020.student as s1
	ON d1.student_id = s1.student_id
LEFT JOIN campus_eats_fall2020.person as p1
	ON s1.person_id = p1.person_id
group by o1.driver_id;

-- Complex Query
-- Selects all restaurants, and drivers displays the names,
-- ratings, and comments.
SELECT 
	res.restaurant_name as Resturant,
	p1.person_name AS Driver_Name,
	r.resturant_Rating, 
    r.driver_Rating,
    r.comment
FROM campus_eats_fall2020.restaurant res
INNER JOIN campus_eats_fall2020.order o
	ON res.restaurant_id = o.restaurant_id
INNER JOIN campus_eats_fall2020.rating r
	ON o.order_id = r.order_id
LEFT JOIN campus_eats_fall2020.driver as d1
	ON o.driver_id = d1.driver_id
LEFT JOIN campus_eats_fall2020.student as s1
	ON d1.student_id = s1.student_id
LEFT JOIN campus_eats_fall2020.person as p1
    ON s1.person_id = p1.person_id
WHERE res.restaurant_name = restaurant_name;


-- Complex Query
-- All Recipts Query
-- This query searches all orders, retrieves the resturant, customer,
-- driver, location , cost, etc. The idea here is to make a list of
-- all recipts for all orders.
SELECT 
	res.restaurant_name as Resturant,
	(SELECT p.person_name
		FROM campus_eats_fall2020.person p
		WHERE o.driver_id = d.driver_id AND d.student_id = s.student_id AND s.person_id = p.person_id) AS Driver_Name,
    (SELECT p.person_name
		FROM campus_eats_fall2020.person AS p
		WHERE p.person_id = o.person_id) AS Customer_Name,
    d1.delivery_time AS Delivery_Date_and_Time,
	(SELECT l.location_address
		FROM campus_eats_fall2020.location AS l
        WHERE o.location_id = l.location_id) as Customer_Address,
    (SELECT l.drop_off_point
		FROM campus_eats_fall2020.location AS l
        WHERE o.location_id = l.location_id) as Delivery_Point,
	CAST(o.total_price AS decimal(10,2)) AS Subtotal,
    CAST(o.delivery_charge AS decimal(10,2)) AS Delivery_charge,
    CAST(o.total_price+o.delivery_charge AS decimal(10,2)) AS Total
FROM campus_eats_fall2020.order as o
LEFT JOIN campus_eats_fall2020.restaurant as res
	ON res.restaurant_id = o.restaurant_id
LEFT JOIN campus_eats_fall2020.driver as d
	ON o.driver_id = d.driver_id
LEFT JOIN campus_eats_fall2020.student as s
	ON d.student_id = s.student_id
LEFT JOIN campus_eats_fall2020.delivery as d1
    ON o.delivery_id = d1.delivery_id;

-- Procedure of recipt query. This procedure takles in an order number as a parameter
-- and uses that order number to find the specific order. It returns all imporiant info
-- needed for a reciept.
DELIMITER //
DROP PROCEDURE IF EXISTS Recipt;
CREATE PROCEDURE Recipt(IN orderID INTEGER)
BEGIN
	SELECT 
		o.order_id AS Order_ID,
		res.restaurant_name AS Resturant,
		(SELECT p.person_name
			FROM campus_eats_fall2020.person p
			WHERE o.driver_id = d.driver_id AND d.student_id = s.student_id AND s.person_id = p.person_id) AS Driver_Name,
		(SELECT p.person_name
			FROM campus_eats_fall2020.person AS p
			WHERE p.person_id = o.person_id) AS Customer_Name,
		d1.delivery_time AS Delivery_Date_and_Time,
		(SELECT l.location_address
			FROM campus_eats_fall2020.location AS l
			WHERE o.location_id = l.location_id) as Customer_Address,
		(SELECT l.drop_off_point
			FROM campus_eats_fall2020.location AS l
			WHERE o.location_id = l.location_id) as Delivery_Point,
		CAST(o.total_price AS decimal(10,2)) AS Subtotal,
		CAST(o.delivery_charge AS decimal(10,2)) AS Delivery_charge,
		CAST(o.total_price+o.delivery_charge AS decimal(10,2)) AS Total
	FROM campus_eats_fall2020.order AS o
	LEFT JOIN campus_eats_fall2020.restaurant AS res
		ON res.restaurant_id = o.restaurant_id
	LEFT JOIN campus_eats_fall2020.driver AS d
		ON o.driver_id = d.driver_id
	LEFT JOIN campus_eats_fall2020.student AS s
		ON d.student_id = s.student_id
	LEFT JOIN campus_eats_fall2020.delivery AS d1
		ON o.delivery_id = d1.delivery_id
	WHERE o.order_id = orderID;
END
//
DELIMITER ;
call recipt(1);



-- Procedure returns all orders for restaurants with ratings.
-- The driver name for that order is listed as well as the ...
-- ... rating itself and comment associated with the order.
DELIMITER //
DROP PROCEDURE IF EXISTS Individual_Restaurant_Rating;
CREATE PROCEDURE Individual_Restaurant_Rating(IN restaurant_name VARCHAR(255))
BEGIN
	SELECT 
		res.restaurant_name AS Resturant,
		p1.person_name AS Driver_Name,
        o.person_id AS PersonID,
		r.resturant_Rating, r.comment
	FROM campus_eats_fall2020.restaurant AS res
	INNER JOIN campus_eats_fall2020.order AS o
		ON res.restaurant_id = o.restaurant_id
	INNER JOIN campus_eats_fall2020.rating AS r
		ON o.order_id = r.order_id
	LEFT JOIN campus_eats_fall2020.driver AS d1
		ON o.driver_id = d1.driver_id
	LEFT JOIN campus_eats_fall2020.student AS s1
		ON d1.student_id = s1.student_id
	LEFT JOIN campus_eats_fall2020.person AS p1
		ON s1.person_id = p1.person_id
	WHERE res.restaurant_name = restaurant_name
    ORDER BY r.resturant_Rating;
END
//
DELIMITER ;
call Individual_Restaurant_Rating('Hamill, Prohaska and Lehner');


-- Procedure returns returns driver id, name, average rating, min rating,
-- and max rating. Filters by the paramaters passed into the procedure.
DELIMITER //
DROP PROCEDURE IF EXISTS Individual_Driver_Rating;
CREATE PROCEDURE Individual_Driver_Rating(IN driver_name VARCHAR(255))
BEGIN
	SELECT
		o1.driver_id,
		p1.person_name AS Driver_Name,
		AVG(r1.driver_rating) AS AvgRating,
		MIN(r1.driver_rating)AS MinRating,
		MAX(r1.driver_rating) AS MaxRating
	FROM campus_eats_fall2020.rating as r1
	LEFT JOIN campus_eats_fall2020.order AS o1
		ON r1.order_id = o1.order_id
	LEFT JOIN campus_eats_fall2020.driver AS d1
		ON o1.driver_id = d1.driver_id
	LEFT JOIN campus_eats_fall2020.student AS s1
		ON d1.student_id = s1.student_id
	LEFT JOIN campus_eats_fall2020.person AS p1
		ON s1.person_id = p1.person_id
	WHERE p1.person_name = driver_name
    ORDER BY r1.driver_Rating;
END
//
DELIMITER ;
call Individual_Driver_Rating('Leopoldo Welch');

-- Returns list of all drivers with their avg rating min rating and max rating
DELIMITER //
DROP PROCEDURE IF EXISTS All_Driver_Ratings;
CREATE PROCEDURE All_Driver_Ratings()
BEGIN
	SELECT
		o1.driver_id,
		p1.person_name AS Driver_Name,
		AVG(r1.driver_rating) AS AvgRating,
		MIN(r1.driver_rating)AS MinRating,
		MAX(r1.driver_rating) AS MaxRating
	FROM campus_eats_fall2020.rating AS r1
	LEFT JOIN campus_eats_fall2020.order AS o1
		ON r1.order_id = o1.order_id
	LEFT JOIN campus_eats_fall2020.driver AS d1
		ON o1.driver_id = d1.driver_id
	LEFT JOIN campus_eats_fall2020.student AS s1
		ON d1.student_id = s1.student_id
	LEFT JOIN campus_eats_fall2020.person AS p1
		ON s1.person_id = p1.person_id
	GROUP BY o1.driver_id
    ORDER BY AvgRating;
END
//
DELIMITER ;
call All_Driver_Ratings();

-- Returns list of all resturants with their avg rating min rating and max rating
DELIMITER //
DROP PROCEDURE IF EXISTS All_Restaurant_Ratings;
CREATE PROCEDURE All_Restaurant_Ratings()
BEGIN
	SELECT
		res.restaurant_id,
		res.restaurant_name,
		AVG(r.resturant_Rating) AS AvgRating,
		MIN(r.resturant_Rating)AS MinRating,
		MAX(r.resturant_Rating) AS MaxRating
	FROM
	campus_eats_fall2020.rating AS r
	LEFT JOIN campus_eats_fall2020.order AS o
		ON r.order_id = o.order_id
	LEFT JOIN campus_eats_fall2020.restaurant AS res
		ON o.restaurant_id = res.restaurant_id
	GROUP BY res.restaurant_name
    ORDER BY AvgRating;
END
//
DELIMITER ;
call All_Restaurant_Ratings();



-- DELIMITER //
-- DROP PROCEDURE IF EXISTS OrderDetails;
-- CREATE PROCEDURE OrderDetails(IN order_num INT)
-- BEGIN
-- 	SELECT 
-- 		o.order_id,
--         o.restaurant_id
-- -- 		r.restaurant_name as Resturant,
-- -- 		o.driver_id as Driver_ID,
-- -- 		p.person_name AS Driver_Name
-- 	FROM campus_eats_fall2020.restaurant as r
-- 	INNER JOIN campus_eats_fall2020.order as o
-- 		ON r.restaurant_id = o.restaurant_id
-- 	LEFT JOIN campus_eats_fall2020.driver as d
-- 		ON o.driver_id = d.driver_id
-- 	LEFT JOIN campus_eats_fall2020.student as s
-- 		ON d.student_id = s.student_id
-- 	LEFT JOIN campus_eats_fall2020.person as p
-- 		ON s.person_id = p.person_id
-- 	WHERE o.order_id = order_num
--     UNION
--     SELECT 
-- 		o.person_id as Customer_ID,
--         p.person_name as Customer_Name
-- 	FROM campus_eats_fall2020.person as p
--     INNER JOIN campus_eats_fall2020.order as o
-- 		ON p.person_id = o.person_id
-- 	WHERE o.order_id = order_num;
-- END
-- //
-- DELIMITER ;