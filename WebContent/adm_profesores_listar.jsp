<%@page import="entidades.Profesor"%>
<%@page import="java.util.ArrayList"%>

<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de profesores</title>
	<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>

<body style="background-color: #F6F9FF">

<!-- N A V B A R -->

	<script type="text/javascript">
    var msg = '<%=session.getAttribute("Mensaje")%>';
		if (msg != "null") {
			if (msg == '1' ) {
				Swal.fire({
					title : '¡Correcto!',
					text : "¡Profesor modificado exitosamente!",
					icon : 'success',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '0') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Hubo un error al intentar modificar el profesor!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '-1') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Hubo un error interno al intentar modificar el profesor!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
			}
			<%session.setAttribute("Mensaje", null);%>			
		}
	</script>
	
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
<!-- INICIO MAIN -->			        
        <div id="main" class="main">
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-primary">Listado de profesores</h3>
                                <hr>
                                <!-- INICIO DE LA TABLA -->
											<table id="myTable"
												class="table table-striped table-hover border-success"
												style="width: 100%">
												<thead class="table-success">
                                        <tr>
                                            <th scope="col">Legajo</th>
                    						<th scope="col">Apellido y nombre</th>
                                            <th scope="col">DNI</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Provincia</th>
                                            <th scope="col">Fecha Nac.</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Modificar</th>
                                        </tr>
                                    </thead>
<%! @SuppressWarnings("unchecked") %>
                                    <% ArrayList<Profesor> ListaProfesor = null;
                                        if (request.getAttribute("ListaProfesor") != null) {
                                        	ListaProfesor = (ArrayList<Profesor>) request.getAttribute("ListaProfesor");
                                            }
                                            %>

                                            <% if (ListaProfesor !=null) { for (Profesor item : ListaProfesor) { %>


                                                <tr>

                                                    <td class="align-middle">
                                                        <%=item.getLegajo() %>
                    	 <td class="align-middle text-primary"><span class="text-uppercase fw-bold"><%=item.getPersona().getApellido()%></span>, <%=item.getPersona().getNombre()%></td>

                                                    <td class="align-middle">
                                                        <%=item.getPersona().getDni() %>
                                                    </td>
                                                    <td class="align-middle">
                                                        <%=item.getPersona().getEmail() %>
                                                    </td>
                                                    <td class="align-middle">
                                                        <%=item.getPersona().getProvincia().getNombre() %>
                                                    </td>
													<td class="align-middle">
														<%=item.getPersona().getFechaNacimiento().getDayOfMonth()%>-
														<%=item.getPersona().getFechaNacimiento().getMonthValue()%>-
														<%=item.getPersona().getFechaNacimiento().getYear()%>
													</td>
                                                   	<td class="align-middle">
                                                        <%=item.getUsuario() %>
                                                    </td>
                                                    	<%
															if (item.getEstado().getNombre().equals("Activo")) {
														%>
														<td class="align-middle"><span
															class="badge bg-success text-wrap"><%=item.getEstado().getNombre()%></span></td>
														<%
															} else {
														%>
														<td class="align-middle"><span
															class="badge bg-danger text-wrap"><%=item.getEstado().getNombre()%></span></td>
														<%
															}
														%>                                                 	
                                                    <td>
                                                    	<form action="AdmProfesorServlet" method="post">
                                                    	<input type="hidden" name="LegajoProfesor" value="<%=item.getLegajo() %>">
                                                    	<input type="hidden" name="EstadoProfesor" value="<%=item.getEstado().getId() %>">
 														<input type="submit" name="EditarProfesor" value="Datos" class="btn btn-warning">
 														<input type="submit" name="EditarEstado" value="Estado" class="btn btn-danger">
                                                                           	
                                                    	</form>
                                                    </td>
             

                                                </tr>
                                                <% } } %>


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