PRAGMA foreign_keys = ON;

--------------------------------------------------------

CREATE TABLE AREAS (
    IDAREA INTEGER NOT NULL,
    DESCRIPCION TEXT NOT NULL,

    PRIMARY KEY (IDAREA)
);

--------------------------------------------------------

CREATE UNIQUE INDEX idx_areas_descripcion ON AREAS (DESCRIPCION);

--------------------------------------------------------

-- CREATE UNIQUE INDEX idx_areas_idarea ON AREAS (IDAREA);
