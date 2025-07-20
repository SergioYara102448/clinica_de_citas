CREATE DATABASE clinica_citas;
USE clinica_citas;

CREATE TABLE especialidad (
  id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  descripcion TEXT
);
CREATE TABLE medico (
  id_medico INT PRIMARY KEY AUTO_INCREMENT,
  nombres VARCHAR(50),
  apellidos VARCHAR(50),
  id_especialidad INT,
  consultorio VARCHAR(10),
  horario VARCHAR(100),
  FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);
CREATE TABLE paciente (
  id_paciente INT PRIMARY KEY AUTO_INCREMENT,
  nombres VARCHAR(50),
  apellidos VARCHAR(50),
  telefono VARCHAR(20),
  correo VARCHAR(100),
  fecha_nacimiento DATE
);
CREATE TABLE cita (
  id_cita INT PRIMARY KEY AUTO_INCREMENT,
  id_paciente INT,
  id_medico INT,
  fecha_cita DATE,
  hora_cita TIME,
  estado VARCHAR(20),
  FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
  FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

INSERT INTO especialidad (nombre, descripcion)
VALUES ('Pediatría', 'Atención médica a niños');
INSERT INTO especialidad (nombre, descripcion) VALUES ('Odontólogo', 'Atención médica para los dientes');
INSERT INTO especialidad (nombre, descripcion) VALUES ('Oftalmólogo', 'Atención médica para problemas de la vista');
INSERT INTO especialidad (nombre, descripcion) VALUES ('Ortopedista', 'Especialista en problemas del sistema musculoesquelético');
INSERT INTO especialidad (nombre, descripcion) VALUES ('Dermatólogo', 'Atención médica para enfermedades de la piel');

INSERT INTO medico (nombres, apellidos, id_especialidad, consultorio, horario)
VALUES ('Laura', 'Martínez', 1, '302A', 'Lunes a Viernes 8am - 4pm');

INSERT INTO medico (nombres, apellidos, id_especialidad, consultorio, horario)
VALUES ('Carlos', 'González', 2, '201B', 'Lunes a Viernes 9am - 5pm');

INSERT INTO medico (nombres, apellidos, id_especialidad, consultorio, horario)
VALUES ('Sofía', 'López', 3, '103C', 'Martes a Sábado 10am - 6pm');

INSERT INTO medico (nombres, apellidos, id_especialidad, consultorio, horario)
VALUES ('Javier', 'Hernández', 4, '204D', 'Lunes, Miércoles y Viernes 8am - 2pm');

INSERT INTO medico (nombres, apellidos, id_especialidad, consultorio, horario)
VALUES ('María', 'Pérez', 5, '305E', 'Jueves y Viernes 1pm - 7pm');

INSERT INTO paciente (nombres, apellidos, telefono, correo, fecha_nacimiento)
VALUES ('Carlos', 'Ramos', '3124567890', 'carlos@example.com', '1990-05-20');

INSERT INTO paciente (nombres, apellidos, telefono, correo, fecha_nacimiento)
VALUES ('Ana', 'García', '3101234567', 'ana@example.com', '1985-03-15');

INSERT INTO paciente (nombres, apellidos, telefono, correo, fecha_nacimiento)
VALUES ('Luis', 'Fernández', '3119876543', 'luis@example.com', '1992-11-30');

INSERT INTO paciente (nombres, apellidos, telefono, correo, fecha_nacimiento)
VALUES ('Sofía', 'Martínez', '3156789012', 'sofia@example.com', '1988-07-25');

INSERT INTO paciente (nombres, apellidos, telefono, correo, fecha_nacimiento)
VALUES ('Diego', 'Torres', '3182345678', 'diego@example.com', '1995-01-10');

INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, estado)
VALUES (1, 1, '2025-07-18', '10:00:00', 'Programada');

INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, estado)
VALUES (2, 2, '2025-07-19', '11:30:00', 'Programada');

INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, estado)
VALUES (3, 3, '2025-07-20', '09:00:00', 'Programada');

INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, estado)
VALUES (4, 4, '2025-07-21', '14:00:00', 'Programada');

INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, estado)
VALUES (5, 5, '2025-07-22', '15:30:00', 'Programada');

SELECT c.id_cita, p.nombres AS paciente, m.nombres AS medico, e.nombre AS especialidad, c.fecha_cita, c.hora_cita, c.estado
FROM cita c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN medico m ON c.id_medico = m.id_medico
JOIN especialidad e ON m.id_especialidad = e.id_especialidad;
