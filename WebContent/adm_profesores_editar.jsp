<%@page import="entidades.Provincia"%>
<%@page import="entidades.Estado"%>
<%@page import="entidades.Profesor"%>
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


<% if(request.getAttribute("EditarProfesor") != null){
	Profesor profe = (Profesor) request.getAttribute("EditarProfesor");       	  			
%>


	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">

					<!-- INICIO MAIN -->			        
					<div id="main" class="main">
						<div class="card">
							<div class="card-body">
								<h3 class="card-title text-primary">Editar Profesor</h3>
								<p class="text-left small">Editar información del alumno. No podrán editarse: Nro. de Legajo, DNI, Perfil, Contraseña y Estado</p>
								<hr>
							</div>
							
							<!-- INICIO FORM -->
							<form class="form" name="formulario" action="AdmProfesorServlet" method="post" onsubmit=" return validarFormulario()">

								<div class="row">
									<!-- INICIO DE COLUMNA UNO -->
									<div class="col-md-6 text-left">
										<div class="card-body">
											<section>

												<div class="mb-3">
													<div>Legajo</div>
													<label class="form-control bg-light"><%=profe.getLegajo()%></label>
													<div><input type="hidden" name="txtLegajo" class="form-control" value="<%=profe.getLegajo()%>"></div>
												</div>

												<div class="mb-3">
													<div class="col-4 fw-bold">Nombre</div>
													<div><input type="text" name="txtNombre" class="form-control text-primary" value="<%=profe.getPersona().getNombre()%>" required></div>
												</div>

												<div class="mb-3">
													<div class="col-4 fw-bold">Apellido</div>
													<div><input type="text" name="txtApellido" class="form-control text-primary" value="<%=profe.getPersona().getApellido()%>" required></div>
												</div>
												
												<div class="mb-3">
													<div>DNI</div>
													<label class="form-control bg-light"><%=profe.getPersona().getDni()%></label>
													<input type="hidden" name="txtDni" class="form-control" value=<%=profe.getPersona().getDni()%>>
												</div>

												<div class="mb-3">
													<div class="col-4 fw-bold">Fecha de nacimiento</div>
													<div><input type="date" name="txtNacimiento" class="form-control text-primary" value="<%=profe.getPersona().getFechaNacimiento()%>" required></div>
												</div>

												<div class="mb-3">
													<div class="col-4 fw-bold">Dirección</div>
													<div><input type="text" name="txtDireccion" class="form-control text-primary" value="<%=profe.getPersona().getDireccion()%>" required></div>
												</div>																						

												<div class="mb-3">
													<label class="fw-bold">Provincia</label>
<%! @SuppressWarnings("unchecked") %>
													<select class="form-select form-control text-primary" name="txtProvincia">
														<%
															List<Provincia> ListaProvincia = null;
																if (request.getAttribute("ListaProvincia") != null) {
																	ListaProvincia = (List<Provincia>) request.getAttribute("ListaProvincia");
																}
														%>
														<%
															if (ListaProvincia != null)
																	for (Provincia p : ListaProvincia) {
														%>
														<option value="<%=p.getId()%>"
															<%if (p.getId() == profe.getPersona().getProvincia().getId()) {%>
															selected <%}%>>
															<%=p.getNombre()%>
														</option>
														<%
															}
														%>
													</select>
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
													<div class="col-4 fw-bold">Mail</div>
													<div><input type="text" name="txtEmail" class="form-control text-primary" value="<%=profe.getPersona().getEmail()%>" required></div>
												</div>												

												<div class="mb-3">
													<div class="col-4 fw-bold">Telefono</div>
													<div><input type="tel" name="txtTelefono" class="form-control text-primary" value="<%=profe.getPersona().getTelefono()%>" required></div>
												</div>												

												<div class="mb-3">
								                  <div class="col-4">Perfil</div>
								                    <div><input name = "txtPerfil" type="text" class="form-control bg-light" disabled value="<%=profe.getPerfil().getNombrePerfil()%>"></div>
								                </div>
								                
												<div class="mb-3">
								                  <div class="col-4  fw-bold">Nombre de usuario</div>
								                    <div><input name="txtUsuario" type="text" class="form-control text-primary" value="<%=profe.getUsuario()%>" required></div>
								                </div>
								                
												<div class="mb-3">
								                  <div class="col-4">Contraseña</div>
								                    <div><input name = "txtContrasenia" type="text" class="form-control bg-light" disabled value="<%=profe.getContrasenia()%>"></div>
								                </div>
								                
												<div class="mb-3">
								                  <div class="col-4">Estado</div>
								                    <div><input name = "txtEstado" type="text" class="form-control bg-light" disabled value="<%=profe.getEstado().getNombre()%>"></div>
								                </div>									                								                

												<div class="mb-3">
													<label></label>
													<div class="d-grid gap-2 d-md-flex justify-content-md-end">
														<button class="btn btn-info me-md-2" type="submit"
															name="btnCancelarEditarProfesor">Cancelar</button>
														<button class="btn btn-primary me-md-2" type="submit"
															name="btnEditarProfesor">Guardar Cambios</button>
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

<script> 
	function validarFormulario() {

		if (document.formulario.txtNombre.value.length > 20
				|| document.formulario.txtNombre.value.length == 0) {
			alert("El campo NOMBRE debe tener entre 1 y 20 caracteres")
			document.formulario.txtNombre.focus()
			return false;
		}

		if (document.formulario.txtApellido.value.length > 20
				|| document.formulario.txtApellido.value.length == 0) {

			alert("El campo APELLIDO debe tener entre 1 y 20 caracteres")
			document.formulario.txtApellido.focus()
			return false;

		}

		if (document.formulario.txtDireccion.value.length == 0
				|| document.formulario.txtDireccion.value.length > 20) {

			alert("El campo 'DIRECCION' debe tener entre 1 y 20 caracteres ")
			document.formulario.txtDireccion.focus()
			return false;
		}

		if (document.formulario.txtEmail.value.length == 0
				|| document.formulario.txtEmail.value.length > 20) {

			alert("El campo 'MAIL' debe tener entre 1 y 20 caracteres ")
			document.formulario.txtEmail.focus()
			return false;
		}
		
		if (document.formulario.txtUsuario.value.length == 0
				|| document.formulario.txtUsuario.value.length > 20) {

			alert("El campo 'NOMBRE DE USUARIO' debe tener entre 1 y 20 caracteres ")
			document.formulario.txtUsuario.focus()
			return false;
		}
		
		
		var RegExp=/^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
		if(!RegExp.exec(document.formulario.txtEmail.value)){
			alert("El campo 'MAIL' de ser por ejemplo: miNombre@gmail.com")
			document.formulario.txtEmail.focus()
			return false;
		}

		if (document.formulario.txtTelefono.value.length == 0
				|| document.formulario.txtTelefono.value.length > 20) {

			alert("El campo 'TELEFONO' debe tener entre 1 y 20 caracteres numericos")
			document.formulario.txtTelefono.focus()
			return false;
		}
		
		var RegExp=/^(?:(?:00)?549?)?0?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$/
			if(!RegExp.exec(document.formulario.txtTelefono.value)){
				alert("El campo 'TELEFONO' de ser por ejemplo: 1144440000")
				document.formulario.txtTelefono.focus()
				return false;
			}	
		return true;
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