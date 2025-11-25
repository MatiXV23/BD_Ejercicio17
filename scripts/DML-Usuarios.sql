-- ============================================
-- CARGA DE TABLAS MAESTRAS
-- ============================================

INSERT INTO DEPARTAMENTOS (IDDEPARTAMENTO, NOMBRE) VALUES
(1, 'DURAZNO'),
(2, 'RIO NEGRO'),
(3, 'MALDONADO'),
(4, 'PAYSANDU'),
(5, 'RIVERA'),
(6, 'LAVALLEJA'),
(7, 'CERRO LARGO'),
(8, 'SAN JOSE');

INSERT INTO GENEROS (IDGENERO, NOMBRE) VALUES
(1, 'HOMBRE'),
(2, 'MUJER'),
(3, 'OTRO');

INSERT INTO LOCALIDADES (IDLOCALIDAD, IDDEPARTAMENTO, NOMBRE) VALUES
(1, 2, 'FRAY BENTOS'),
(2, 6, 'MINAS'),
(3, 7, 'MELO'),
(4, 1, 'DURAZNO'),
(5, 4, 'PAYSANDU'),
(6, 3, 'MALDONADO'),
(7, 5, 'RIVERA'),
(8, 8, 'SAN JOSE');

INSERT INTO ROLES (IDROL, DESCRIPCION) VALUES
(1, 'ENCARGADO'),
(2, 'TUTOR');

INSERT INTO AREAS (IDAREA, DESCRIPCION) VALUES
(1, 'PROGRAMACION'),
(2, 'BASE DE DATOS'),
(3, 'INFRAESTRUCTURA');

INSERT INTO ITRS (IDITR, ACTIVO, NOMBRE, IDDEPARTAMENTO) VALUES
(1, 'S', 'CENTRO-SUR', 1),
(2, 'S', 'NORTE', 5),
(3, 'S', 'SUR-OESTE', 2),
(4, 'S', 'ESTE', 6);

-- ============================================
-- USUARIOS
-- ORDEN EXACTO DE COLUMNAS SEGÚN DDL:
-- IDUSUARIO, ACTIVO, CLAVE, CONFIRMADO, DOCUMENTO,
-- FECHA_NACIMIENTO, MAIL_INSTITUCIONAL, MAIL_PERSONAL,
-- PRIMER_APELLIDO, PRIMER_NOMBRE, SEGUNDO_APELLIDO,
-- SEGUNDO_NOMBRE, TELEFONO, TIPO_USUARIO, USUARIO,
-- IDDEPARTAMENTO, IDGENERO, IDITR, IDLOCALIDAD
-- ============================================

-- ANALISTAS
INSERT INTO USUARIOS VALUES
(1,'S','utec.1234','S',12223331,'1988-03-11 00:00:00',
 'juan.perez@ocho.edu','jperez@mail.com',
 'Perez','Juan','Perez','Andres',
 '099999888','ANALISTA','juan.perez',
 1,1,1,4);

INSERT INTO USUARIOS VALUES
(55,'S','utec.1234','S',51115551,'1975-04-24 00:00:00',
 'pablo.marmol@ocho.edu','pabmar@mail.com',
 'Marmol','Pablo','Petro','Daniel',
 '099121212','ANALISTA','pablo.marmol',
 1,1,4,4);

-- ESTUDIANTES
INSERT INTO USUARIOS VALUES
(2,'S','utec.1234','S',21112223,'1992-02-05 00:00:00',
 'lila.esposito@ocho.edu','lalita@mail.com',
 'Esposito','Lila','Perez','Andrea',
 '099999111','ESTUDIANTE','lila.esposito',
 1,1,2,4);

INSERT INTO USUARIOS VALUES
(5,'S','utec.1234','S',55554445,'2001-12-11 00:00:00',
 'marcelo.tinelli@ocho.edu','elcabezon@mail.com',
 'Tinelli','Marcelo','Nuñez','Lorenzo',
 '099555444','ESTUDIANTE','marcelo.tinelli',
 1,1,3,4);

INSERT INTO USUARIOS VALUES
(6,'S','utec.1234','S',66662226,'1962-01-05 00:00:00',
 'moria.casan@ocho.edu','lamoria@mail.com',
 'Casan','Moria','Medina','Maria',
 '099999666','ESTUDIANTE','moria.casan',
 1,2,1,4);

-- TUTORES
INSERT INTO USUARIOS VALUES
(3,'S','utec.1234','S',31212123,'1963-08-17 00:00:00',
 'oscar.tabarez@ocho.edu','elmaestro@mail.com',
 'Tabarez','Oscar','Suarez','Washington',
 '099999122','TUTOR','oscar.tabarez',
 1,1,1,4);

INSERT INTO USUARIOS VALUES
(4,'S','utec.1234','S',32111222,'1981-10-05 00:00:00',
 'fabian.coito@ocho.edu','otromaestro@mail.com',
 'Coito','Fabian','Garcia','Palito',
 '099999133','TUTOR','fabian.coito',
 1,1,2,4);

-- ============================================
-- SUBTABLAS: ANALISTAS / ESTUDIANTES / TUTORES
-- ============================================

INSERT INTO ANALISTAS VALUES ('12345aa6789',1);
INSERT INTO ANALISTAS VALUES ('12345aa6789',55);

INSERT INTO ESTUDIANTES VALUES ('2020',2,2);
INSERT INTO ESTUDIANTES VALUES ('2022',1,5);
INSERT INTO ESTUDIANTES VALUES ('2019',5,6);

INSERT INTO TUTORES VALUES (3,1,3);
INSERT INTO TUTORES VALUES (3,2,4);
