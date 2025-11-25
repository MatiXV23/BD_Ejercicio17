PRAGMA foreign_keys = ON;

--------------------------------------------------------

DROP TABLE IF EXISTS ESTUDIANTES;

CREATE TABLE ESTUDIANTES (
    GENERACION TEXT,
    SEMESTRE INTEGER,
    IDUSUARIO INTEGER UNIQUE,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO)
);

--------------------------------------------------------

CREATE UNIQUE INDEX idx_estudiantes_idusuario ON ESTUDIANTES (IDUSUARIO);
