<%@page import="entidades.Profesor2"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title></title>
<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">

</head>
<body class="bg-light">
	
	<form action="ServletControlador" method="get">	
	<%
		if (session.getAttribute("perfil") != null) {
			Profesor2 Profesor2 = new Profesor2();
			Profesor2 = (Profesor2) session.getAttribute("perfil");

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

						<li><a class="dropdown-item" href="ServletControlador?Param=ObtenerCursosPorLegajoProfesor">Listado</a></li>
					
				</ul></li>
		</ul>
	</div>

	<%
		}
		}
	%>
	</form>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

</body>
</html>