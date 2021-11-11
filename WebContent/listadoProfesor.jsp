
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


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



	<main id="main" class="main">
	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<p></p>
						<h5 class="card-title">Listado de docentes</h5>
						<hr>
						<!-- INICIO DE LA TABLA -->
						<table id="myTable" class="table table-striped"
							style="width: 100%">
							<thead>

								<tr>
								<th scope="col">Legajo</th>
								<th scope="col">Apellido y Nombre</th>
								<th scope="col">Dni</th>
								<th scope="col">Provincia</th>
								<th scope="col">Estado</th>
								<th scope="col">Fecha Nacimiento</th>
								<th scope="col">Acciones</th>							

								</tr>

							</thead>



							<tr>
									<td>1</td>
									<td>García Javier</td>
									<td>19452527</td>
									<td>Buenos Aires</td>
									<td>Activo</td>
									<td>29-01-1967</td>
							
											<td><input type="submit" name="btnObtenerAlumnosPorCurso"
												value="Estado"
												class="btn btn-sm btn-outline-primary waves-effect">
											<input type="submit" name="btnObtenerAlumnosPorCurso"
												value="Editar"
												class="btn btn-sm btn-outline-success waves-effect">
											<input type="submit" name="btnObtenerAlumnosPorCurso"
												value="Baja"
												class="btn btn-sm btn-outline-danger waves-effect"></td>
							</tr>

								<tr>
									<td>2</td>
									<td>Zambrano Carlos</td>
									<td>17828912</td>
									<td>La Plata</td>
									<td>Activo</td>
									<td>09-02-1978</td>

									<td>

										<form action="ServletControlador" method="post">


											<input type="submit" name="btnObtenerAlumnosPorCurso"
												value="Estado"
												class="btn btn-sm btn-outline-primary waves-effect">
											<input type="submit" name="btnObtenerAlumnosPorCurso"
												value="Editar"
												class="btn btn-sm btn-outline-success waves-effect">
											<input type="submit" name="btnObtenerAlumnosPorCurso"
												value="Baja"
												class="btn btn-sm btn-outline-danger waves-effect">
										</form>

									</td>

								</tr>


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