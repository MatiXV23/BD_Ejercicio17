PRAGMA foreign_keys = ON;

--------------------------------------------------------

DROP TABLE IF EXISTS ROLES;

CREATE TABLE ROLES (
    IDROL INTEGER PRIMARY KEY,
    DESCRIPCION TEXT UNIQUE
);
