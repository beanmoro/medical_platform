
INSERT INTO platform_user (user_name, birthdate, direction, phone, email, user_password)
VALUES
('Juan Perez', '1990-05-15', 'Calle 123, Ciudad', '1234567890', 'juan.perez@example.com', 'contraseña123'),
('María Rodriguez', '1985-08-22', 'Avenida 456, Otra Ciudad', '9876543210', 'maria.rodriguez@example.com', 'password456'),
('Carlos López', '1995-02-10', 'Calle Principal, Pueblo', '5552223333', 'carlos.lopez@example.com', 'clave789'),
('Ana Martinez', '1988-11-30', 'Carrera 789, Villa', '6661112222', 'ana.martinez@example.com', 'secreto567'),
('Pedro Ramirez', '1992-07-05', 'Camino 555, Pueblo Nuevo', '4447778888', 'pedro.ramirez@example.com', 'p455w0rd'),
('Luisa Torres', '1983-04-18', 'Paseo 987, Ciudad Vieja', '3338889999', 'luisa.torres@example.com', 'security321'),
('Roberto Castro', '1998-01-25', 'Ruta 321, Otra Ciudad', '2225556666', 'roberto.castro@example.com', 'securepwd'),
('Laura Gonzalez', '1993-09-12', 'Bulevar 654, Villa Nueva', '7774445555', 'laura.gonzalez@example.com', 'pass123'),
('Javier Diaz', '1980-06-03', 'Avenida 987, Pueblo Lejano', '9996663333', 'javier.diaz@example.com', 'securepass'),
('Isabel Herrera', '1987-12-20', 'Calle 456, Ciudad Moderna', '8883332222', 'isabel.herrera@example.com', 'passwd789'),
('Ricardo Sánchez', '1996-03-08', 'Pasaje 789, Pueblo Antiguo', '5557778888', 'ricardo.sanchez@example.com', 'mypassword'),
('Elena Gomez', '1982-10-16', 'Avenida Central 123, Pueblo Grande', '4441112222', 'elena.gomez@example.com', 'secure123'),
('Hector Morales', '1991-04-27', 'Calle Nueva 987, Villa Moderna', '6669991111', 'hector.morales@example.com', 'pass456'),
('Sofia Fernandez', '1986-12-15', 'Ruta 555, Otra Villa', '3334445555', 'sofia.fernandez@example.com', 'secure789'),
('Diego Gutierrez', '1994-08-02', 'Bulevar 321, Ciudad Nueva', '7778889999', 'diego.gutierrez@example.com', 'mypass');


INSERT INTO health_professional (professional_name, speciality, phone, email, professional_password)
VALUES ('Dr. Roberto Torres', 'Cardiología', '1234567890', 'roberto.torres@example.com', 'pass123'),
('Dra. María Rodriguez', 'Dermatología', '9876543210', 'maria.rodriguez@example.com', 'password456'),
('Dr. Carlos López', 'Pediatría', '5552223333', 'carlos.lopez@example.com', 'clave789'),
('Dra. Ana Martinez', 'Ginecología', '6661112222', 'ana.martinez@example.com', 'secreto567'),
('Dr. Pedro Ramirez', 'Neurología', '4447778888', 'pedro.ramirez@example.com', 'p455w0rd'),
('Dra. Luisa Torres', 'Oftalmología', '3338889999', 'luisa.torres@example.com', 'security321'),
('Dr. Roberto Castro', 'Ortopedia', '2225556666', 'roberto.castro@example.com', 'securepwd'),
('Dra. Laura Gonzalez', 'Endocrinología', '7774445555', 'laura.gonzalez@example.com', 'pass123'),
('Dr. Javier Diaz', 'Oncología', '9996663333', 'javier.diaz@example.com', 'securepass'),
('Dra. Isabel Herrera', 'Psiquiatría', '8883332222', 'isabel.herrera@example.com', 'passwd789'),
('Dr. Ricardo Sánchez', 'Cirugía General', '5557778888', 'ricardo.sanchez@example.com', 'mypassword'),
('Dra. Elena Gomez', 'Cardiología Pediátrica', '4441112222', 'elena.gomez@example.com', 'secure123'),
('Dr. Hector Morales', 'Urología', '6669991111', 'hector.morales@example.com', 'pass456'),
('Dra. Sofia Fernandez', 'Dermatología Pediátrica', '3334445555', 'sofia.fernandez@example.com', 'secure789'),
('Dr. Diego Gutierrez', 'Neurocirugía', '7778889999', 'diego.gutierrez@example.com', 'mypass');

