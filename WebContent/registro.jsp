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
	} else {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Agregar Profesor</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<link href="Recursos/css/estilos.css" type ="text/css" rel="StyleSheet"/>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />

</head>

<body>
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
  <main>
    <div >

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="rojo">
                
                 
<%-- 	             <jsp:include page="navTabs.jsp"></jsp:include> --%>
                  
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5  >Crear  usuario profesor</h5>
                   
                    <p class="text-center small">Ingrese los datos personales para crear una usuario</p>
                  </div>

                  <form class="row g-3 needs-validation"   action="AdmProfesorServlet" method="post">
                    <div class="col-12">
                      <label for="yourName" class="form-label">Nombre</label>
                      <input type="text" name="name" class="form-control" id="Nombre" required>
                      
                    </div>
                     <div class="col-12">
                      <label for="Apellido" class="form-label">Apellido</label>
                      <input type="text" name="apellido" class="form-control" id="Apellido" required>
                      
                    </div>
                     <div class="col-12">
                      <label for="Dni" class="form-label">Dni</label>
                      <input type="text" name="dni" class="form-control" id="dni" required>
                      
                    </div>
                     <div class="col-12">
                      <label for="nacimiento" class="form-label">Fecha de nacimiento</label>
                      <input type="date" name="nacimiento" class="form-control" id="nacimiento" required>
                     
                      
                    </div>

                    <div class="col-12">
                      <label for="Direccion" class="form-label">Direccion</label>
                      <input type="text" name="direccion" class="form-control" id="direccion" required>
                      
                    </div>
                    
                     <div class="col-12">
                      <label for="Provincia" class="form-label">Provincia</label>
                      <select name=provincias>
                      <%
				List<Provincia> ListaProvincia = null;
				if(request.getAttribute("ListaProvincia")!=null)
				{
					ListaProvincia = (List<Provincia>) request.getAttribute("ListaProvincia");
				}
				%>
                           
                           <%
                           if(ListaProvincia!=null)
                           for(Provincia  p : ListaProvincia){
                        	   
                           %>
                           
                            <option value="<%=p.getId() %>"><%=p.getNombre() %></option>
                            
                            <%
                            
                           }
                            %>

                      
                      </select>
                      
                    </div>
                    <div class="col-12">
                      <label for="Mail" class="form-label">Mail</label>
                      <input type="email" name="mail" class="form-control" id="mail" required>
                      
                    </div>
                     <div class="col-12">
                      <label for="Telefono" class="form-label">Telefono</label>
                      <input type="text" name="telefono" class="form-control" id="telefono" required>
                      
                    </div>
                    
                    

                   

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Contraseña</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" required>
                     
                    </div>

                 
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit"  name ="btnregistrar">Crear cuenta</button>
                      
                    </div>
                    <div class="col-12">
                      
                    </div>
                     </form>
                  

                </div>
              </div>

          

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
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