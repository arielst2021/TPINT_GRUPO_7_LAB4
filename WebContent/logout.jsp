<%@page import="entidades.Profesor2"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ATRIBUTO SESSION DE LA DIRECTIVA PAGE-->
<%@page session="true"%>

<!-- EN CASO DE QUE EXISTA UNA SESION INICIADA REDIRECCIONO A ADMINISTRADOR.JSP O -->
<!-- PROFESOR.JSP, NO TIENE CASO MOSTRAR ESTE FORMULARIO CUANDO HAY UNA SESION INICIADA -->

<%!Profesor2 Profesor2 = new Profesor2();%>
<%
	if (session.getAttribute("perfil") != null) {
		Profesor2 = (Profesor2) session.getAttribute("perfil");
	} else {
		response.sendRedirect("inicio.jsp");
	}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<title>Logout</title>
<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>
<body class="bg-light">
	<div class="content">
		<div class="content-fluid">
			<nav style="background-color: #BEE5EB;">
				<div class="row">
					<div class="col-md-9 align-self-center">
						<!-- BARRA DE NAVEGACIÓN CON IMAGEN DE LOGOTIPO --ACA HAY QUE REDIRECCIONAR A LA PAGINA DE INICIO -->
						<div>
							<a href="#"></a> <img class="navbar-brand"
								src="Recursos/img/logo.png" alt="logo" width="40">
						</div>
					</div>
					<div class="col-md-2 align-self-center">
						<h6 class="h6 text-primary">

							<!-- USUARIO EN LA SESION -->

							<small><%=Profesor2.getPersona2().getNombre()%> <%=Profesor2.getPersona2().getApellido()%></small>
							<br>
							<small><%=Profesor2.getPerfil().getNombrePerfil()%> </small>
						</h6>
					</div>
					<div class="col-md-1 align-self-center">
						<button type="button" class="btn btn-primary btn-sm"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
							Salir</button>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- MODAL -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">¿Realmente
						desea Salir?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<!-- COMUNICACION CON EL SERVLET -->
				<form action="ServletControlador" method="post">
					<!-- SUBMIT -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cerrar</button>
						<input type="submit" class="btn btn-primary" value="Salir"
							name="btnSalirUsuario">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>