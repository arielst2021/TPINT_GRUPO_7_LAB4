<%@page import="entidades.Profesor"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ATRIBUTO SESSION DE LA DIRECTIVA PAGE-->
<%@page session="true"%>

<!-- EN CASO DE QUE EXISTA UNA SESION INICIADA REDIRECCIONO A ADMINISTRADOR.JSP O -->
<!-- PROFESOR.JSP, NO TIENE CASO MOSTRAR ESTE FORMULARIO CUANDO HAY UNA SESION INICIADA -->

<%
	if (session.getAttribute("perfil") != null) {
	Profesor Profesor = new Profesor();
	Profesor = (Profesor) session.getAttribute("perfil");

	if (Profesor.getPerfil().getId() == 1) {
		//REDIRIGIR A PAGINA ADMINISTRADOR -->
		response.sendRedirect("adm_inicio.jsp");
	}
	if (Profesor.getPerfil().getId() == 2) {
		//REDIRIGIR A PAGINA DOCENTE -->
		response.sendRedirect("prof_inicio.jsp");
	}
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="TRABAJO FINAL LAB 4 2021" content="">
<title>TRABAJO FINAL LAB 4 2021</title>
<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />

</head>

<body style="background-color: #F6F9FF">

<!-- N A V B A R -->
	<%
		if (session.getAttribute("perfil") != null) {
			response.sendRedirect("logout.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
	%>

<!-- N A V B A R -->

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
	
</body>
</html>