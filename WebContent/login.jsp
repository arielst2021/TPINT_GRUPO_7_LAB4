<%@page import="entidades.Profesor"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ATRIBUTO SESSION DE LA DIRECTIVA PAGE-->
<%@page session="true"%>

<!-- EN CASO DE QUE EXISTA UNA SESION INICIADA REDIRECCIONO A ADMINISTRADOR.JSP O -->
<!-- PROFESOR.JSP, NO TIENE CASO MOSTRAR ESTE FORMULARIO CUANDO HAY UNA SESION INICIADA -->

<%
	// EVITAR EL BOTON DE ATRAS
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	//
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
<title>Login</title>
	<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>
<body style="background-color: #F6F9FF">

	<script type="text/javascript">
    var msg = '<%=session.getAttribute("Mensaje")%>';
		if (msg != "null") {
			Swal.fire({
				title : '¡Error!',
				text : msg,
				icon : 'error',
				confirmButtonText : 'OK'
			})
		}
		<%session.setAttribute("Mensaje", null);%>
	</script>
	
<!-- INICIO MAIN  -->
<div id="main" class="main">
	<div class="container">

		<section
			class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
			<div class="container">
				<div class="row justify-content-center">
					<div
						class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

						<div class="card mb-3">

							<div class="card-body">

								<div class="pt-4 pb-2">
									<h5 class="card-title text-center pb-0 fs-4">Ingrese a su
										cuenta</h5>
									<p class="text-center small">Ingrese su nombre de usuario y
										contraseña para iniciar sesión</p>
								</div>

								<form action="InicioServlet" method="post">

									<div class="col-12">
										<label for="txtUsuario" class="form-label">Nombre de
											usuario</label>
										<div class="input-group has-validation">
											<input type="text" name="txtUsuario" class="form-control"
												id="txtUsuario" required>

										</div>
									</div>

									<div class="col-12">
										<label for="txtContrasenia" class="form-label">Contraseña</label>
										<input type="password" name="txtContrasenia"
											class="form-control" id="txtContrasenia" required>
									</div>

									<div class="col-12"></div>
									<br>
									<div class="col-12">
										<input class="btn btn-primary w-100" name="btnIngresarUsuario"
											type="submit" value="Acceder">
									</div>
									<div class="col-12"></div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>

		</section>

	</div>
</div>
<!-- FIN MAIN  -->

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
  
</body>
</html>