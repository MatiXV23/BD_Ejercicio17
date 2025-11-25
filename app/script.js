const API = "http://localhost:8080";

// =============================
//  LISTAR USUARIOS
// =============================
async function obtenerUsuarios() {
  const res = await fetch(`${API}/usuarios`);
  const usuarios = await res.json();

  const contenedor = document.getElementById("tablaUsuarios");

  let html = `
    <table class="tabla">
      <thead>
        <tr>
          <th>ID</th>
          <th>Usuario</th>
          <th>Documento</th>
          <th>Nombre</th>
          <th>Apellido</th>
          <th>Tipo</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
  `;

  usuarios.forEach((u) => {
    html += `
      <tr>
        <td>${u.IDUSUARIO}</td>
        <td>${u.USUARIO}</td>
        <td>${u.DOCUMENTO}</td>
        <td>${u.PRIMER_NOMBRE}</td>
        <td>${u.PRIMER_APELLIDO}</td>
        <td>${u.TIPO_USUARIO}</td>
        <td>
          <button onclick="editarUsuario(${u.IDUSUARIO})">✏ Editar</button>
          <button onclick="eliminarUsuario(${u.IDUSUARIO})">🗑 Eliminar</button>
        </td>
      </tr>
    `;
  });

  html += "</tbody></table>";
  contenedor.innerHTML = html;
}

document.addEventListener("DOMContentLoaded", () => {
  obtenerUsuarios();
});

// =====================================================
//  CREAR / EDITAR USUARIO (Formulario)
// =====================================================
document.getElementById("usuarioForm").addEventListener("submit", async (e) => {
  e.preventDefault();

  const id = document.getElementById("idUsuario").value;
  const datos = obtenerDatosFormulario();

  if (id) {
    await fetch(`${API}/usuarios/${id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(datos),
    });
  } else {
    await fetch(`${API}/usuarios`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(datos),
    });
  }

  cancelarEdicionUsuario();
  obtenerUsuarios();
});

// =============================
// obtener datos form
// =============================
function obtenerDatosFormulario() {
  return {
    usuario: document.getElementById("usuario").value,
    documento: document.getElementById("documento").value,
    tipoUsuario: document.getElementById("tipoUsuario").value,
    primerNombre: document.getElementById("primerNombre").value,
    segundoNombre: document.getElementById("segundoNombre").value,
    primerApellido: document.getElementById("primerApellido").value,
    segundoApellido: document.getElementById("segundoApellido").value,
    mailPersonal: document.getElementById("mailPersonal").value,
    mailInstitucional: document.getElementById("mailInstitucional").value,
    telefono: document.getElementById("telefono").value,
    fechaNacimiento: document.getElementById("fechaNacimiento").value,
    idGenero: document.getElementById("idGenero").value,
    idDepartamento: document.getElementById("idDepartamento").value,
    idLocalidad: document.getElementById("idLocalidad").value,
    idItr: document.getElementById("idItr").value,
    activo: document.getElementById("activo").value,
  };
}

// =============================
// EDITAR → carga datos al form
// =============================
async function editarUsuario(id) {
  const res = await fetch(`${API}/usuarios`);
  const usuarios = await res.json();
  const u = usuarios.find((x) => x.IDUSUARIO === id);

  document.getElementById("idUsuario").value = u.IDUSUARIO;
  document.getElementById("usuario").value = u.USUARIO;
  document.getElementById("documento").value = u.DOCUMENTO;
  document.getElementById("tipoUsuario").value = u.TIPO_USUARIO;
  document.getElementById("primerNombre").value = u.PRIMER_NOMBRE;
  document.getElementById("segundoNombre").value = u.SEGUNDO_NOMBRE;
  document.getElementById("primerApellido").value = u.PRIMER_APELLIDO;
  document.getElementById("segundoApellido").value = u.SEGUNDO_APELLIDO;
  document.getElementById("mailPersonal").value = u.MAIL_PERSONAL;
  document.getElementById("mailInstitucional").value = u.MAIL_INSTITUCIONAL;
  document.getElementById("telefono").value = u.TELEFONO;
  document.getElementById("fechaNacimiento").value = u.FECHA_NACIMIENTO;
  document.getElementById("idGenero").value = u.IDGENERO;
  document.getElementById("idDepartamento").value = u.IDDEPARTAMENTO;
  document.getElementById("idLocalidad").value = u.IDLOCALIDAD;
  document.getElementById("idItr").value = u.IDITR;
  document.getElementById("activo").value = u.ACTIVO;

  document.getElementById("formTitleUsuario").innerText = "✏ Editar Usuario";
  document.getElementById("submitBtnUsuario").innerText = "Guardar";
  document.getElementById("cancelBtnUsuario").style.display = "inline-block";
}

// =============================
// CANCELAR EDICIÓN
// =============================
function cancelarEdicionUsuario() {
  document.getElementById("usuarioForm").reset();
  document.getElementById("idUsuario").value = "";
  document.getElementById("formTitleUsuario").innerText = "➕ Agregar Usuario";
  document.getElementById("submitBtnUsuario").innerText = "Agregar";
  document.getElementById("cancelBtnUsuario").style.display = "none";
}

// =============================
// ELIMINAR
// =============================
async function eliminarUsuario(id) {
  if (!confirm("¿Seguro que deseas eliminar este usuario?")) return;
  await fetch(`${API}/usuarios/${id}`, { method: "DELETE" });
  obtenerUsuarios();
}
