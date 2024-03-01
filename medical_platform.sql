CREATE SCHEMA medical_platform;
USE medical_platform;


CREATE TABLE platform_user (
	user_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(30) NOT NULL,
    birthdate DATE NOT NULL,
    direction VARCHAR(50),
    phone VARCHAR(10) NOT NULL,
    email VARCHAR(32) NOT NULL,
    user_password VARCHAR(16) NOT NULL,
    PRIMARY KEY (user_id)
);


CREATE TABLE health_professional(
	professional_id INT NOT NULL AUTO_INCREMENT,
    professional_name VARCHAR(50) NOT NULL,
    speciality VARCHAR(30) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    email VARCHAR(32) NOT NULL,
    professional_password VARCHAR(16) NOT NULL,
    PRIMARY KEY (professional_id)
);

CREATE TABLE medical_service(
	service_id INT NOT NULL AUTO_INCREMENT,
    service_description VARCHAR(50) NOT NULL,
    service_type INT NOT NULL,
    service_price DECIMAL NOT NULL,
	professional_id INT NOT NULL,
    PRIMARY KEY (service_id),
    FOREIGN KEY (professional_id) REFERENCES health_professional (professional_id)
    
);

CREATE TABLE appointment(
	appointment_id INT NOT NULL AUTO_INCREMENT,
    appoint_date DATE NOT NULL,
    appoint_hour TIME NOT NULL,
    appoint_state INT NOT NULL,
    diagnostic_commentary VARCHAR(250),
    user_id INT NOT NULL,
    service_id INT NOT NULL,
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (user_id) REFERENCES platform_user (user_id),
    FOREIGN KEY (service_id) REFERENCES medical_service (service_id)
    
);

CREATE TABLE feedback(
	feedback_id INT NOT NULL AUTO_INCREMENT,
    calification INT NOT NULL,
    commentary VARCHAR(250),
    feedback_date DATE NOT NULL,
    author_id INT NOT NULL,
    professional_id INT NOT NULL,
    PRIMARY KEY (feedback_id),
    FOREIGN KEY (author_id) REFERENCES platform_user (user_id),
    FOREIGN KEY (professional_id) REFERENCES health_professional (professional_id)
);

CREATE TABLE platform_user_bill_history(
    bill_id INT NOT NULL AUTO_INCREMENT,
    bill_value DECIMAL NOT NULL,
    bill_date DATE NOT NULL,
    bill_hour TIME NOT NULL,
    bill_paid BOOLEAN NOT NULL,
    user_id INT NOT NULL,
    appointment_id INT NOT NULL,
    PRIMARY KEY (bill_id),
    FOREIGN KEY (user_id) REFERENCES platform_user (user_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment (appointment_id)
);


CREATE TABLE payment_log(
    log_id INT NOT NULL AUTO_INCREMENT,
    log_date DATE NOT NULL,
    log_time TIME NOT NULL,
    bill_id INT NOT NULL,
    PRIMARY KEY(log_id),
    FOREIGN KEY (bill_id) REFERENCES platform_user_bill_history(bill_id)
);