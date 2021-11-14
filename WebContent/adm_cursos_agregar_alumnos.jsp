<%@page import="entidades.Curso"%>
<%@page import="entidades.Estado"%>
<%@page import="entidades.Materia"%>
<%@page import="entidades.Semestre"%>
<%@page import="entidades.Profesor"%>
<%@page import="java.util.*"%>
<%@page import="java.time.Year"%>
<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!Profesor Profesor = new Profesor();%>
<%!Curso curso = null;%>

<%
	if (session.getAttribute("perfil") != null) {
		Profesor = (Profesor) session.getAttribute("perfil");
	} else {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<!--
----------------------------------------------------
H E A D
---------------------------------------------------- -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cursos - Agregar Alumnos</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>

<script type="text/javascript">
	function valideKey(evt) {

		// EL CÓDIGO ES LA REPRESENTACIÓN DECIMAL ASCII DE LA TECLA PRESIONADA.
		var code = (evt.which) ? evt.which : evt.keyCode;

		if (code == 46) { // PUNTO
			return true;
		} else if (code >= 48 && code <= 57) { // ES NUMERO.
			return true;
		} else { // OTRAS TECLAS.
			return false;
		}
	}
</script>

</head>
<!--
----------------------------------------------------
B O D Y
---------------------------------------------------- -->
<body style="background-color: #F6F9FF">

	<!-- N A V B A R  -->
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

	<!-- M A I N  -->
	<main id="main" class="main">
	<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<%!Curso Curso = new Curso();%>
						<%
							// 							listaCursos

							Curso Curso = null;
							if (request.getAttribute("NuevoCurso") != null) {														
								
								Curso = (Curso) request.getAttribute("NuevoCurso");
							}
						%>
						<% 						
						if (Curso != null) {

						%>
						<div class="row bg-light">
							<div class="col-md-6 text-left">
								<div class="bg-light py-2">
									<div>
										<p>
											<strong>Materia: </strong><%=Curso.getMateria().getNombre().toString() %></p>
										<p>
											<strong>Período: </strong><%=Curso.getSemestre().getNombre()%></p>
									</div>
								</div>
							</div>
							<div class="col-md-6 text-left">
								<div class="bg-light py-2">
									<div>
										<p>
											<strong>Año: </strong><%=Curso.getAnio()%></p>
										<p>
											<strong>Profesor/a: </strong><%=Curso.getProfesor().getPersona().getNombre()%>
											<%=Curso.getProfesor().getPersona().getApellido()%></p>
									</div>
								</div>
							</div>
						</div>
						<%
								}
// 							}
						%>
						<br>
						<h5 class="card-title">Calificaciones de los alumnos</h5>
						<hr>
						<!-- INICIO DE LA TABLA -->
						<form action="ProfCursoServlet" method="post">






						</form>
						<!-- FIN DE LA TABLA -->
					</div>
				</div>
			</div>
		</div>
	</section>
	</main>
	<!-- F O O T E R  -->

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
		$(document)
				.ready(
						function() {
							$('#myTable')
									.DataTable(
											{
												"language" : {
													"url" : "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
												}
											});
						});
	</script>
</body>
</html>