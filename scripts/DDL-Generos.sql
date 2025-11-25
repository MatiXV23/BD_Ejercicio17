PRAGMA foreign_keys = ON;

--------------------------------------------------------
-- Tabla GENEROS (versión SQLite)
--------------------------------------------------------

CREATE TABLE GENEROS (
    IDGENERO    INTEGER PRIMARY KEY,
    NOMBRE      TEXT NOT NULL
);

--------------------------------------------------------
-- Índices únicos (equivalente a Oracle)
--------------------------------------------------------

-- NOMBRE debe ser único
CREATE UNIQUE INDEX idx_generos_nombre ON GENEROS (NOMBRE);

-- El índice único IDGENERO ya está implícito en PRIMARY KEY,
-- pero lo dejo explícito si querés mantener equivalencia:
CREATE UNIQUE INDEX idx_generos_idgenero ON GENEROS (IDGENERO);
