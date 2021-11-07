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
	<jsp:include page="logout.jsp"></jsp:include>
	<jsp:include page="navTabs.jsp"></jsp:include>

	<!-- ======= Sidebar ======= -->

	<!-- End Sidebar-->

	<main id="main" class="main">
	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<p>Profesor/a: Usuario Logueado</p>
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
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Geografía I</td>
									<td>1er. Semestre</td>
									<td>2020</td>
									<td><button type="submit" class="btn btn-sm btn-primary">Ver
											Alumnos</button></td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Formación Cívica</td>
									<td>2do. Semestre</td>
									<td>2021</td>
									<td><button type="submit" class="btn btn-sm btn-primary">Ver
											Alumnos</button></td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Formación Cívica</td>
									<td>1er. Semestre</td>
									<td>2019</td>
									<td><button type="submit" class="btn btn-sm btn-primary">Ver
											Alumnos</button></td>
								</tr>
								<tr>
									<th scope="row">1</th>
									<td>Geografía I</td>
									<td>1do. Semestre</td>
									<td>2018</td>
									<td><button type="submit" class="btn btn-sm btn-primary">Ver
											Alumnos</button></td>
								</tr>
								<tr>
									<th scope="row">5</th>
									<td>Historia</td>
									<td>1er. Semestre</td>
									<td>2019</td>
									<td><button type="submit" class="btn btn-sm btn-primary">Ver
											Alumnos</button></td>
								</tr>

								<tr>
									<th scope="row">6</th>
									<td>Geografía II</td>
									<td>2do. Semestre</td>
									<td>2020</td>
									<td><button type="submit" class="btn btn-sm btn-primary">Ver
											Alumnos</button></td>
								</tr>

							</tbody>
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

	<!-- End Footer -->
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