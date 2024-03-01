
-- View 1: users_appointment_view
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `users_appointment_view` AS
    SELECT 
        `p`.`user_id` AS `user_id`,
        `p`.`user_name` AS `user_name`,
        `a`.`appointment_id` AS `appointment_id`,
        `a`.`appoint_date` AS `appoint_date`,
        `a`.`appoint_state` AS `appoint_state`
    FROM
        (`platform_user` `p`
        JOIN `appointment` `a` ON ((`p`.`user_id` = `a`.`user_id`)))

-- View 2:  health_professional_services_view

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `health_professional_services_view` AS
    SELECT 
        `h`.`professional_id` AS `professional_id`,
        `h`.`professional_name` AS `professional_name`,
        `h`.`speciality` AS `speciality`,
        `m`.`service_id` AS `service_id`,
        `m`.`service_description` AS `service_description`,
        `m`.`service_price` AS `service_price`
    FROM
        (`health_professional` `h`
        JOIN `medical_service` `m` ON ((`h`.`professional_id` = `m`.`professional_id`)))

-- View 3: health_professional_appointment_number_view

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `health_professional_appointment_number_view` AS
    SELECT 
        `p`.`professional_id` AS `ID`,
        `p`.`professional_name` AS `MEDIC`,
        `p`.`speciality` AS `SPECIALITY`,
        COUNT(`a`.`appointment_id`) AS `APPOINTMENTS`
    FROM
        (`appointment` `a`
        JOIN `health_professional` `p` ON ((`p`.`professional_id` = (SELECT 
                `m`.`professional_id`
            FROM
                `medical_service` `m`
            WHERE
                (`m`.`service_id` = `a`.`service_id`)))))
    GROUP BY `p`.`professional_id` , `p`.`professional_name` , `p`.`speciality`

-- View 4: users_bills_debt

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `users_bills_debt` AS
    SELECT 
        `p`.`user_id` AS `user_id`,
        `p`.`user_name` AS `user_name`,
        SUM(`b`.`bill_value`) AS `SUM(b.bill_value)`
    FROM
        (`platform_user` `p`
        JOIN `platform_user_bill_history` `b` ON ((`b`.`user_id` = `p`.`user_id`)))
    WHERE
        (`b`.`bill_paid` = FALSE)
    GROUP BY `p`.`user_id` , `p`.`user_name`


-- View 5: feedback_users_view

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `medical_platform`.`feedback_users_view` AS
    SELECT 
        `p`.`user_name` AS `Autor`,
        `f`.`calification` AS `calification`,
        `f`.`commentary` AS `commentary`,
        `h`.`professional_name` AS `Nombre del profesional`
    FROM
        ((`medical_platform`.`feedback` `f`
        JOIN `medical_platform`.`platform_user` `p` ON ((`p`.`user_id` = `f`.`author_id`)))
        JOIN `medical_platform`.`health_professional` `h` ON ((`h`.`professional_id` = `f`.`professional_id`)))