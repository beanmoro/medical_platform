
-- Stored Procedure 1:
-- Sirve para ordenar en base a un campo el feedback,
-- su principal utilidad es poder ordenar los comentarios por calificacion
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_feedback_order`(IN _field CHAR(20), IN _order CHAR(20))
BEGIN
	-- Verificamos si el argumento _order no esta vacio.
	IF _order <> '' THEN
		-- Si cumple con la condicion del if, lo asignamos a la variable table_order
		SET @table_order = _order;
	ELSE
		-- En el caso que no cumpla con la condicion, se asigna el valor ASC por defecto.
		SET @table_order = 'ASC';
	END IF;
    
    -- Verificamos que el argumento _field no esta vacio.
	IF _field <> '' THEN
		-- Si cumple con la condicion se concatena _field y table_order con la sentencia ORDER BY.
		SET @table_field = concat('ORDER BY ', _field, ' ', @table_order);
	ELSE
		-- En el caso que no cumpla la variable table_field queda vacia.
		SET @table_field = '';
	END IF;
	
    -- Concatenamos la consulta final con la variable table_field.
    SET @clause = concat('SELECT * FROM feedback ', @table_field);
    -- Asignamos en memoria la sentencia.
    PREPARE runSQL FROM @clause;
    -- Ejecutamos la sentencia SQL.
    EXECUTE runSQL;
    -- Liberamos la memoria de la sentencia anteriormente asignada.
    DEALLOCATE PREPARE runSQL;
	
END

-- Stored Procedure 2:
-- Sirve para agregar nuevos appointments y tambien para eliminar.

CREATE DEFINER=`root`@`localhost` PROCEDURE `manage_appointments`(IN appointment_date DATE, IN appointment_hour TIME, _user_id INT, _medic_id INT, del_appoint_id INT)
BEGIN
	
    -- Declaro una variable que utilizare mas adelante
    DECLARE appointment_length INT DEFAULT 0;
    
    -- Verifico si los argumentos son validos para la insercion de datos 
	IF appointment_date <> '' AND appointment_hour <> '' and _user_id > 0 and _medic_id > 0 THEN
		-- Si los argumentos son validos concatena la sentencia Insert con los argumentos.
        SET @data_insert = CONCAT("INSERT INTO appointment (appoint_date, appoint_hour, appoint_state, diagnostic_commentary, user_id, service_id) VALUES ('", appointment_date ,"', '", appointment_hour ,"', 1, '', ", _user_id,", ", _medic_id,");");
	ELSE
		-- En el caso de que algun argumento de insercion de datos sea invalido dejara la variable data_insert vacia.
		SET @data_insert = '';
    END IF;
    
    -- Obtenemos la longitud de los registros de la tabla appointment.
    SELECT count(appointment_id) INTO appointment_length FROM appointment;
    
    -- Verifico si la variable para eliminar un registro de la tabla esta dentro de los limites de la misma.
    IF del_appoint_id > 0 and del_appoint_id <= appointment_length THEN
		-- Si la variable esta dentro de los limites de la tabla, se concatena con la sentencia para eliminar ese registro.
        SET @data_delete = CONCAT("DELETE FROM appointment WHERE appointment_id = ", del_appoint_id, ";");
	ELSE
		-- en el caso de que la variable no cumpla con la condicion, la variable data_delete se deja vacia.
		SET @data_delete = '';
    END IF;
    

    -- Verificamos si la variable data_insert no esta vacia, osea que contiene una sentencia para ser ejecutada.
    IF @data_insert <> '' THEN
		-- Asignamos en memoria la sentencia para ser ejecutada.
        PREPARE runSQL FROM @data_insert; 
        -- Ejecutamos la sentencia.
        EXECUTE runSQL;
        -- Limpiamos la memoria donde se contenia la sentencia SQL.
        DEALLOCATE PREPARE runSQL;
    END IF;
	
    -- Verificamos si la variable data_delete no esta vacia, osea que contiene la sentencia para eliminar el registro.
	IF @data_delete <> '' THEN
		-- Asignamos en memoria la sentencia para ser ejecutada.
		PREPARE runSQL FROM @data_delete;
        -- Ejecutamos la sentencia.
        EXECUTE runSQL;
        -- Limpiamos la memoria donde se contenia la sentencia SQL.
        DEALLOCATE PREPARE runSQL;
    END IF;
    
    
END