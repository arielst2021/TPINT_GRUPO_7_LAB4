<%-- <%@page import="entidades.Profesor2"%> --%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ATRIBUTO SESSION DE LA DIRECTIVA PAGE-->
<%@page session="true"%>

<!-- EN CASO DE QUE EXISTA UNA SESION INICIADA REDIRECCIONO A ADMINISTRADOR.JSP O -->
<!-- PROFESOR.JSP, NO TIENE CASO MOSTRAR ESTE FORMULARIO CUANDO HAY UNA SESION INICIADA -->

<!DOCTYPE html>
<html lang="es">
<head>
<title>Login</title>


<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">

</head>

<body class="bg-light">

	<main>
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

								<form action="ServletControlador" method="post">

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
	</main>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>