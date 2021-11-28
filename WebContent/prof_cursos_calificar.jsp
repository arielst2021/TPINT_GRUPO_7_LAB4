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
	<title>Calificar Alumnos</title>
	<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />

</head>

<script type="text/javascript">
	function valideKey(evt) {

		// EL CÓDIGO ES LA REPRESENTACIÓN DECIMAL ASCII DE LA TECLA PRESIONADA.
		var code = (evt.which) ? evt.which : evt.keyCode;

		if (code == 46) { // PUNTO
			return true;
		} else if (code >= 48 && code <= 57) { // ES NUMERO.
			return true;
		} else { // OTRAS TECLAS.
			return false;
		}
	}
</script>

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
					text : "¡Notas/s agregada/s o modificada/s exitosamente!",
					icon : 'success',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '0') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Hubo un error al intentar agregar Nota/s al curso!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '-1') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Nota/s duplicada/s, no se agregó/agregaron Notas!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
			}			
		}
		<%session.setAttribute("Mensaje", null);%>
	</script>
	
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">

					<!-- M A I N  -->
					<main id="main" class="main">
						<section class="section">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
										<form action="ProfCursoServlet" method="post">
											<%!Curso Curso = new Curso();%>
											<%
												if (session.getAttribute("DatosDelCurso") != null) {
													Curso = (Curso) session.getAttribute("DatosDelCurso");
												}
											%>
											<h3 class="card-title text-primary">Calificaciones de los
												alumnos</h3>
											<hr>
											<div class="row">
												<div class="col-md-6 text-left">
	
													<div>
	
														<strong class="text-success">Materia: </strong><%=Curso.getMateria().getNombre()%>
														<br> <strong class="text-success">Período: </strong><%=Curso.getSemestre().getNombre()%>
													</div>
	
												</div>
												<div class="col-md-6 text-left">
	
													<div>
	
														<strong class="text-success">Año: </strong><%=Curso.getAnio()%>
														<br> <strong class="text-success">Profesor/a:
														</strong><%=Profesor.getPersona().getNombre()%>
														<%=Profesor.getPersona().getApellido()%>
													</div>
													
													<!-- OBTENGO LOS DATOS DEL CURSO -->
														<input type="hidden" id="txtMateriaId" name="txtMateriaId" value="<%=Curso.getMateria().getId()%>">
														<input type="hidden" id="txtSemestreId" name="txtSemestreId" value="<%=Curso.getSemestre().getId()%>">
														<input type="hidden" id="txtAnio" name="txtAnio" value="<%=Curso.getAnio()%>">
														<input type="hidden" id="txtLegajoDocente" name="txtLegajoDocente" value="<%=Profesor.getLegajo()%>">
												</div>
											</div>
											<hr>
											<!-- INICIO DE LA TABLA -->
												<table id="myTable"
													class="table table-striped table-hover border-success table-fit"
													style="width: 100%">
													<thead class="table-success">
														<tr>
															<th style="width: 40%" scope="col">Apellido y Nombre</th>
															<th style="width: 10%" scope="col">Parcial 1</th>
															<th style="width: 10%" scope="col">Recup. 1</th>
															<th style="width: 10%" scope="col">Parcial 2</th>
															<th style="width: 10%" scope="col">Recup. 2</th>
															<th style="width: 20%" scope="col">Estado</th>
														</tr>
													</thead>
													<%
														ArrayList<Curso> listaAlumnosPorCursos = null;
														if (request.getAttribute("listaAlumnosPorCursos") != null) {
															listaAlumnosPorCursos = (ArrayList<Curso>) request.getAttribute("listaAlumnosPorCursos");
														}
													%>
													<%
														if (listaAlumnosPorCursos != null) {
															for (Curso item : listaAlumnosPorCursos) {
													%>
	
													<tr>
														<td class="text-primary align-middle">
														<!-- OBTENGO EL LEGAJO DEL ALUMNO -->
														<input type="hidden" id="txtLegajoAlumno" name="txtLegajoAlumno" value="<%=item.getAlumno().getLegajo()%>">
														<span class="text-uppercase fw-bold"><%=item.getAlumno().getPersona().getApellido()%></span>, <%=item.getAlumno().getPersona().getNombre()%></td>
	
														<!-- AGREGO UN JAVASCRIPT PARA PERMITIR EL INGRESO DE VALORES NUMÉRICOS Y UN DISEÑO DE PATRÓN DE ETIQUETAS HTML PARA SOLO VALORES NUMÉRICOS  -->
														<!-- EL ATRIBUTO PATTERN ESPECIFICA UNA EXPRESIÓN REGULAR CON LA QUE <INPUT>SE VERIFICA EL VALOR DEL ELEMENTO AL ENVIAR EL FORMULARIO. -->
	
														<td class="align-middle text-center"><input
															type="text" id="nota" name="Nota1" class="form-control"
															onkeypress="return valideKey(event)"
															pattern="^\d{1,2}+(\.\d{1})?$"
															value="<%=item.getNotaPrimerParcial()%>"></td>
														<td class="text-center"><input type="text" id="nota"
															name="Nota2" class="form-control"
															onkeypress="return valideKey(event)"
															pattern="^\d{1,2}+(\.\d{1})?$"
															value="<%=item.getNotaPrimerRecuperatorio()%>"></td>
														<td class="text-center"><input type="text" id="nota"
															name="Nota3" class="form-control"
															onkeypress="return valideKey(event)"
															pattern="^\d{1,2}+(\.\d{1})?$"
															value="<%=item.getNotaSegundoParcial()%>"></td>
														<td class="text-center"><input type="text" id="nota"
															name="Nota4" class="form-control"
															onkeypress="return valideKey(event)"
															pattern="^\d{1,2}+(\.\d{1})?$"
															value="<%=item.getNotaSegundoRecuperatorio()%>"></td>
														<td class="text-center"><select
															class="form-select form-select selectpicker"
															name="estadoAlumno">
																<%
																	ArrayList<Estado> listaEstados = null;
																			if (request.getAttribute("listaEstados") != null) {
																				listaEstados = (ArrayList<Estado>) request.getAttribute("listaEstados");
																			}
																%>
																<%
																	if (listaAlumnosPorCursos != null) {
																				for (Estado item2 : listaEstados) {
																					if (item2.getNombre().equals("Libre") || item2.getNombre().equals("Regular")
																							|| item2.getNombre().equals("Sin calificar")) {
	
																						// POR MEDIO DEL ATRIBUTO SELECTED ESTABLEZCO LA OPCIÓN INICIALMENTE SELECCIONADA
																%>
																<option value="<%=item2.getId()%>"
																	<%if (item.getEstado().getId() == item2.getId()) {%>
																	selected <%}%>><%=item2.getNombre()%></option>
																<%
																	}
																				}
																			}
																%>
														</select></td>
														<%
															}
															}
														%>
													</tr>
												</table>
												<br>
												<hr>
												<input type="submit" name="btnGuardarNotas"
													class="btn btn-primary" style="float: right" value="Guardar">
											</form>
											<!-- FIN DE LA TABLA -->
										</div>
									</div>
								</div>
							</div>
						</section>
					</main>
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
	      pageLength: 5,
	      lengthMenu: [[5, 10, 20, -1], [5, 10, 20, "Todos"]],
	"language": {
		"url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
		}
	});
});
</script>

</body>
</html>