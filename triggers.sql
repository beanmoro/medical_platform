-- TRIGGER 1: available_schelude

DELIMITER //
CREATE TRIGGER available_schelude
BEFORE INSERT ON appointment
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM appointment p WHERE p.appoint_date = NEW.appoint_date AND p.appoint_hour = NEW.appoint_hour AND p.appoint_state = 1 AND p.service_id = NEW.service_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El horario ya está ocupado';
    END IF;
END;
//
DELIMITER ;

-- TRIGGER 2: register_bill

DELIMITER //
CREATE TRIGGER register_bill
BEFORE UPDATE ON appointment
FOR EACH ROW
BEGIN
	DECLARE bill_val DECIMAL;
    
    IF NEW.appoint_state = 2 THEN
		SELECT m.service_price INTO bill_val 
		FROM medical_service m 
		WHERE m.service_id = OLD.service_id;

		INSERT INTO platform_user_bill_history(bill_value, bill_date, bill_hour, bill_paid, user_id, appointment_id)
		VALUES (bill_val, CURRENT_DATE(), CURRENT_TIME(), false, OLD.user_id, OLD.appointment_id);
    END IF;
END;
//
DELIMITER ;

-- Trigger 3: register_payment

DELIMITER //
CREATE TRIGGER register_payment
BEFORE UPDATE ON platform_user_bill_history
FOR EACH ROW
BEGIN
    IF NEW.bill_paid = TRUE THEN
		INSERT INTO payment_log(log_date, log_time, bill_id)
		VALUES (CURRENT_DATE(), CURRENT_TIME(), OLD.bill_id);
    END IF;
END;
//
DELIMITER ;