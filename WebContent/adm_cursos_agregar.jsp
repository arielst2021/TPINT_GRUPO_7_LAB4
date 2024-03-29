<%@page import="entidades.Curso"%>
<%@page import="entidades.Profesor"%>
<%@page import="entidades.Materia"%>
<%@page import="entidades.Semestre"%>
<%@page import="java.util.*"%>

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
<head>
	<title>Agregar Curso</title>	
	<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>

<body style="background-color: #F6F9FF">

<!-- N A V B A R -->
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
					title : '�Correcto!',
					text : "�Curso agregado exitosamente!",
					icon : 'success',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '0') {
				Swal.fire({
					title : '�Error!',
					text : "�Hubo un error al intentar agregar el curso!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
				<%session.setAttribute("Mensaje", null);%>
			}
			if (msg == '-1') {
				Swal.fire({
					title : '�Error!',
					text : "�Curso duplicado, no se agreg� el curso!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
				<%session.setAttribute("Mensaje", null);%>
			}
		}
	</script>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">

				<!-- INICIO MAIN  -->
				<div id="main" class="main">
					<section class="section">
						<form action="AdmCursoServlet" id="formulario" method="post">
							<div class="row">
								<div class="col-lg-12">

									<div class="card">
										<div class="card-body">
												<h3 class="card-title text-primary">Agregar Curso</h3>
											<hr>

											<div class="row mb-3">
												<label class="col-sm-2 col-form-label">Materia</label>
												<div class="col-sm-10">
<%! @SuppressWarnings("unchecked") %>
													<%
														List<Materia> listaMaterias = null;
														if (request.getAttribute("listaMaterias") != null) {
															listaMaterias = (List<Materia>) request.getAttribute("listaMaterias");
														}
													%>
													<select class="form-select"
														aria-label="Default select example" name="txtMateriaId">
														<%
															if (listaMaterias != null)
																for (Materia itemMateria : listaMaterias) {
														%>
														<option value="<%=itemMateria.getId()%>"><%=itemMateria.getNombre()%></option>
														<%
															}
														%>
													</select>
												</div>
											</div>

											<div class="row mb-3">
												<label class="col-sm-2 col-form-label">Semestre</label>
												<div class="col-sm-10">


													<%
														List<Semestre> listaSemestres = null;
														if (request.getAttribute("listaSemestres") != null) {
															listaSemestres = (List<Semestre>) request.getAttribute("listaSemestres");
														}
													%>


													<select class="form-select"
														aria-label="Default select example" name="txtSemestreId">
														<%
															if (listaSemestres != null)
																for (Semestre itemSemestre : listaSemestres) {
														%>
														<option value="<%=itemSemestre.getId()%>"><%=itemSemestre.getNombre()%></option>
														<%
															}
														%>
													</select>
												</div>
											</div>

											<div class="row mb-3">
												<label for="inputText" class="col-sm-2 col-form-label">A�o</label>
												<div class="col-sm-10">


													<select class="form-select"
														aria-label="Default select example" name="txtAnio">
														<%
															for (int i = 2010; i <= 2050; i++) {
														%>
														<option><%=i%></option>
														<%
															}
														%>
													</select>
												</div>
											</div>
											<br>

											<h5 class="card-title text-success">Seleccione un profesor</h5>
											<hr>
											<table id="myTable" class="table table-striped table-hover border-success"
												style="width: 100%">
												<thead class="table-success">
													<tr>
														<th scope="col" class="text-left">Apellido y Nombre</th>
														<th scope="col" class="text-center">Nro. Legajo</th>
														<th scope="col" class="text-center">DNI</th>
														<th scope="col" class="text-center">Estado</th>
														<th scope="col" class="text-center">Seleccionar</th>
													</tr>
												</thead>

												<%
													ArrayList<Profesor> listaProfesores = null;
													if (request.getAttribute("listaProfesores") != null) {
														listaProfesores = (ArrayList<Profesor>) request.getAttribute("listaProfesores");
													}
												%>

												<%
													if (listaProfesores != null) {
														for (Profesor itemProfesor : listaProfesores) {
												%>
												<tr>
													<td class="text-success align-middle"><span
													class="text-uppercase fw-bold"><%=itemProfesor.getPersona().getApellido()%>
												</span>, <%=itemProfesor.getPersona().getNombre()%></td>
													<td class="align-middle text-center"><%=itemProfesor.getLegajo()%></td>
													<td class="align-middle text-center"><%=itemProfesor.getPersona().getDni()%></td>													
													<%
																									if(itemProfesor.getEstado().getNombre().equals("Activo")){
																																			
												%>
												<td class="align-middle text-center"> <span class="badge bg-success text-wrap"><%=itemProfesor.getEstado().getNombre()%></span></td>												


												<%
												}
												else{%>
												<td class="align-middle text-center"> <span class="badge bg-danger text-wrap"><%=itemProfesor.getEstado().getNombre()%></span></td>
													<%
												}
													%>
													<td class="align-middle text-center"><input type="radio" name="txtProfesorLegajo" id="txtProfesorLegajo"
														value="<%=itemProfesor.getLegajo()%>"></td>

												</tr>
												<%
													}
													}
												%>


											</table>
											<!-- FIN DE LA TABLA -->
											<br>
											<hr>
											<!-- BOTON DE AGREGAR-->
											<div class="row mb-3">
												<label class="col-sm-2 col-form-label"></label>
												<div class="col-sm-10">

													<input type="submit" class="btn btn-primary"
														style="float: right" name="agregarNuevoCurso"
														value="Agregar curso">


												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</form>
					</section>
				</div>
				<!-- FIN MAIN  -->

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
//IDIOMAS ESPA�OL DEL DATATABLE   
$(document).ready(function() {
	$('#myTable').DataTable({ 
	"language": {
		"url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
		}
	});
});
</script>

<script type="text/javascript">
function onSubmit() 
{ 
  var fields = $("input[name='txtProfesorLegajo']").serializeArray(); 
  if (fields.length == 0) 
  {
	  Swal.fire({
		title : '�Error!',
		text : "�Debe seleccionar un profesor para crear el curso!",
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
//REGISTRA EL EVENTO EN EL FORMULARIO, NO EL BOT�N DE ENVIAR
$('#formulario').submit(onSubmit)

</script>
</body>
</html>