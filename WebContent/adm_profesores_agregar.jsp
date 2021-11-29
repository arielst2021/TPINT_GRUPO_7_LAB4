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
<title>Agregar Profesor</title>
	<!-- SWEETALERT2 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- BOOTSTRAP5 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
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
 
  <script type="text/javascript">
    var msg = '<%=request.getAttribute("respuestadb")%>';
		if (msg != "null") {
			if (msg == '1' ) {
				Swal.fire({
					title : '¡Correcto!',
					text : "¡Profesor agregado exitosamente!",
					icon : 'success',
					confirmButtonText : 'OK'
				})
			}
			if (msg == '0') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Hubo un error al intentar agregar el Profesor!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
				<%session.setAttribute("Mensaje", null);%>
			}
			if (msg == '-1') {
				Swal.fire({
					title : '¡Error!',
					text : "¡Profesor duplicado, no se agregó el curso!",
					icon : 'error',
					confirmButtonText : 'OK'
				})
				<%session.setAttribute("Mensaje", null);%>
			}
		}
	</script>
	
	
<!-- INICIO MAIN -->			        
<div id="main" class="main">	
	
    <div >

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="rojo">
                
                 
<%-- 	             <jsp:include page="navTabs.jsp"></jsp:include> --%>
                  
               
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5  >Crear  usuario profesor</h5>
                   
                    <p class="text-center small">Ingrese los datos personales para crear una usuario</p>
                  </div>

                  <form class="row g-3 needs-validation"  name="fvalida"  action="AdmProfesorServlet" method="post" onsubmit=" return valida_envia()">
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
                      <input type="number" name="dni" class="form-control" id="dni" required>
                      
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
<%! @SuppressWarnings("unchecked") %>                      
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
                      <input type="number" name="telefono" class="form-control" id="telefono" required>
                      
                    </div>
                    
                     <div class="col-12">
                  <label class="col-sm-2 col-form-label">Estado</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example"  name=estado>
                      
                      <option value="1">Activo</option>
                      <option value="2">Inactivo</option>
                    </select>
                  </div>
                </div>  
                
                
                   <div class="col-12">
                  <label class="col-sm-2 col-form-label">Perfil</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example"  name=perfil>
                      
                      <option value="1">Administrador</option>
                      <option value="2">Docente</option>
                    </select>
                  </div>
                </div>
                    
                    

                   

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Contraseña</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" required>
                     
                    </div>

                 
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit"  name ="btnregistrar">Crear profesor</button>
                      
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
  </div>
<!-- FIN MAIN -->
  
	<!-- F O O T E R  -->
	<jsp:include page="footer.jsp"></jsp:include>  

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
		
<script> 
	function valida_envia() {

		if (document.fvalida.password.value.length<6||document.fvalida.password.value.length>20) {

			alert("El campo 'Contraseña' debe tener entre 6 y 60 caracteres ")
			document.fvalida.password.focus()
			return false;
		}

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

		if (document.fvalida.dni.value.length == 0
				|| document.fvalida.dni.value.length > 8) {

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

</body>

</html>