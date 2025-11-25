import express from "express";
import sqlite3 from "sqlite3";
import cors from "cors";

const app = express();
app.use(cors());
app.use(express.json());

const db = new sqlite3.Database(
  "C:/temp/sqlite_ejercicio_17/basedatos.db",
  (err) => {
    if (err) {
      console.error("Error: ", err.message);
    } else {
      console.log("Conectado desde Node.js");
    }
  }
);

app.get("/usuarios", (req, res) => {
  db.all("SELECT * FROM USUARIOS", [], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

app.post("/usuarios", (req, res) => {
  const {
    usuario,
    documento,
    tipoUsuario,
    primerNombre,
    segundoNombre,
    primerApellido,
    segundoApellido,
    mailPersonal,
    mailInstitucional,
    telefono,
    fechaNacimiento,
    idGenero,
    idDepartamento,
    idLocalidad,
    idItr,
    activo,
  } = req.body;

  const sql = `
    INSERT INTO USUARIOS (
      USUARIO, DOCUMENTO, TIPO_USUARIO, PRIMER_NOMBRE, SEGUNDO_NOMBRE,
      PRIMER_APELLIDO, SEGUNDO_APELLIDO, MAIL_PERSONAL, MAIL_INSTITUCIONAL,
      TELEFONO, FECHA_NACIMIENTO, IDGENERO, IDDEPARTAMENTO, IDLOCALIDAD,
      IDITR, ACTIVO, CLAVE, CONFIRMADO
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'utec.1234', 'S')
  `;

  db.run(
    sql,
    [
      usuario,
      documento,
      tipoUsuario,
      primerNombre,
      segundoNombre,
      primerApellido,
      segundoApellido,
      mailPersonal,
      mailInstitucional,
      telefono,
      fechaNacimiento,
      idGenero,
      idDepartamento,
      idLocalidad,
      idItr,
      activo,
    ],
    function (err) {
      if (err) return res.status(500).json({ error: err.message });
      res.json({ id: this.lastID });
    }
  );
});

app.put("/usuarios/:id", (req, res) => {
  const id = req.params.id;

  const fields = [
    "USUARIO",
    "DOCUMENTO",
    "TIPO_USUARIO",
    "PRIMER_NOMBRE",
    "SEGUNDO_NOMBRE",
    "PRIMER_APELLIDO",
    "SEGUNDO_APELLIDO",
    "MAIL_PERSONAL",
    "MAIL_INSTITUCIONAL",
    "TELEFONO",
    "FECHA_NACIMIENTO",
    "IDGENERO",
    "IDDEPARTAMENTO",
    "IDLOCALIDAD",
    "IDITR",
    "ACTIVO",
  ];

  const values = fields.map((f) => req.body[f.toLowerCase()]);
  const setClause = fields.map((f) => `${f} = ?`).join(", ");

  db.run(
    `UPDATE USUARIOS SET ${setClause} WHERE IDUSUARIO = ?`,
    [...values, id],
    function (err) {
      if (err) res.status(500).json({ error: err.message });
      else res.json({ updated: this.changes });
    }
  );
});

app.delete("/usuarios/:id", (req, res) => {
  db.run(
    "DELETE FROM USUARIOS WHERE IDUSUARIO = ?",
    req.params.id,
    function (err) {
      if (err) return res.status(500).json({ error: err.message });
      res.json({ deleted: this.changes });
    }
  );
});

app.listen(8080, () => console.log("Escuchando en http://localhost:8080"));
