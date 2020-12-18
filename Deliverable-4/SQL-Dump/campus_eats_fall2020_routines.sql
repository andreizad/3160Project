-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: campus_eats_fall2020
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `person_join`
--

DROP TABLE IF EXISTS `person_join`;
/*!50001 DROP VIEW IF EXISTS `person_join`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `person_join` AS SELECT 
 1 AS `person_id`,
 1 AS `person_name`,
 1 AS `person_email`,
 1 AS `student_id`,
 1 AS `graduation_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `person_student`
--

DROP TABLE IF EXISTS `person_student`;
/*!50001 DROP VIEW IF EXISTS `person_student`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `person_student` AS SELECT 
 1 AS `person_id`,
 1 AS `person_name`,
 1 AS `person_email`,
 1 AS `cell`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `person_join`
--

/*!50001 DROP VIEW IF EXISTS `person_join`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_join` AS select `person`.`person_id` AS `person_id`,`person`.`person_name` AS `person_name`,`person`.`person_email` AS `person_email`,`student`.`student_id` AS `student_id`,`student`.`graduation_year` AS `graduation_year` from (`person` join `student` on((`student`.`person_id` = `person`.`person_id`))) where (`student`.`major` = 'Computer Science') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_student`
--

/*!50001 DROP VIEW IF EXISTS `person_student`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_student` AS select `a`.`person_id` AS `person_id`,`a`.`person_name` AS `person_name`,`a`.`person_email` AS `person_email`,`a`.`cell` AS `cell` from `person` `a` where `a`.`person_id` in (select `student`.`person_id` from `student` where (`student`.`graduation_year` = 2019)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'campus_eats_fall2020'
--

--
-- Dumping routines for database 'campus_eats_fall2020'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_person`(in person_name varchar(300), in email varchar(150), cellno bigint (15), person_type varchar(10))
BEGIN
insert into person (person_name, person_email, cell) values(person_name, email, cellno);
if(person_type = 'student') then
insert into student (person_id, graduation_year, major, type) values 
((select person_id from person where cell = cellno), 2019, 'Computer Science', 'Graduate');
elseif(person_type = 'faculty') then
insert into faculty (person_id, title, degree_college, highest_degree) values 
((select person_id from person where cell = cellno), 'Assistant Professor', 'UCLA', 'PhD');
elseif(person_type = 'staff') then
insert into student (person_id, position, is_admin) values 
((select person_id from person where cell = cellno), 'Bus Driver', 'N');
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `All_Driver_Ratings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `All_Driver_Ratings`()
BEGIN
	SELECT
		o1.driver_id,
		p1.person_name AS Driver_Name,
		AVG(r1.driver_rating) AS AvgRating,
		MIN(r1.driver_rating)AS MinRating,
		MAX(r1.driver_rating) AS MaxRating
	FROM campus_eats_fall2020.rating as r1
	LEFT JOIN campus_eats_fall2020.order as o1
		ON r1.order_id = o1.order_id
	LEFT JOIN campus_eats_fall2020.driver as d1
		ON o1.driver_id = d1.driver_id
	LEFT JOIN campus_eats_fall2020.student as s1
		ON d1.student_id = s1.student_id
	LEFT JOIN campus_eats_fall2020.person as p1
		ON s1.person_id = p1.person_id
	GROUP BY o1.driver_id
    ORDER BY AvgRating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `All_Restaurant_Ratings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `All_Restaurant_Ratings`()
BEGIN
	SELECT
		res.restaurant_id,
		res.restaurant_name,
		AVG(r.resturant_Rating) AS AvgRating,
		MIN(r.resturant_Rating)AS MinRating,
		MAX(r.resturant_Rating) AS MaxRating
	FROM
	campus_eats_fall2020.rating as r
	LEFT JOIN campus_eats_fall2020.order as o
		ON r.order_id = o.order_id
	LEFT JOIN campus_eats_fall2020.restaurant as res
		ON o.restaurant_id = res.restaurant_id
	GROUP BY res.restaurant_name
    ORDER BY AvgRating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Individual_Driver_Rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Individual_Driver_Rating`(IN driver_name VARCHAR(255))
BEGIN
	SELECT
		o1.driver_id,
		p1.person_name AS Driver_Name,
		AVG(r1.driver_rating) AS AvgRating,
		MIN(r1.driver_rating)AS MinRating,
		MAX(r1.driver_rating) AS MaxRating
	FROM campus_eats_fall2020.rating as r1
	LEFT JOIN campus_eats_fall2020.order as o1
		ON r1.order_id = o1.order_id
	LEFT JOIN campus_eats_fall2020.driver as d1
		ON o1.driver_id = d1.driver_id
	LEFT JOIN campus_eats_fall2020.student as s1
		ON d1.student_id = s1.student_id
	LEFT JOIN campus_eats_fall2020.person as p1
		ON s1.person_id = p1.person_id
	WHERE p1.person_name = driver_name
    ORDER BY r1.driver_Rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Individual_Restaurant_Rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Individual_Restaurant_Rating`(IN restaurant_name VARCHAR(255))
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderDetails`(IN order_num INT)
BEGIN
	SELECT 
		o.order_id,
        o.restaurant_id
-- 		r.restaurant_name as Resturant,
-- 		o.driver_id as Driver_ID,
-- 		p.person_name AS Driver_Name
	FROM campus_eats_fall2020.restaurant as r
	INNER JOIN campus_eats_fall2020.order as o
		ON r.restaurant_id = o.restaurant_id
	LEFT JOIN campus_eats_fall2020.driver as d
		ON o.driver_id = d.driver_id
	LEFT JOIN campus_eats_fall2020.student as s
		ON d.student_id = s.student_id
	LEFT JOIN campus_eats_fall2020.person as p
		ON s.person_id = p.person_id
	WHERE o.order_id = order_num
    UNION
    SELECT 
		o.person_id as Customer_ID,
        p.person_name as Customer_Name
	FROM campus_eats_fall2020.person as p
    INNER JOIN campus_eats_fall2020.order as o
		ON p.person_id = o.person_id
	WHERE o.order_id = order_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Recipt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Recipt`(IN orderID INTEGER)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Restaurant_Rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Restaurant_Rating`(IN restaurant_name VARCHAR(255))
BEGIN
SELECT res.restaurant_name as Resturant, r.resturant_Rating, r.comment
from campus_eats_fall2020.restaurant res
	INNER JOIN campus_eats_fall2020.order o
	ON res.restaurant_id = o.restaurant_id
	INNER JOIN campus_eats_fall2020.rating r
	ON o.order_id = r.order_id
    WHERE res.restaurant_name = restaurant_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GETMESSAGE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETMESSAGE`()
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18 15:44:06
