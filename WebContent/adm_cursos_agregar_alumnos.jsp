<%@page import="entidades.Alumno"%>
<%@page import="entidades.Curso"%>
<%@page import="entidades.Estado"%>
<%@page import="entidades.Materia"%>
<%@page import="entidades.Semestre"%>
<%@page import="entidades.Profesor"%>
<%@page import="java.util.*"%>
<%@page import="java.time.Year"%>
<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!Profesor Profesor = new Profesor();%>
<%!Curso curso = null;%>

<%
	if (session.getAttribute("perfil") != null) {
		Profesor = (Profesor) session.getAttribute("perfil");
	} else {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<!--
----------------------------------------------------
H E A D
---------------------------------------------------- -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cursos - Agregar Alumnos</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
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

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<form action="AdmCursoServlet" method="post">
					<!-- M A I N  -->
					<main id="main" class="main">
					<section class="section">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<%!Curso Curso = new Curso();%>
										<%
											// 							listaCursos

											Curso Curso = null;
											if (request.getAttribute("NuevoCurso") != null) {

												Curso = (Curso) request.getAttribute("NuevoCurso");
											}
										%>
										<%
											if (Curso != null) {
										%>
										<h5 class="card-title text-success"> Curso</h5>
										<hr>
										<div class="row">
											<div class="col-md-6 text-left">
												<div class="py-2">
													<div>
														<p>
															<input type="hidden" id="txtMateriaId" name="txtMateriaId" value="<%=Curso.getMateria().getId()%>">
															<input type="hidden" id="txtSemestreId" name="txtSemestreId" value="<%=Curso.getSemestre().getId()%>">
															<input type="hidden" id="txtAnio" name="txtAnio" value="<%=Curso.getAnio()%>">
															<input type="hidden" id="txtLegajoDocente" name="txtLegajoDocente" value="<%=Curso.getProfesor().getLegajo()%>">
															<strong>Materia: </strong><%=Curso.getMateria().getNombre().toString()%></p>
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
										
										if(CursoAlumnosLista.size() == 0){%>
										<br>
										<h5 class="text-primary align-middle text-center">Curso
											sin alumnos asignados</h5>
										<hr>
										<%	
									}
										else{
											
											%>

										<table id="myTable2" class="table table-striped"
											style="width: 100%">
											<thead>
												<tr>
													<th scope="col">Apellido y Nombre</th>

												</tr>
											</thead>

											<%
									if (CursoAlumnosLista != null) {
										for (Curso item : CursoAlumnosLista) {
								%>

											<tr>
												<td class="text-primary align-middle"><span
													class="text-uppercase fw-bold"><%=item.getAlumno().getPersona().getApellido()%>
												</span>, <%=item.getAlumno().getPersona().getNombre()%></td>


												<%}
										}
										}
									%>
											</tr>

										</table>









										<%
										}
								%>


										<br>
										<h5 class="card-title text-success">Agregar Alumnos</h5>
										<hr>
										<!-- INICIO DE LA TABLA CON LOS ALUMNOS QUE NO ESTAN EL EL CURSO -->

											<table id="myTable" class="table table-striped"
												style="width: 100%">
												<thead>
													<tr>
														<th scope="col">Apellido y Nombre</th>

														<th scope="col">Selecionar Alumno</th>
													</tr>
												</thead>
												<%
													ArrayList<Alumno> AlumnosNoEstanEnElCurso = null;
													if (request.getAttribute("AlumnosNoEstanEnElCurso") != null) {
														AlumnosNoEstanEnElCurso = (ArrayList<Alumno>) request.getAttribute("AlumnosNoEstanEnElCurso");
														
													}
												%>
												<%
													if (AlumnosNoEstanEnElCurso != null) {
														for (Alumno item : AlumnosNoEstanEnElCurso) {
												%>

												<tr>
													<td class="text-primary align-middle"><span
														class="text-uppercase fw-bold"><%=item.getPersona().getApellido()%>
													</span>, <%=item.getPersona().getNombre()%></td>

													<td><input type="checkbox" id="txtAlumnoLegajo" name="txtAlumnoLegajo"
														value="<%=item.getLegajo()%>"> Agregar Alumno</td>

													<%
														}
														}
													%>
												</tr>
												<tfoot>
													<tr>
														<th></th>

														<th><input type="submit"
															name="btnAgregarAlumnosAlCurso" class="btn btn-primary"
															style="float: right" value="Agregar Alumnos"></th>
													</tr>
												</tfoot>
											</table>
										





										<!-- FIN DE LA TABLA -->
									</div>
								</div>
							</div>
						</div>
					</section>
					</main>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- F O O T E R  -->
	<jsp:include page="footer.jsp"></jsp:include>






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
		$(document)
				.ready(
						function() {
							$('#myTable')
									.DataTable(
											{
												"language" : {
													"url" : "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
												}
											});
						});
	</script>
</body>
</html>