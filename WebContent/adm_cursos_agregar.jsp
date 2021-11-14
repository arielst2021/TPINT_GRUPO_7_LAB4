<%@page import="entidades.Curso"%>
<%@page import="entidades.Profesor"%>
<%@page import="entidades.Materia"%>
<%@page import="entidades.Semestre"%>
<%@page import="java.util.*"%>

<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!Profesor Profesor = new Profesor();%>
<%
	if (session.getAttribute("perfil") != null) {
		Profesor = (Profesor) session.getAttribute("perfil");
	} else {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Curso</title>

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
	<%
		if (session.getAttribute("perfil") != null) {
	%>
	<jsp:include page="logout.jsp"></jsp:include>
	<jsp:include page="navBar.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="login.jsp"></jsp:include>
	<%
		}
	%>

	<main id="main" class="main">
	<section class="section">
	<form action="AdmCursoServlet" method="post">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<p></p>
						<h5 class="card-title">Agregar Nuevo Curso</h5>
						<hr>

						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">Materia</label>
							<div class="col-sm-10">

								<%
				List<Materia> listaMaterias = null;
				if(request.getAttribute("listaMaterias")!=null)
				{
					listaMaterias = (List<Materia>) request.getAttribute("listaMaterias");
				}
				%>
								<select class="form-select" aria-label="Default select example" name="materiaSeleccionada">
									<%
				if(listaMaterias!=null)
					for(Materia item : listaMaterias) {
				%>
									<option value="<%=item.getId()%>"><%=item.getNombre()%></option>
									<%
				}
				%>
								</select>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">Semestre</label>
							<div class="col-sm-10">


								<%
				List<Semestre> listaSemestres = null;
				if(request.getAttribute("listaSemestres")!=null)
				{
					listaSemestres = (List<Semestre>) request.getAttribute("listaSemestres");
				}
				%>


								<select class="form-select" aria-label="Default select example" name="semestreSeleccionado">
									<%
				if(listaSemestres!=null)
					for(Semestre item : listaSemestres) {
				%>
									<option value="<%=item.getId()%>"><%=item.getNombre()%></option>
				<%
				}
				%>
								</select>
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">Año</label>
							<div class="col-sm-10">


								<select class="form-select" aria-label="Default select example" name="anioSeleccionado">
									<%
					for(int i =2010; i<=2050;i++) {
				%>
									<option><%=i%></option>
									<%
				}
				%>
								</select>
							</div>
						</div>
						<br>

						<h6 class="card-title">Seleccione un profesor</h6>
						<hr>
						<table id="myTable" class="table table-striped"
							style="width: 100%">
							<thead>
								<tr>
									<th scope="col">Leg.</th>
									<th scope="col">DNI</th>
									<th scope="col">Apellido y Nombre</th>
									<th scope="col">Seleccionar</th>
								</tr>
							</thead>

							<%
								ArrayList<Profesor> listaProfesores = null;
								if (request.getAttribute("listaProfesores") != null) {
									listaProfesores = (ArrayList<Profesor>) request.getAttribute("listaProfesores");
								}
							%>

							<%
								if (listaProfesores != null) {
									for (Profesor item : listaProfesores) {
							%>
							<tr>

								<td><%=item.getLegajo()%></td>
								<td><%=item.getPersona().getDni()%></td>
								<td><%=item.getPersona().getApellido()%>, <%=item.getPersona().getNombre()%></td>
								<td><input type="radio" name="profesorSeleccionado" value="<%=item.getLegajo()%>">
								</td>

							</tr>
							<%
									}
									}
								%>


						</table>
						<!-- FIN DE LA TABLA -->
						<br>
						<hr>
						<!-- BOTON DE AGREGAR-->
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label"></label>
							<div class="col-sm-10">

									<input type="submit" class="btn btn-primary"
										style="float: right" name="agregarNuevoCurso" value="Agregar nuevo curso">


							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
	</section>
	</main>
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