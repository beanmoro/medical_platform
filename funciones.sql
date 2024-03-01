--Funcion 1: Obtener deuda de las consultas medicas del usuario.
CREATE DEFINER=`root`@`localhost` FUNCTION `get_user_bills_debt`(p_user_id INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE total_debt DECIMAL DEFAULT 0;
	SELECT SUM(b.bill_value) INTO total_debt FROM platform_user_bill_history AS b
	JOIN appointment AS a ON a.appointment_id = b.appointment_id
	WHERE a.user_id = p_user_id AND b.bill_paid = FALSE;
RETURN total_debt;
END


-- Funcion 2: Obtener el promedio de calificaciones del Profesional de la Salud
CREATE DEFINER=`root`@`localhost` FUNCTION `get_califications_average`(p_professional_id INT) RETURNS float
    READS SQL DATA
BEGIN
	DECLARE califications_sum INT DEFAULT 0.0;
    DECLARE califications_count INT DEFAULT 1.0;
    DECLARE average_calification FLOAT DEFAULT 0.0;
    
    SELECT 	SUM(calification), COUNT(calification)  INTO califications_sum, califications_count
	FROM feedback f
	WHERE f.professional_id = p_professional_id;
	
    SET average_calification = ROUND(califications_sum/califications_count, 1);
	
RETURN average_calification;
END