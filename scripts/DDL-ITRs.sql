PRAGMA foreign_keys = ON;

--------------------------------------------------------

CREATE TABLE ITRS (
    IDITR           INTEGER PRIMARY KEY,
    ACTIVO          TEXT NOT NULL,      -- era CHAR(1)
    NOMBRE          TEXT NOT NULL,
    IDDEPARTAMENTO  INTEGER NOT NULL,
    FOREIGN KEY (IDDEPARTAMENTO) REFERENCES DEPARTAMENTOS(IDDEPARTAMENTO)
);

--------------------------------------------------------

CREATE UNIQUE INDEX idx_itrs_nombre ON ITRS (NOMBRE);
CREATE UNIQUE INDEX idx_itrs_iditr ON ITRS (IDITR);
