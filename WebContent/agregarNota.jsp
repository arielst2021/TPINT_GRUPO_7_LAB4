<%@page import="entidades.Curso"%>
<%@page import="entidades.Estado"%>
<%@page import="entidades.Materia"%>
<%@page import="entidades.Semestre"%>
<%@page import="entidades.Profesor2"%>
<%@page import="java.util.*"%>
<%@page import="java.time.Year"%>

<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!Profesor2 Profesor2 = new Profesor2();%>


<!-- USO SESSION PARA GRABAR UN LISTADO DE NOTAS -->
<%List<Curso> listaNotas = (List<Curso>)session.getAttribute("Notas");
if(listaNotas==null){
	listaNotas = new ArrayList<Curso>();	
	session.setAttribute("Notas",listaNotas);
}


%>
<%
	if (session.getAttribute("perfil") != null) {
		Profesor2 = (Profesor2) session.getAttribute("perfil");
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
	
	
	<script type="text/javascript">
	
	var Capturar = function(){
        var nota = document.getElementsByClassName("numero"),   
   }
	
	</script>
	
	
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
	<jsp:include page="navTabs.jsp"></jsp:include>
	<%
	} else {
%>
	<jsp:include page="login.jsp"></jsp:include>
	<%
	}
%>


	<main id="main" class="main">

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Calificaciones</h5>
						<hr>

						<%!Curso Curso = new Curso();%>
						<% 		  
			  	if (session.getAttribute("DatosDelCurso") != null) {
		Curso = (Curso) session.getAttribute("DatosDelCurso");
			  	}
		%>



						<p>
							<strong>Materia: </strong><%=Curso.getMateria().getId()%> <%=Curso.getMateria().getNombre()%></p>
						<p>
							<strong>Período: </strong><%=Curso.getSemestre().getNombre()%></p>
						<p>
							<strong>Año: </strong><%=Curso.getAnio()%></p>
						<p>
							<strong>Profesor/a: </strong><%=Profesor2.getPersona2().getNombre()%> <%=Profesor2.getPersona2().getApellido()%></p>



						<hr>

						<!-- INICIO DE LA TABLA -->
									<form action="ServletControlador" method="post">					
						<table id="myTable" class="table table-striped"
							style="width: 100%">
							<thead>
								<tr>
									<th scope="col">Apellido y Nombre</th>
									<th scope="col">Primer Parcial</th>
									<th scope="col">Primer Recuperatorio</th>
									<th scope="col">Segundo Parcial</th>
									<th scope="col">Segundo Recuperatorio</th>
									<th scope="col">Estado</th>
								</tr>
							</thead>

							<%
								ArrayList<Curso> listaAlumnosPorCursos = null;
								if (request.getAttribute("listaAlumnosPorCursos") != null) {
									listaAlumnosPorCursos = (ArrayList<Curso>) request.getAttribute("listaAlumnosPorCursos");
								}
							%>

							<%
								if (listaAlumnosPorCursos != null) {
									for (Curso item : listaAlumnosPorCursos) {
							%>





							<tbody>

								<tr>
									<td class="text-primary">
									
										<input type="hidden" id="txtLegajoAlumno" name="txtLegajoAlumno" value="<%=item.getAlumno().getLegajo() %>">
										

									
									
									
									
									<%=item.getAlumno().getPersona2().getNombre()%>
										<%=item.getAlumno().getPersona2().getApellido()%></td>
									<td><input type="text" id="nota1" name="Nota1" class="numero"
										value="<%=item.getNotaPrimerParcial()%>"></td>
									<td><input type="text" name="Nota2" class="form-control"
										value="<%=item.getNotaPrimerRecuperatorio()%>"></td>
									<td><input type="text" name="Nota3" class="form-control"
										value="<%=item.getNotaSegundoParcial()%>"></td>
									<td><input type="text" name="Nota4" class="form-control"
										value="<%=item.getNotaSegundoRecuperatorio()%>"></td>



									<td><select class="form-select form-select">
											<%
								ArrayList<Estado> listaEstados = null;
								if (request.getAttribute("listaEstados") != null) {
									listaEstados = (ArrayList<Estado>) request.getAttribute("listaEstados");
								}
							%>

											<%
								if (listaAlumnosPorCursos != null) {
									for (Estado item2 : listaEstados) {
										if(item2.getNombre().equals("Libre") || item2.getNombre().equals("Regular") || item2.getNombre().equals("Sin calificar")){
							%>

											<option value="<%=item2.getId()%>"><%=item2.getNombre()%>
											</option>



											<%
									}
									}
									}
								%>
									</select></td>

									<%
									}
									}
								%>

								</tr>
							</tbody>
							<tfoot>

								<tr>
									<th></th>
									<th>
									

<!-- 

	private Materia Materia;
	private Semestre Semestre;
	private Year Anio;
	private Profesor2 Profesor2;
	private Alumno Alumno;
	private Float notaPrimerParcial;
	private Float notaPrimerRecuperatorio;
	private Float notaSegundoParcial;
	private Float notaSegundoRecuperatorio;
	private Estado estado;

 -->
									<%
									Materia Materia = new Materia();
									Materia.setId(Curso.getMateria().getId());
									//
									Semestre Semestre = new Semestre();
									Semestre.setId(Curso.getSemestre().getId());
									//
									Year anio = Curso.getAnio();
									//
									Profesor2.setLegajo(Profesor2.getLegajo());
									//
// 									if(request.getParameter("nota1") != null){
										
// 									}
									Float nota1 = Float.parseFloat(nota);
									
// 									System.out.println(nota1);
									
									%>
										<button type="submit" name="btnGuardarNota1" 
										
										onclick="fn1()"
										class="btn btn-sm btn-outline-success" style="float: right" onclick="Capturar()">
										Guardar</button>
									
										</th>
									<th><input type="submit"
										class="btn btn-sm btn-outline-success" style="float: right"
										value="Guardar"></th>
									<th><input type="submit"
										class="btn btn-sm btn-outline-success" style="float: right"
										value="Guardar"></th>
									<th><input type="submit"
										class="btn btn-sm btn-outline-success" style="float: right"
										value="Guardar"></th>
									<th><input type="submit"
										class="btn btn-sm btn-outline-success" style="float: right"
										value="Guardar"></th>
								</tr>
							</tfoot>
						</table>
													</form>
						<!-- FIN DE LA TABLA -->

					</div>
				</div>

			</div>
		</div>
	</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->

	<!-- End Footer -->

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