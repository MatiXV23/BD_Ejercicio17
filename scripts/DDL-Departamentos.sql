PRAGMA foreign_keys = ON;

--------------------------------------------------------

CREATE TABLE DEPARTAMENTOS (
    IDDEPARTAMENTO INTEGER NOT NULL,
    NOMBRE TEXT NOT NULL,

    PRIMARY KEY (IDDEPARTAMENTO)
);

--------------------------------------------------------

CREATE UNIQUE INDEX idx_departamentos_nombre ON DEPARTAMENTOS (NOMBRE);

--------------------------------------------------------

-- CREATE UNIQUE INDEX idx_departamentos_id ON DEPARTAMENTOS (IDDEPARTAMENTO);
