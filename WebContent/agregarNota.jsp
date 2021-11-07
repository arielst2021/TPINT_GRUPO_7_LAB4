<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Nota</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>

<body class="bg-light">

<!--
----------------------------------------------------
N A V B A R
---------------------------------------------------- -->  

<jsp:include page="logout.jsp"></jsp:include>

  <!-- ======= Sidebar ======= -->
   
  <!-- End Sidebar-->

   <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Calificaciones</h5>
			  <hr>
              <p>Materia: Laboratorio IV</p>
              <p>Cuatrimestre: Segundo Cuatrimestre</p>
              <p>Año: 2021</p>
              <p>Profesor/a: Usuario Logueado</p>
			  <hr>

              <!-- INICIO DE LA TABLA -->
				<table id="myTable" class="table table-striped" style="width:100%">
                <thead>
                  <tr>
                    <th scope="col">Apellido y Nombre</th>
                    <th scope="col">Parcial 1</th>
                    <th scope="col">Rec. 1</th>
                    <th scope="col">Parcial 2</th>
                    <th scope="col">Rec. 2</th>
                    <th scope="col">Estado</th> 					
                  </tr>
                </thead>
                <tbody>
                  
                  <tr>
                    <td class="text-primary">Sosa Alexis</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">Regular</option>
							<option value="2">Libre</option>
						</select>
					</td> 		
                  </tr>
                  <tr>
                    <td class="text-primary">Frutos Ada</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">Regular</option>
							<option value="2">Libre</option>
						</select>
					</td> 	              
                  </tr>
                  <tr>
                    <td class="text-primary">Rodríguez Jennifer</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">Regular</option>
							<option value="2">Libre</option>
						</select>
					</td> 	                  
                  </tr>
                  <tr>
                    <td class="text-primary">Díaz Leandro</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">Regular</option>
							<option value="2">Libre</option>
						</select>
					</td> 	                  
                  </tr>
                  <tr>
                    <td class="text-primary">Gómez Barbara</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">Regular</option>
							<option value="2">Libre</option>
						</select>
					</td> 	                  
                  </tr>

                  <tr>
                    <td class="text-primary">Gómez Barbara</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>	
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td> 	
					<td>
						<select class="form-select form-select-sm">
							<option></option>
							<option value="1">Regular</option>
							<option value="2">Libre</option>
						</select>
					</td> 					
                  </tr>
                </tbody>
			<tfoot>
	
            <tr>
                <th></th>
                <th><input type="submit" class="btn btn-sm btn-outline-success" style="float: right" value="Guardar"></th>
                <th><input type="submit" class="btn btn-sm btn-outline-success" style="float: right" value="Guardar"></th>
                <th><input type="submit" class="btn btn-sm btn-outline-success" style="float: right" value="Guardar"></th>
                <th><input type="submit" class="btn btn-sm btn-outline-success" style="float: right" value="Guardar"></th>
                <th><input type="submit" class="btn btn-sm btn-outline-success" style="float: right" value="Guardar"></th>
            </tr>
			</tfoot>
              </table>
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