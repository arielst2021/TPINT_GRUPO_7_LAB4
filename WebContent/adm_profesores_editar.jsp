<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Profesor"%>
<%@page import="entidades.Provincia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Modificar Profesor</title>
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

<% if(request.getAttribute("EditarProfesor") != null){
	Profesor profe = (Profesor) request.getAttribute("EditarProfesor");       	  			
%>
<!-- INICIO MAIN -->			        
<div id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Modificar Profesor</h5>

              <!-- General Form Elements -->
              
                <form>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Legajo</label>
                  <div class="col-sm-10">
                  	
                  	
                    <input type="text" class="form-control" disabled value =<%=profe.getLegajo()%> >
                 </div>
                </div>
              
   
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">DNI</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" disabled value =<%=profe.getPersona().getDni() %>>
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Nombre</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" value =<%=profe.getPersona().getNombre() %>>
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Apellido</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" value =<%=profe.getPersona().getApellido() %>>
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Fecha Nac.</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" value =<%=profe.getPersona().getFechaNacimiento() %>>
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Dirección</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" value =<%=profe.getPersona().getDireccion() %>>
                  </div>
                </div>

								

                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Provincia</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" name="txtProvincia">	
										<!-- CARGA PROVINCIAS -->
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
                </div>

                <div class="row mb-3">
                  <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                  <div class="col-sm-10">
                    <input type="email" class="form-control" value =<%=profe.getPersona().getEmail() %>>
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Telefono</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" value =<%=profe.getPersona().getTelefono() %>>
                  </div>
                </div>

				
				<div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Perfil</label>
                  <div class="col-sm-10">
                  	
                  	
                    <input type="text" class="form-control" disabled value =<%=profe.getPerfil().getNombrePerfil()%> >
                 </div>
                </div>

                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Nombre de usuario</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" value =<%=profe.getUsuario() %>>
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="inputPasswordl" class="col-sm-2 col-form-label">Contraseña</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" disabled value =<%=profe.getContrasenia() %>>
                  </div>
                </div>
                
               <div class="row mb-3">
                  <label for="inputPasswordl" class="col-sm-2 col-form-label">Estado</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" disabled value =<%=profe.getEstado().getNombre() %>>
                  </div>
                </div>
                          

                <!-- BOTON DE AGREGAR-->
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary" style="float: right">Guardar Cambios</button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>

        </div>

        <div class="col-lg-6">


        </div>
      </div>
    </section>

  </div>
<!-- FIN MAIN -->
   <% } %>

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

  </footer><!-- End Footer -->

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

</body>
</html>