<%@page import="entidades.Curso"%>
<%@page import="entidades.Profesor2"%>
<%@page import="java.util.ArrayList"%>

<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!Profesor2 Profesor2 = new Profesor2();%>
<%
	if (session.getAttribute("perfil") != null) {
		Profesor2 = (Profesor2) session.getAttribute("perfil");
	} else {
		response.sendRedirect("index.jsp");
	}
%>
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
	<%
		if (session.getAttribute("perfil") != null) {
	%>
	<jsp:include page="logout.jsp"></jsp:include>
	<jsp:include page="navTabs.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="login.jsp"></jsp:include>
	<%
		}
	%>


	<main id="main" class="main">
	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<p><%=Profesor2.getPersona2().getNombre()%>
							<%=Profesor2.getPersona2().getApellido()%>
						</p>
						<h5 class="card-title">Mis Cursos</h5>
						<hr>
						<!-- INICIO DE LA TABLA -->
						<table id="myTable" class="table table-striped"
							style="width: 100%">
							<thead>
								<tr>
									<th scope="col">Cód.</th>
									<th scope="col">Materia</th>
									<th scope="col">Semestre</th>
									<th scope="col">Año</th>
									<th scope="col">Acciones</th>
								</tr>
							</thead>

							<%
								ArrayList<Curso> listarCursos = null;
								if (request.getAttribute("listaCursos") != null) {
									listarCursos = (ArrayList<Curso>) request.getAttribute("listaCursos");
								}
							%>

							<%
								if (listarCursos != null) {
									for (Curso item : listarCursos) {
							%>


							<tr>

								<td><%=item.getMateria().getId()%></td>
								<td><%=item.getMateria().getNombre()%></td>
								<td><%=item.getSemestre().getNombre()%></td>
								<td><%=item.getAnio()%></td>
								<td>
								
								<form action="ProfCursoServlet" method="post">
								    <input type="hidden" id="txtMateriaId" name="txtMateriaId" value="<%=item.getMateria().getId()%>">
								    <input type="hidden" id="txtMateriaNombre" name="txtMateriaNombre" value="<%=item.getMateria().getNombre()%>">
								    <input type="hidden" id="txtSemestreId" name="txtSemestreId" value="<%=item.getSemestre().getId()%>">
								    <input type="hidden" id="txtSemestreNombre" name="txtSemestreNombre" value="<%=item.getSemestre().getNombre()%>">
								    <input type="hidden" id="txtAnio" name="txtAnio" value="<%=item.getAnio()%>">
								    <input type="hidden" id="txtLegajo" name="txtLegajo" value="<%=Profesor2.getLegajo()%>">
								<input type="submit" name="btnObtenerAlumnosPorCurso" value="Ver Alumnos" class="btn btn-sm btn-outline-primary waves-effect">
								</form>
								
								</td>
							
							</tr>
							<%
									}
									}
								%>


						</table>
						<!-- FIN DE LA TABLA -->
					</div>
				</div>
			</div>
		</div>
	</section>
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