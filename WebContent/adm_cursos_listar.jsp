<%@page import="entidades.Curso"%>
<%@page import="entidades.Profesor"%>
<%@page import="java.util.ArrayList"%>

<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!Profesor Profesor = new Profesor();%>
<%
	if (session.getAttribute("perfil") != null) {
		Profesor = (Profesor) session.getAttribute("perfil");
		if (Profesor.getPerfil().getId() == 2) {
			//REDIRIGIR A PAGINA DOCENTE -->
			response.sendRedirect("index.jsp");
		}
	} else {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Listado de cursos</title>
	<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>

<body style="background-color: #F6F9FF">

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

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">

				<!-- INICIO MAIN  -->
				<div id="main" class="main">
					<section class="section">
						<div class="row">
							<div class="col-lg-12">

								<div class="card">
									<div class="card-body">
										<h3 class="card-title text-primary">Listado de Cursos</h3>
										<hr>
										<!-- INICIO DE LA TABLA -->
										<table id="myTable" class="table table-striped table-hover border-success" style="width: 100%">
										<thead class="table-success">
												<tr>
													<th scope="col">Cód.</th>
													<th scope="col">Materia</th>
													<th scope="col">Semestre</th>
													<th scope="col">Docente</th>
													<th scope="col">Año</th>
													<th scope="col">Acciones</th>
												</tr>
											</thead>
<%! @SuppressWarnings("unchecked") %>
											<%
												ArrayList<Curso> listarCursos = null;
												if (request.getAttribute("listaCursos") != null) {
													listarCursos = (ArrayList<Curso>) request.getAttribute("listaCursos");
												}
											%>

											<%
												if (listarCursos != null) {
													for (Curso item : listarCursos) {
											%>


											<tr>

												<td class="align-middle"><%=item.getMateria().getId()%></td>
												<td class="align-middle"><%=item.getMateria().getNombre()%></td>
												<td class="align-middle"><%=item.getSemestre().getNombre()%></td>																						
												<td class="text-primary align-middle"><span class="text-uppercase fw-bold"><%=item.getProfesor().getPersona().getApellido()%></span>, <%=item.getProfesor().getPersona().getNombre()%></td>
												<td class="align-middle"><%=item.getAnio()%></td>
												<td>

													<form action="AdmCursoServlet" method="post">
														<input type="hidden" id="txtMateriaId" name="txtMateriaId"
															value="<%=item.getMateria().getId()%>"> <input
															type="hidden" id="txtMateriaNombre"
															name="txtMateriaNombre"
															value="<%=item.getMateria().getNombre()%>"> <input
															type="hidden" id="txtSemestreId" name="txtSemestreId"
															value="<%=item.getSemestre().getId()%>"> <input
															type="hidden" id="txtSemestreNombre"
															name="txtSemestreNombre"
															value="<%=item.getSemestre().getNombre()%>"> <input
															type="hidden" id="txtAnio" name="txtAnio"
															value="<%=item.getAnio()%>"> <input type="hidden"
															id="txtProfesorLegajo" name="txtProfesorLegajo"
															value="<%=item.getProfesor().getLegajo()%>"> <input
															type="hidden" id="txtProfesorApellido"
															name="txtProfesorApellido"
															value="<%=item.getProfesor().getPersona().getApellido()%>">
														<input type="hidden" id="txtProfesorNombre"
															name="txtProfesorNombre"
															value="<%=item.getProfesor().getPersona().getNombre()%>">
														<input type="submit" name="btnAgregarAlumnos"
															value="Agregar Alumnos"
															class="btn btn-primary">
													</form>

												</td>

											</tr>
											<%
												}
												}
											%>


										</table>
										<!-- FIN DE LA TABLA -->
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				<!-- FIN MAIN -->

				</div>
			</div>
		</div>
	</div>

	<!-- F O O T E R  -->
	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>

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