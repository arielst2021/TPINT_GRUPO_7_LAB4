<%@page import="entidades.Estado"%>
<%@page import="entidades.Materia"%>
<%@page import="entidades.Semestre"%>
<%@page import="entidades.Profesor"%>
<%@page import="entidades.Provincia"%>
<%@page import="java.util.*"%>
<%@page import="java.time.Year"%>
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
<title>Agregar Alumno</title>
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

	<script type="text/javascript">
    var msg = '<%=session.getAttribute("Mensaje")%>';
		if (msg != "null") {
			if (msg == '1' ) {
				Swal.fire({
					title : '¡Correcto!',
					text : "¡Alumno agregado exitosamente!",
					icon : 'success',
					confirmButtonText : 'OK'
					<%session.setAttribute("Mensaje", null);%>
				})
			}
			if (msg == '0') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Alumno ya existente!",
					icon : 'error',
					confirmButtonText : 'OK'
					<%session.setAttribute("Mensaje", null);%>	
				})
			}
			
		}
		
	</script>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">

					<!-- INICIO MAIN -->			        
					<div id="main" class="main">
						<div class="card">
							<div class="card-body">
								<h3 class="card-title text-primary">Agregar Alumno</h3>
								<p class="text-left small">Ingrese los datos personales para
									crear un alumno</p>
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
													<label class="fw-bold">Nombre</label> <input
														class="form-control text-primary" type="text" name="name"
														id="Nombre" placeholder="" required>
												</div>

												<div class="mb-3">
													<label class="fw-bold">Apellido</label> <input
														class="form-control text-primary" type="text" name="apellido"
														id="apellido" placeholder="" required>
												</div>

												<div class="mb-3">
													<label class="fw-bold">DNI</label> <input
														class="form-control text-primary" type="text" name="dni"
														id="dni" placeholder="" required onkeypress="return valideKey(event);" />
												</div>

												<div class="mb-3">
													<label class="fw-bold">Fecha de nacimiento</label> <input
														class="form-control text-primary" type="date" name="nacimiento"
														id="nacimiento" placeholder="" required>
												</div>

												<div class="mb-3">
													<label class="fw-bold">Direccion</label> <input
														class="form-control text-primary" type="text" name="direccion"
														id="direccion" placeholder="" required>
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
													<label class="fw-bold">Provincia</label>
<%! @SuppressWarnings("unchecked") %>													
													<%
														List<Provincia> ListaProvincia = null;
														if (request.getAttribute("ListaProvincia") != null) {
															ListaProvincia = (List<Provincia>) request.getAttribute("ListaProvincia");
														}
													%>
													<select class="form-select form-control text-primary" name="provincias">
														<%
															if (ListaProvincia != null)
																for (Provincia p : ListaProvincia) {
														%>
														<option value="<%=p.getId()%>"><%=p.getNombre()%></option>
														<%
															}
														%>
													</select>
												</div>

												<div class="mb-3">
													<label class="fw-bold">Mail</label> <input
														class="form-control text-primary" type="text" name="mail"
														id="mail" placeholder="" required>
												</div>

												<div class="mb-3">
													<label class="fw-bold">Telefono</label> <input
														class="form-control text-primary" type="number" name="telefono"
														id="telefono" placeholder="" required>
												</div>

												<div class="mb-3">
													<label class="fw-bold">Estado</label> <select
														class="form-select form-control text-primary"
														name="estado">
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
														// 
														%>
														<option value="<%=e.getId()%>"><%=e.getNombre()%></option>
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
															name="btnAgregarAlumno">Crear Alumno</button>
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

	<script> 
	function valida_envia() {

		if (document.fvalida.name.value.length > 20
				|| document.fvalida.name.value.length == 0) {
			alert("El campo nombre debe tener entre 1 y 20 caracteres")
			document.fvalida.name.focus()
			return false;
		}

		if (document.fvalida.apellido.value.length > 20
				|| document.fvalida.apellido.value.length == 0) {

			alert("El campo apellido debe tener entre 1 y 20 caracteres")
			document.fvalida.apellido.focus()
			return false;
		}

		if (document.fvalida.dni.value.length != 8) {

			alert("El campo 'DNI' debe tener entre 1 y 8 caracteres numericos")
			document.fvalida.dni.focus()
			return false;
		}		

		if (document.fvalida.direccion.value.length == 0
				|| document.fvalida.direccion.value.length > 20) {

			alert("El campo 'DIRECCION' debe tener entre 1 y 20 caracteres ")
			document.fvalida.dni.focus()
			return false;
		}

		if (document.fvalida.mail.value.length == 0
				|| document.fvalida.mail.value.length > 20) {

			alert("El campo 'MAIL' debe tener entre 1 y 20 caracteres ")
			document.fvalida.mail.focus()
			return false;
		}

		if (document.fvalida.telefono.value.length == 0
				|| document.fvalida.telefono.value.length > 20) {

			alert("El campo 'TELEFONO' debe tener entre 1 y 20 caracteres numericos")
			document.fvalida.telefono.focus()
			return false;
		}
		
		return true;
	}
</script>

	<script type="text/javascript">
function valideKey(evt){
			
// code is the decimal ASCII representation of the pressed key.
var code = (evt.which) ? evt.which : evt.keyCode;
	if(code==8) { // backspace.
		return true;
	}
	else if(code>=48 && code<=57) { // is a number.
		return true;
	} else { // other keys.
		return false;
	}
}
</script>

	<!-- F O O T E R  -->
	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
	
</body>
</html>