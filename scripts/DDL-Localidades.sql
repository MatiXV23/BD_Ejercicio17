--------------------------------------------------------
-- Archivo creado  - miércoles-noviembre-12-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table LOCALIDADES
--------------------------------------------------------
PRAGMA foreign_keys = ON;

  CREATE TABLE LOCALIDADES (
    IDLOCALIDAD     INTEGER PRIMARY KEY,
    NOMBRE          TEXT NOT NULL,
    IDDEPARTAMENTO  INTEGER NOT NULL,
    FOREIGN KEY (IDDEPARTAMENTO) REFERENCES DEPARTAMENTOS(IDDEPARTAMENTO)
);

CREATE UNIQUE INDEX idx_localidades_idlocalidad ON LOCALIDADES (IDLOCALIDAD);
CREATE UNIQUE INDEX idx_localidades_nombre ON LOCALIDADES (NOMBRE);