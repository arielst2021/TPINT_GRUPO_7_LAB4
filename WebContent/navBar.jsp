<%@page import="entidades.Profesor"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title></title>
<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>
<body class="bg-light">
	
	<form action="LoginServlet" method="get">	
	<%
			if (session.getAttribute("perfil") != null) {
			Profesor Profesor2 = new Profesor();
			Profesor2 = (Profesor) session.getAttribute("perfil");

			if (Profesor2.getPerfil().getId() == 1) {
				// ADMINISTRADOR
		%>
	<div class="navbar justify-content-center">
		<ul class="nav nav-pills">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
				role="button" aria-expanded="false">Alumnos</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">Alta</a></li>
					<li><a class="dropdown-item" href="#">Modificar</a></li>
					<li><a class="dropdown-item" href="#">Listar</a></li>
					<li><a class="dropdown-item" href="#">Baja</a></li>
				</ul></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
				role="button" aria-expanded="false">Profesores</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">Alta</a></li>
					<li><a class="dropdown-item" href="#">Modificar</a></li>
					<li><a class="dropdown-item" href="#">Listar</a></li>
					<li><a class="dropdown-item" href="#">Baja</a></li>
				</ul></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
				role="button" aria-expanded="false">Cursos</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">Alta</a></li>
				</ul></li>
		</ul>
	</div>

	<%
		}
			if (Profesor2.getPerfil().getId() == 2) {
				// PROFESOR
	%>
	<div class="navbar justify-content-center">
		<ul class="nav nav-pills">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
				role="button" aria-expanded="false">Cursos</a>
				<ul class="dropdown-menu">

						<li><a class="dropdown-item" href="ProfCursoServlet?Param=ObtenerCursosPorLegajoProfesor">Listado de cursos</a></li>
					
				</ul></li>
		</ul>
	</div>

	<%
		}
		}
	%>
	</form>
	
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
  
</body>
</html>