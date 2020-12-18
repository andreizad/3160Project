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

SELECT p.person_name as Driver, r.driver_Rating, r.comment
from campus_eats_fall2020.person p
	inner JOIN campus_eats_fall2020.student s
	ON s.person_id = p.person_id
	inner JOIN campus_eats_fall2020.driver d
	ON s.student_id = d.student_id
	inner JOIN campus_eats_fall2020.order o
	ON o.driver_id = d.driver_id
	inner JOIN campus_eats_fall2020.rating r
	ON o.order_id = r.order_id
    order by r.resturant_Rating;
    
SELECT res.restaurant_name as Resturant, r.resturant_Rating, r.comment
from campus_eats_fall2020.restaurant res
	inner JOIN campus_eats_fall2020.order o
	ON res.restaurant_id = o.restaurant_id
	inner JOIN campus_eats_fall2020.rating r
	ON o.order_id = r.order_id
    order by r.resturant_Rating;
