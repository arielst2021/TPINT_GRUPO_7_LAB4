<%@page import="entidades.Profesor"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ATRIBUTO SESSION DE LA DIRECTIVA PAGE-->
<%@page session="true"%>

<!-- EN CASO DE QUE EXISTA UNA SESION INICIADA REDIRECCIONO A ADMINISTRADOR.JSP O -->
<!-- PROFESOR.JSP, NO TIENE CASO MOSTRAR ESTE FORMULARIO CUANDO HAY UNA SESION INICIADA -->

<%!Profesor Profesor = new Profesor();%>
<%
	if (session.getAttribute("perfil") != null) {
		Profesor = (Profesor) session.getAttribute("perfil");
		if (Profesor.getPerfil().getId() == 2) {
			//REDIRIGIR A PAGINA PROFESOR
			response.sendRedirect("prof_inicio.jsp");
		}
	} else {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrador</title>
<!--
----------------------------------------------------
	 C S S - BOOTSTRAP, CUSTOM STYLES 
---------------------------------------------------- -->
<link rel="stylesheet" type="text/css"
	href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>
<body class="bg-light">

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
		}
	%>

	<div class="w3-display-middle w3-margin-top w3-center">
		<h3>ADMINISTRADOR</h3>
		<h1 CLASS="text-primary"><%=Profesor.getPersona().getNombre()%>
			<%=Profesor.getPersona().getApellido()%></h1>
	</div>

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