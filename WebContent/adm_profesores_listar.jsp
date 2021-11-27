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
				        
        <main id="main" class="main">
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <p></p>
                                <h5 class="card-title">Listado de profesores</h5>
                                <hr>
                                <!-- INICIO DE LA TABLA -->


                                <table id="myTable" class="table table-striped" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <th scope="col">Legajo</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Apellido</th>
                                            <th scope="col">DNI</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>

                                    <% ArrayList<Profesor> ListaProfesor = null;
                                        if (request.getAttribute("ListaProfesor") != null) {
                                        	ListaProfesor = (ArrayList<Profesor>) request.getAttribute("ListaProfesor");
                                            }
                                            %>

                                            <% if (ListaProfesor !=null) { for (Profesor item : ListaProfesor) { %>


                                                <tr>

                                                    <td>
                                                        <%=item.getLegajo() %>
                                                    </td>
                                                    <td>
                                                        <%=item.getPersona().getNombre() %>
                                                    </td>
                                                    <td>
                                                        <%=item.getPersona().getApellido() %>
                                                    </td>
                                                    <td>
                                                        <%=item.getPersona().getDni() %>
                                                    </td>
                                                    <td>
                                                        <%=item.getPersona().getEmail() %>
                                                    </td>
<%--                                                     <td>
                                                        <%= item.getEstado().getNombre() %>
                                                    </td> --%>
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
                                                    <td>
                                                    	<form action="AdmProfesorServlet" method="post">
                                                    	<input type="hidden" name="LegajoProfesor" value="<%=item.getLegajo() %>">
                                                    	<input type="hidden" name="EstadoProfesor" value="<%=item.getEstado().getId() %>">
 														<input type="submit" name="EditarProfesor" value="Editar" class="btn btn-primary">
 															
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
        </main>
					<!-- End #main -->

				</div>
			</div>
		</div>
	</div>

        <!-- ======= Footer ======= -->

	<jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>

        <script>
            //IDIOMAS ESPAÑOL DEL DATATABLE   
            $(document).ready(function () {
                $('#myTable').DataTable({
                    "language": {
                        "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
                    }
                });
            });
        </script>
    </body>

    </html>