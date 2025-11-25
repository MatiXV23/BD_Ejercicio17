PRAGMA foreign_keys = ON;

--------------------------------------------------------

DROP TABLE IF EXISTS ANALISTAS;

CREATE TABLE ANALISTAS (
    FIRMADIGITAL TEXT,
    IDUSUARIO INTEGER UNIQUE,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO)
);


--------------------------------------------------------

-- CREATE UNIQUE INDEX idx_analistas_idusuario ON ANALISTAS (IDUSUARIO);