INSERT INTO medical_service (service_description, service_type, service_price, professional_id)
VALUES
('Consulta Cardiológica', 1, 100.00, 1),
('Dermatología Clínica', 2, 80.00, 2),
('Consulta Pediátrica', 3, 90.00, 3),
('Consulta Ginecológica', 4, 120.00, 4),
('Neurología General', 5, 150.00, 5),
('Consulta Oftalmológica', 6, 110.00, 6),
('Ortopedia Consulta', 7, 130.00, 7),
('Endocrinología General', 8, 140.00, 8),
('Oncología Evaluación', 9, 180.00, 9),
('Psiquiatría Sesión', 10, 160.00, 10),
('Cirugía General Consulta', 11, 200.00, 11),
('Cardiología Pediátrica', 12, 120.00, 12),
('Consulta Urológica', 13, 110.00, 13),
('Dermatología Pediátrica', 14, 85.00, 14),
('Neurocirugía Evaluación', 15, 190.00, 15);


INSERT INTO appointment (appoint_date, appoint_hour, appoint_state, diagnostic_commentary, user_id, service_id)
VALUES
('2024-02-01', '10:00:00', 1, 'Presión arterial alta', 1, 1),
('2024-02-02', '11:30:00', 1, 'Acné leve', 2, 2),
('2024-02-03', '14:15:00', 1, 'Consulta de rutina', 3, 3),
('2024-02-04', '09:45:00', 1, 'Embarazo en buen estado', 4, 4),
('2024-02-05', '13:00:00', 1, 'Dolor de cabeza frecuente', 5, 5),
('2024-02-06', '15:30:00', 1, 'Revisión de la vista', 6, 6),
('2024-02-07', '12:45:00', 1, 'Dolor en la rodilla', 7, 7),
('2024-02-08', '14:00:00', 1, 'Problemas de tiroides', 8, 8),
('2024-02-09', '16:30:00', 1, 'Seguimiento de tratamiento oncológico', 9, 9),
('2024-02-10', '10:45:00', 1, 'Ansiedad y depresión', 10, 10),
('2024-02-11', '11:15:00', 1, 'Consulta preoperatoria', 11, 11),
('2024-02-12', '09:30:00', 1, 'Control de arritmia', 12, 12),
('2024-02-13', '13:45:00', 1, 'Infección urinaria', 13, 13),
('2024-02-14', '15:15:00', 1, 'Dermatitis en bebé', 14, 14),
('2024-02-15', '14:30:00', 1, 'Dolor de espalda crónico', 15, 15);

INSERT INTO feedback (calification, commentary, feedback_date, author_id, professional_id)
VALUES
(4, 'El servicio fue excelente. El Dr. Torres fue muy atento y respondió todas mis preguntas.', '2024-02-01', 1, 1),
(5, 'La Dra. Rodriguez es una profesional increíble. Su conocimiento en dermatología es impresionante.', '2024-02-02', 2, 2),
(4, 'El Dr. López fue muy amable con mi hijo. La consulta pediátrica fue eficiente y completa.', '2024-02-03', 3, 3),
(3, 'Buena atención en general, pero la espera fue un poco larga.', '2024-02-04', 4, 4),
(5, 'El Dr. Ramirez es muy detallado en sus explicaciones. Me hizo sentir muy seguro durante la consulta.', '2024-02-05', 5, 5),
(4, 'La Dra. Torres es muy profesional. La revisión de la vista fue completa y me explicó todo detalladamente.', '2024-02-06', 6, 6),
(3, 'La consulta con el Dr. Castro fue buena, pero la recepción debería ser más organizada.', '2024-02-07', 7, 7),
(5, 'Excelente atención por parte de la Dra. Gonzalez. Me ayudó mucho con mis problemas de tiroides.', '2024-02-08', 8, 8),
(4, 'El Dr. Diaz es muy comprensivo. Su apoyo durante el tratamiento oncológico ha sido invaluable.', '2024-02-09', 9, 9),
(3, 'La Dra. Herrera es buena, pero la espera en la sala de espera fue incómoda.', '2024-02-10', 10, 10),
(5, 'El Dr. Sánchez realizó una cirugía exitosa. Su habilidad y atención postoperatoria son notables.', '2024-02-11', 11, 11),
(4, 'La Dra. Gomez es muy dedicada en la atención a niños. Mi hijo se sintió cómodo durante la consulta.', '2024-02-12', 12, 12),
(3, 'El Dr. Morales es un buen urólogo, pero la atención telefónica para agendar la cita fue lenta.', '2024-02-13', 13, 13),
(5, 'La Dra. Fernandez es muy paciente con los niños. Trató la dermatitis de mi bebé de manera efectiva.', '2024-02-14', 14, 14),
(4, 'El Dr. Gutierrez es un neurocirujano competente. Su atención y seguimiento son excepcionales.', '2024-02-15', 15, 15);











