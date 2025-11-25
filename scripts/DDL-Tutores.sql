
  PRAGMA foreign_keys = ON;
  
--------------------------------------------------------
--  DDL for Index SYS_C0072797
--------------------------------------------------------

DROP TABLE IF EXISTS TUTORES;

CREATE TABLE TUTORES (
    IDAREA INTEGER,
    IDROL INTEGER,
    IDUSUARIO INTEGER UNIQUE,
    FOREIGN KEY (IDAREA) REFERENCES AREAS(IDAREA),
    FOREIGN KEY (IDROL) REFERENCES ROLES(IDROL),
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO)
);


--------------------------------------------------------
--  Ref Constraints for Table TUTORES
--------------------------------------------------------

  CREATE UNIQUE INDEX idx_tutores_idusuario ON TUTORES (IDUSUARIO);
  
