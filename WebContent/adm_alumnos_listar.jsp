<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entidades.Alumno"%>
<%@page import="entidades.Profesor"%>
<%@page import="entidades.Profesor"%>
<%@page import="negocioImpl.NegocioAlumnoImpl"%>

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
<title>Listado de alumnos</title>
	<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>

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



 	<!--
----------------------------------------------------
N A V B A R
---------------------------------------------------- -->
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
              <h3 class="card-title text-primary">Listado de alumnos</h3>
              <hr>
<%! @SuppressWarnings("unchecked") %>              
							<%
								ArrayList<Alumno> ListaAlumnos = null;
								if (request.getAttribute("ListaAlumnos") != null) {
									ListaAlumnos = (ArrayList<Alumno>) request.getAttribute("ListaAlumnos");
								}
							%>
                                <!-- INICIO DE LA TABLA -->
											<table id="myTable"
												class="table table-striped table-hover border-success"
												style="width: 100%">
												<thead class="table-success">
                  <tr>
                    <th scope="col">Legajo</th>
                    <th scope="col">Apellido y nombre</th>
                    <th scope="col">Dni</th>
                    <th scope="col">Provincia</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Fecha Nac.</th>
                    <th scope="col">Modificar</th>
                  </tr>
                </thead>
                <tbody>
                  <% 
                  if(ListaAlumnos != null)
                  {
                	  for (Alumno alum : ListaAlumnos){
                     	 %>
                    	 <tr>

                    	 <td class="align-middle"><%=alum.getLegajo()%></td>
                    	 <td class="align-middle text-primary"><span class="text-uppercase fw-bold"><%=alum.getPersona().getApellido()%></span>, <%=alum.getPersona().getNombre()%></td>
                    	 <td class="align-middle"><%=alum.getPersona().getDni()%></td>
                    	 <td class="align-middle"><%=alum.getPersona().getProvincia().getNombre()%></td>
<%
															if (alum.getEstado().getNombre().equals("Activo")) {
														%>
														<td class="align-middle text-center"><span
															class="badge bg-success text-wrap"><%=alum.getEstado().getNombre()%></span></td>
														<%
															} else {
														%>
														<td class="align-middle text-center"><span
															class="badge bg-danger text-wrap"><%=alum.getEstado().getNombre()%></span></td>
														<%
															}
														%>  
                    	 <td class="align-middle"><%=alum.getPersona().getFechaNacimiento().getDayOfMonth()%>-<%=alum.getPersona().getFechaNacimiento().getMonthValue()%>-<%=alum.getPersona().getFechaNacimiento().getYear()%></td>
                        <td>
                        	<form action="AdmAlumnoServlet" method="post">
								<input type="hidden" id="txtLegajoAlumno" name="txtLegajoAlumno" value="<%=alum.getLegajo()%>" >
								<input type="submit" name="btnIrEditarAlumno" value="Datos" class="btn btn-warning">															
								<input type="submit" name="btnEditarEstado" value="Estado" class="btn btn-danger">
							</form>
                        </td>
                    	 </tr> 	 
                     	<%}}else{ %><tr><td>No se han encontrado resultados.</td></tr><%}%>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </section>
  
<!--     Modal Editar Estado Alumnos -->
<!--     <div class="modal fade" id="estadoAlumnoModal" tabindex="-1"> -->
<!--       <div class="modal-dialog modal-md"> -->
<!--         <div class="modal-content"> -->
<!--           <div class="modal-body"> -->
<!--             <div class="card-body"> -->
<!--               <div class="pt-4 pb-2"> -->
<!--                 <h5 class="card-title text-center pb-0 fs-4">Editar Estado</h5> -->
<!--                 <p class="text-center small">Información del alumno</p> -->
<!--               </div> -->
<!--               <div class="container text-center"> -->
<!--               <div class="row pb-2"> -->
<!--                 <div class="col-4">Legajo</div> -->
<!--                 <div class="col-8">1</div> -->
<!--               </div> -->

<!--               <div class="row pb-2"> -->
<!--                 <div class="col-4 label ">Nombre</div> -->
<!--                 <div class="col-8">Javier Gomez</div> -->
<!--               </div> -->

<!--               <div class="row pb-2"> -->
<!--                 <div class="col-4 label">DNI</div> -->
<!--                 <div class="col-8">36666666</div> -->
<!--               </div> -->

<!--               <div class="row pb-2"> -->
<!--                 <div class="col-4 label">Nacimiento</div> -->
<!--                 <div class="col-8">	09/06/1996</div> -->
<!--               </div> -->

<!--               <div class="row pb-2"> -->
<!--                 <div class="col-4 label">Provincia</div> -->
<!--                 <div class="col-8">Buenos Aires</div> -->
<!--               </div> -->

<!--               <div class="row pb-2"> -->
<!--                 <div class="col-4 label">Direccion</div> -->
<!--                 <div class="col-8">Calle 100</div> -->
<!--               </div> -->

<!--               <div class="row pb-2"> -->
<!--                 <div class="col-4 label">Email</div> -->
<!--                 <div class="col-8">javiergomez@gmail.com</div> -->
<!--               </div> -->

<!--               <div class="row pb-2"> -->
<!--                 <div class="col-4 label">Estado</div> -->
<!--                 <div class="col-8"> -->
<!--                   <select class="form-select" aria-label="Default select example"> -->
<!--                     <option selected>Activo</option> -->
<!--                     <option value="1">Baja</option> -->
<!--                   </select> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           </div> -->
<!--           <div class="modal-footer"> -->
<!--             <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cerrar</button> -->
<!--             <button type="button" class="btn btn-danger">Modificar Estado</button> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
 
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
