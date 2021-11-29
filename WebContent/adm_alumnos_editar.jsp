<%@page import="entidades.Alumno"%>
<%@page import="entidades.Provincia"%>
<%@page import="entidades.Estado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Profesor"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>

<%@page import="java.util.*"%>
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
<title>Editar Alumno</title>
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
		}
	%>

							<% if(request.getAttribute("AlumnoEditar") != null){
            	 				 Alumno alum = (Alumno) request.getAttribute("AlumnoEditar");
            	  			%>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">

					<!-- INICIO MAIN -->			        
					<div id="main" class="main">
						<div class="card">
							<div class="card-body">
								<h3 class="card-title text-primary">Editar Alumno</h3>
								<p class="text-left small">Editar información del alumno. No podrán editarse ni el Nro. de Legajo ni el Nro. de DNI</p>
								<hr>
							</div>
							<!-- INICIO FORM -->
							<form class="form" name="fvalida"  action="AdmAlumnoServlet" method="post" onsubmit=" return valida_envia()">
								<div class="row">
									<!-- INICIO DE COLUMNA UNO -->
									<div class="col-md-6 text-left">
										<div class="card-body">
											<section>

												<div class="mb-3">
													<div class="col-4">Legajo</div>
													<div class="form-control"><%=alum.getLegajo()%></div>
													<input type="hidden" name="txtLegajo" class="form-control"
														value="<%=alum.getLegajo()%>">
												</div>

												<div class="mb-3">
													<div class="col-4 fw-bold">Nombre</div>
													<div><input type="text" name="txtNombre" class="form-control text-primary" value="<%=alum.getPersona().getNombre()%>" required></div>
												</div>

												<div class="mb-3">
													<div class="col-4 fw-bold">Apellido</div>
													<div><input type="text" name="txtApellido" class="form-control text-primary" value="<%=alum.getPersona().getApellido()%>" required></div>
												</div>

<!-- 												<div class="mb-3"> -->
<!-- 													<div class="col-4">DNI</div> -->
<%-- <%-- 													<div class="form-control"><%=alum.getPersona().getDni()%></div>													 --%> 
<!-- 													<input type="number" name="txtDni" class="form-control" -->
<%-- 													value="<%=alum.getPersona().getDni()%>" disabled></div> --%>
							<div class="row pb-2">
								<div class="col-4 label ">DNI</div>
								<div class="col-8"><input type="text" name="txtDni" class="form-control" required value=<%=alum.getPersona().getDni()%>></div>
							</div>
							
												<div class="mb-3">
													<div class="col-4 fw-bold">Fecha de nacimiento</div>
													<div><input type="date" name="txtNacimiento" class="form-control text-primary" value="<%=alum.getPersona().getFechaNacimiento() %>" required></div>
												</div>										

											</section>
										</div>
									</div>
									<!-- FIN DE COLUMNA UNO -->
									<!-- INICIO DE COLUMNA DOS -->
									<div class="col-md-6 text-left">
										<div class="card-body">
											<section>

												<div class="mb-3">
													<div class="col-4 fw-bold">Dirección</div>
													<div><input type="text" name="txtDireccion" class="form-control text-primary" value="<%=alum.getPersona().getDireccion()%>" required></div>
												</div>																			
											
												<div class="mb-3">
													<label class="fw-bold">Provincia</label>
<%! @SuppressWarnings("unchecked") %>
													<select class="form-select form-control text-primary" name="txtProvincia">
														<%
															List<Provincia> ListaProvincia = null;
																if (request.getAttribute("listarProvincias") != null) {
																	ListaProvincia = (List<Provincia>) request.getAttribute("listarProvincias");
																}
														%>
														<%
															if (ListaProvincia != null)
																	for (Provincia p : ListaProvincia) {
														%>
														<option value="<%=p.getId()%>"
															<%if (p.getId() == alum.getPersona().getProvincia().getId()) {%>
															selected <%}%>>
															<%=p.getNombre()%>
														</option>
														<%
															}
														%>
													</select>
												</div>

												<div class="mb-3">
													<div class="col-4 fw-bold">Mail</div>
													<div><input type="text" name="txtEmail" class="form-control text-primary" value="<%=alum.getPersona().getEmail()%>" required></div>
												</div>												

												<div class="mb-3">
													<div class="col-4 fw-bold">Telefono</div>
													<div><input type="text" name="txtTelefono" class="form-control text-primary" value="<%=alum.getPersona().getTelefono()%>" required></div>
												</div>												

												<div class="mb-3">
													<label class="fw-bold">Estado</label>

													<select class="form-select form-control text-primary" name="txtEstado">
														<%
															List<Estado> ListaEstado = null;
																if (request.getAttribute("listarEstados") != null) {
																	ListaEstado = (List<Estado>) request.getAttribute("listarEstados");
																}
														%>
																	<%
																		if (ListaEstado != null) {
																					for (Estado e : ListaEstado) {
																						if (e.getNombre().equals("Activo") || e.getNombre().equals("Inactivo")) {
	
																							// POR MEDIO DEL ATRIBUTO SELECTED ESTABLEZCO LA OPCIÓN INICIALMENTE SELECCIONADA
																	%>
														<option value="<%=e.getId()%>"
															<%if (e.getId() == alum.getEstado().getId()) {%>
															selected <%}%>>
															<%=e.getNombre() %>
														</option>
														<%
																						}
																					}
															}
														%>
													</select>
												</div>

												<div class="mb-3">
													<label></label>
													<div class="d-grid gap-2 d-md-flex justify-content-md-end">
														<button class="btn btn-primary me-md-2" type="submit"
															name="btnEditarAlumno">Guardar Cambios</button>
													</div>
												</div>

											</section>
										</div>
									</div>
									<!-- FIN DE COLUMNA DOS -->
								</div>
							</form>
							<!-- FIN FORM -->
						</div>

				  </div>
				<!-- FIN MAIN -->

				</div>
			</div>
		</div>
	</div>
<%
}
%>

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