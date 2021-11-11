<%@page import="entidades.Alumno"%>
<%@page import="entidades.Provincia"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.*"%>
<%@page session="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mis Cursos</title>
<!--
----------------------------------------------------
	 C S S - BOOTSTRAP, CUSTOM STYLES 
---------------------------------------------------- -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>

<body style="background-color: #F6F9FF">
	<!--
----------------------------------------------------
N A V B A R
---------------------------------------------------- -->
	<main id="main" class="main">
	<div class="container">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Editar Alumno</h5>
					<hr>
					<!-- INICIO DE LA TABLA -->
					<form action="AlumnoServlet" method="post">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<h5 class="card-title text-center pb-0 fs-4">Editar
								Información</h5>
							<p class="text-center small">Información del alumno</p>
						</div>
						<div class="container text-center">
							<% if(request.getAttribute("AlumnoEditar") != null){
            	 				 Alumno alum = (Alumno) request.getAttribute("AlumnoEditar");
            	  			%>
							<div class="row pb-4">
								<div class="col-4">Legajo</div>
								<div class="col-8"><%=alum.getLegajo()%></div>
								<input type="hidden" name="txtLegajo" class="form-control" value=<%=alum.getLegajo()%>>
								
							</div>
							<div class="row pb-2">
								<div class="col-4 label ">Nombre</div>
								<div class="col-8"><input type="text" name="txtNombre" class="form-control" required value=<%=alum.getPersona2().getNombre()%>></div>
							</div>
							<div class="row pb-2">
								<div class="col-4 label ">Apellido</div>
								<div class="col-8"><input type="text" name="txtApellido" class="form-control" required value=<%=alum.getPersona2().getApellido()%>></div>
							</div>
							<div class="row pb-2">
								<div class="col-4 label ">DNI</div>
								<div class="col-8"><input type="text" name="txtDni" class="form-control" required value=<%=alum.getPersona2().getDni()%>></div>
							</div>
							<div class="row pb-2">
								<div class="col-4 label ">Nacimiento</div>
								<div class="col-8">
									<input type="text" name="txtNacimiento" class="form-control" required value="<%=alum.getPersona2().getFechaNacimiento().getDayOfMonth()%>-<%=alum.getPersona2().getFechaNacimiento().getMonthValue()%>-<%=alum.getPersona2().getFechaNacimiento().getYear()%>" ></div>
							</div>
							<div class="row pb-2">
								<div class="col-4 label">Provincia</div>
								<div class="col-8">
									<select class="form-select" aria-label="Default select example" name="txtProvincia">	
										<!-- CARGA PROVINCIAS -->
										<% 		 
										ArrayList<Provincia> lista = null;
			  							if (request.getAttribute("listarProvincias") != null) {
			  								lista =  (ArrayList<Provincia>) request.getAttribute("listarProvincias");
			  								}%><%
										if (lista != null) {for (Provincia prov : lista) {%>
										<option value="<%=prov.getId()%>"><%=prov.getNombre()%></option><%}}%>
									</select>
								</div>
							</div>
							<div class="row pb-2">
								<div class="col-4 label">Direccion</div>
								<div class="col-8">
									<input type="text" class="form-control" name="txtDireccion" required value=<%=alum.getPersona2().getDireccion()%>></div>
							</div>
							<div class="row pb-2">
								<div class="col-4 label">Telefono</div>
								<div class="col-8">
									<input type="text" class="form-control" name="txtTelefono" required value=<%=alum.getPersona2().getTelefono()%>></div>
							</div>

							<div class="row pb-2">
								<div class="col-4 label">Email</div>
								<div class="col-8">
								
									<input type="text" class="form-control" name="txtEmail" required value=<%=alum.getPersona2().getEmail()%>></div>
							</div><%
              }else
              {%><div>No se ha encontrado el alumno.</div>
							<%}%>

							<div class="row pb-2">
								<div class="col-4 label">Estado</div>
								<div class="col-8">
									<select class="form-select" aria-label="Default select example" name="txtEstado">
										<option selected value="1">Activo</option>
										<option value="2">Baja</option>
									</select>
								</div>
							</div>
						</div>
						<button class="btn btn-primary" type="submit" name="btnCancelarEditarAlumno">Cancelar</button>
						<button class="btn-danger" type="submit"  name="btnEditarAlumno">Guardar Cambios</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->

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