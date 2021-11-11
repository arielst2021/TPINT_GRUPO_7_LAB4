<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entidades.Alumno"%>
<%@page import="negocio.NegocioAlumno"%>
<%@page import="negocioImpl.NegocioAlumnoImpl"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Alumnos</title>
</head>

<body>
<%
	NegocioAlumno Na = new NegocioAlumnoImpl();
%>
 
 
 	<!--
----------------------------------------------------
N A V B A R
---------------------------------------------------- -->
	
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Lista de Alumnos</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
          <li class="breadcrumb-item">Administracion</li>
          <li class="breadcrumb-item active">Alumnos</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Lista de Alumnos</h5>
              <!-- Tabla -->
              <%
              ArrayList<Alumno> alumnoTodos = Na.obtenerAlumnosTodos();
              %>
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">Legajo</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Dni</th>
                    <th scope="col">Provincia</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Fecha Nacimiento</th>
                    <th scope="col">Modificar</th>
                  </tr>
                </thead>
                <tbody>
                  <% 
                  if(alumnoTodos != null)
                  {
                	  for (Alumno alum : alumnoTodos){
                     	 %>
                    	 <tr>

                    	 <td><%=alum.getLegajo()%></td>
                    	 <td><%=alum.getPersona2().getNombre()%> <%=alum.getPersona2().getApellido()%></td>
                    	 <td><%=alum.getPersona2().getDni()%></td>
                    	 <td><%=alum.getPersona2().getProvincia().getNombre()%></td>
                    	 <td><%=alum.getEstado().getNombre()%></td>
                    	 <td><%=alum.getPersona2().getFechaNacimiento() %></td>
                        <td>
                        	<form action="AlumnoServlet" method="post">
								<input type="hidden" id="txtLegajoAlumno" name="txtLegajoAlumno" value="<%=alum.getLegajo()%>" >
																
								<input type="submit" name="btnIrEditarAlumno" value="Datos" class="btn btn-warning">
							</form>
							<form action="AlumnoServlet" method="post">
								<input type="hidden" id="txtLegajoAlumno" name="txtLegajoAlumno" value="<%=alum.getLegajo()%>" >
																
								<input type="submit" name="btnEditarEstado" value="Estado" class="btn btn-danger">
							</form>
                        </td>
                    	 </tr> 	 
                     	<%}}else{ %><tr><td>No se han encontrado resultados.</td></tr><%}%>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </section>
  
    <!-- Modal Editar Estado Alumnos -->
    <div class="modal fade" id="estadoAlumnoModal" tabindex="-1">
      <div class="modal-dialog modal-md">
        <div class="modal-content">
          <div class="modal-body">
            <div class="card-body">
              <div class="pt-4 pb-2">
                <h5 class="card-title text-center pb-0 fs-4">Editar Estado</h5>
                <p class="text-center small">Información del alumno</p>
              </div>
              <div class="container text-center">
              <div class="row pb-2">
                <div class="col-4">Legajo</div>
                <div class="col-8">1</div>
              </div>

              <div class="row pb-2">
                <div class="col-4 label ">Nombre</div>
                <div class="col-8">Javier Gomez</div>
              </div>

              <div class="row pb-2">
                <div class="col-4 label">DNI</div>
                <div class="col-8">36666666</div>
              </div>

              <div class="row pb-2">
                <div class="col-4 label">Nacimiento</div>
                <div class="col-8">	09/06/1996</div>
              </div>

              <div class="row pb-2">
                <div class="col-4 label">Provincia</div>
                <div class="col-8">Buenos Aires</div>
              </div>

              <div class="row pb-2">
                <div class="col-4 label">Direccion</div>
                <div class="col-8">Calle 100</div>
              </div>

              <div class="row pb-2">
                <div class="col-4 label">Email</div>
                <div class="col-8">javiergomez@gmail.com</div>
              </div>

              <div class="row pb-2">
                <div class="col-4 label">Estado</div>
                <div class="col-8">
                  <select class="form-select" aria-label="Default select example">
                    <option selected>Activo</option>
                    <option value="1">Baja</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-danger">Modificar Estado</button>
          </div>
        </div>
      </div>
    </div>
  </main>

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      Trabajo practico <strong><span>Laboratorio 4</span></strong>
    </div>
  </footer>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
	src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
		<script>
//IDIOMAS ESPAÑOL DEL DATATABLE   
$(document).ready(function() {
	$('#myTable').DataTable({ 
	"language": {
		"url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
		}
	});
});
</script>
</body>

</html>
