<%@page import="entidades.Profesor"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ATRIBUTO SESSION DE LA DIRECTIVA PAGE-->
<%@page session="true"%>

<!-- EN CASO DE QUE EXISTA UNA SESION INICIADA REDIRECCIONO A ADMINISTRADOR.JSP O -->
<!-- PROFESOR.JSP, NO TIENE CASO MOSTRAR ESTE FORMULARIO CUANDO HAY UNA SESION INICIADA -->

<%
	if (session.getAttribute("perfil") != null) {
	Profesor Profesor = new Profesor();
	Profesor = (Profesor) session.getAttribute("perfil");

	if (Profesor.getPerfil().getId() == 1) {
		//REDIRIGIR A PAGINA ADMINISTRADOR -->
		response.sendRedirect("adm_inicio.jsp");
	}
	if (Profesor.getPerfil().getId() == 2) {
		//REDIRIGIR A PAGINA DOCENTE -->
		response.sendRedirect("prof_inicio.jsp");
	}
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--  -->
<meta name="TRABAJO FINAL LAB 4 2021" content="">

<title>TRABAJO FINAL LAB 4 2021</title>

<!-- C S S - BOOTSTRAP, CUSTOM STYLES -->

</head>


<!--
####################################################
    B O D Y 
#################################################### -->

<body class="bg-light">

<!--
----------------------------------------------------
N A V B A R
---------------------------------------------------- -->   
<% 
if (session.getAttribute("perfil") != null) {
	response.sendRedirect("logout.jsp");        	 
}
else{
	response.sendRedirect("login.jsp");
}
%>

<!--
----------------------------------------------------
B O D Y
---------------------------------------------------- -->
    <div class="container-fluid">
      <div class="row">

<!--
----------------------------------------------------
S I D E B A R
---------------------------------------------------- -->



<!--
----------------------------------------------------
C O N T E N I D O   P R I N C I P A L
---------------------------------------------------- -->
<div class="col main">

<h2><small></small></h2>


          <!-- CONTENIDO DE LA TABLA -->
          <div class="card mt-3">
            <div class="card-body">
              <h4></h4>
              
            </div>
          </div>

        </div>
        <!-- /.main -->

      </div>
      <!-- /.row -->


    </div>
	<!-- /.container-fluid -->
	
<!--
----------------------------------------------------
	P I E   D E   P A G I N A
---------------------------------------------------- -->


<!--
----------------------------------------------------
	J A V A S C R I P T - JQUERY, BOOTSTRAP, COMPLEMENTOS
  	COLOCADO AL FINAL DEL DOCUMENTO PARA QUE LAS PÁGINAS SE CARGUEN MÁS RÁPIDO
---------------------------------------------------- -->
 
<!-- OPCIONAL JAVASCRIPT -->

<!-- JQUERY PRIMERO, LUEGO POPPER.JS, LUEGO BOOTSTRAP JS -->

<!-- JQUERY - COPIA LOCAL -->
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<!-- BOOTSTRAP CORE JS -->
<script type="text/javascript" src="js/popper.min.js"></script> 
<script type="text/javascript" src="js/bootstrap.min.js"></script>  

<!-- JAVASCRIPT PERSONALIZADO -->
  
</body></html>