<%@page import="entidades.Alumno"%>
<%@page import="entidades.Curso"%>
<%@page import="entidades.Profesor"%>
<%@page import="java.util.*"%>
<%@page import="java.time.Year"%>
<%@page session="true"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%!Profesor Profesor = new Profesor();%>
<%
	if (session.getAttribute("perfil") != null) {
		Profesor = (Profesor) session.getAttribute("perfil");
		if (Profesor.getPerfil().getId() == 2) {
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
	<title>Cursos - Agregar Alumnos</title>
	<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
	

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

	<script type="text/javascript">
    var msg = '<%=session.getAttribute("Mensaje")%>';
		if (msg != "null") {
			if (msg == '1' ) {
				Swal.fire({
					title : '¡Correcto!',
					text : "¡Curso agregado exitosamente!",
					icon : 'success',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '2' ) {
				Swal.fire({
					title : '¡Correcto!',
					text : "¡Alumno/s agregado/s exitosamente!",
					icon : 'success',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '0') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Hubo un error al intentar agregar el/los alumno/s al curso!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '-1') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Alumno/s duplicado/s, no se agregó/agregaron al curso!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
			}
			<%session.setAttribute("Mensaje", null);%>
		}
	</script>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<!-- INICIO FORM  -->
					<form action="AdmCursoServlet" id="formulario" method="post">
						<!-- M A I N  -->
						<main id="main" class="main">
							<section class="section">
								<div class="row">
									<div class="col-lg-12">
										<div class="card">
											<div class="card-body">
												<%!Curso Curso = null;%>
												<%
													if (request.getAttribute("NuevoCurso") != null) {
														Curso = (Curso) request.getAttribute("NuevoCurso");
													}
												%>
												<%
													if (Curso != null) {
												%>
												<h5 class="card-title text-success">Listado de alumnos
													en el curso</h5>
												<hr>
												<div class="row">
													<div class="col-md-6 text-left">
														<div class="py-2">
															<div>
																<p>
																	<input type="hidden" id="txtMateriaId"
																		name="txtMateriaId"
																		value="<%=Curso.getMateria().getId()%>"> <input
																		type="hidden" id="txtSemestreId" name="txtSemestreId"
																		value="<%=Curso.getSemestre().getId()%>"> <input
																		type="hidden" id="txtAnio" name="txtAnio"
																		value="<%=Curso.getAnio()%>"> <input
																		type="hidden" id="txtLegajoDocente"
																		name="txtLegajoDocente"
																		value="<%=Curso.getProfesor().getLegajo()%>"> <strong>Materia:
																	</strong><%=Curso.getMateria().getNombre().toString()%></p>
																<p>
																	<strong>Período: </strong><%=Curso.getSemestre().getNombre()%></p>
															</div>
														</div>
													</div>
													<div class="col-md-6 text-left">
														<div class="py-2">
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
												%>
	
												<!-- INICIO DE LA TABLA CON LOS ALUMNOS QUE ACTUALENTE ESTAN EN EL CURSO-->
												<%
													ArrayList<Curso> CursoAlumnosLista = null;
													if (request.getAttribute("CursoAlumnosLista") != null) {
														CursoAlumnosLista = (ArrayList<Curso>) request.getAttribute("CursoAlumnosLista");
	
														if (CursoAlumnosLista.size() == 0) {
												%>
												<br>
												<h5 class="text-primary align-middle text-center">Curso
													sin alumnos asignados</h5>
												<br>
												<hr>
												<%
													} else {
												%>
	
												<table id="myTable1"
													class="table table-striped table-hover border-success"
													style="width: 100%">
													<thead class="table-success">
														<tr>
															<th scope="col">Apellido y Nombre</th>
															<th scope="col" class=" text-center">Nro. Legajo</th>
															<th scope="col" class=" text-center">DNI</th>
															<th scope="col" class=" text-center">Estado</th>
	
														</tr>
													</thead>
													<%
														if (CursoAlumnosLista != null) {
																	for (Curso item : CursoAlumnosLista) {
													%>
													<tr>
														<td class="text-success align-middle"><span
															class="text-uppercase fw-bold"><%=item.getAlumno().getPersona().getApellido()%>
														</span>, <%=item.getAlumno().getPersona().getNombre()%></td>
														<td class="align-middle text-center"><%=item.getAlumno().getLegajo()%></td>
														<td class="align-middle text-center"><%=item.getAlumno().getPersona().getDni()%></td>
														<%
															if (item.getAlumno().getEstado().getNombre().equals("Activo")) {
														%>
														<td class="align-middle text-center"><span
															class="badge bg-success text-wrap"><%=item.getAlumno().getEstado().getNombre()%></span></td>
														<%
															} else {
														%>
														<td class="align-middle text-center"><span
															class="badge bg-danger text-wrap"><%=item.getAlumno().getEstado().getNombre()%></span></td>
														<%
															}
																		}
																	}
																}
														%>
													</tr>
												</table>
												<%
													}
												%>
	
	
												<br>
												<h5 class="card-title text-primary">Agregar Alumnos</h5>
												<hr>
												<!-- INICIO DE LA TABLA CON LOS ALUMNOS QUE NO ESTAN EL EL CURSO -->
												<%
													ArrayList<Alumno> AlumnosNoEstanEnElCurso = null;
													if (request.getAttribute("AlumnosNoEstanEnElCurso") != null) {
														AlumnosNoEstanEnElCurso = (ArrayList<Alumno>) request.getAttribute("AlumnosNoEstanEnElCurso");
	
														if (AlumnosNoEstanEnElCurso.size() == 0) {
												%>
												<br>
												<h5 class="text-primary align-middle text-center">No
													existen alumnos que puedan ser asignados a este curso</h5>
												<br>
												<hr>
												<%
													} else {
												%>
												<table id="myTable"
													class="table table-striped table-hover border-primary"
													style="width: 100%">
													<thead class="table-primary">
														<tr>
															<th scope="col">Apellido y Nombre</th>
															<th scope="col" class=" text-center">Nro. Legajo</th>
															<th scope="col" class=" text-center">DNI</th>
															<th scope="col" class=" text-center">Estado</th>
	
															<th scope="col" class=" text-center">Seleccionar</th>
														</tr>
													</thead>
	
													<%
														if (AlumnosNoEstanEnElCurso != null) {
																	for (Alumno item : AlumnosNoEstanEnElCurso) {
													%>
	
													<tr>
														<td class="align-middle"><span
															class="text-primary text-uppercase fw-bold"><%=item.getPersona().getApellido()%></span>,
															<span class="text-primary"><%=item.getPersona().getNombre()%></span>
														</td>
	
														<td class="align-middle text-center"><%=item.getLegajo()%></td>
														<td class="align-middle text-center"><%=item.getPersona().getDni()%></td>
														<%
															if (item.getEstado().getNombre().equals("Activo")) {
														%>
														<td class="align-middle text-center"><span
															class="badge bg-success text-wrap"><%=item.getEstado().getNombre()%></span></td>
														<%
															} else {
														%>
														<td class="align-middle text-center"><span
															class="badge bg-danger text-wrap"><%=item.getEstado().getNombre()%></span></td>
														<%
															}
														%>
														<td class=" text-center"><input type="checkbox"
															id="txtAlumnoLegajo" name="txtAlumnoLegajo"
															class="checkbox checkbox-success"
															value="<%=item.getLegajo()%>"></td>
	
														<%
															}
																	}
																}
															}
														%>
													</tr>
	
													<tfoot>
	
													</tfoot>
												</table>
												<!-- FIN DE LA TABLA -->
												<br> <input type="submit" id="btnAgregarAlumnosAlCurso"
													name="btnAgregarAlumnosAlCurso" class="btn btn-primary"
													style="float: right" value="Agregar Alumnos">
											</div>
										</div>
									</div>
								</div>
							</section>
						</main>
						<!-- FIN FORM -->
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- F O O T E R  -->
	<jsp:include page="footer.jsp"></jsp:include>

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
												pageLength : 5,
												lengthMenu : [
														[ 5, 10, 20, -1 ],
														[ 5, 10, 20, "Todos" ] ],
												"language" : {
													"url" : "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
												}
											});
						});
	</script>

<script type="text/javascript">
function onSubmit() 
{ 
  var fields = $("input[name='txtAlumnoLegajo']").serializeArray(); 
  if (fields.length == 0) 
  {
	  Swal.fire({
		title : '¡Error!',
		text : "¡Debe seleccionar al menos un alumno para agregar al curso!",
		icon : 'error',
		confirmButtonText : 'OK'
		})
    return false;
  } 
  else 
  { 
    return true; 
  }
}

//REGISTRA EL EVENTO EN EL FORMULARIO, NO EL BOTÓN DE ENVIAR
$('#formulario').submit(onSubmit)

</script>

</body>
</html>