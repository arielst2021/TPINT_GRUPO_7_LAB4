<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Curso</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
</head>

<body style="background-color: #F6F9FF">
	<main id="main" class="main">
	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<p>
						</p>
						<h5 class="card-title">Agregar Nuevo Curso</h5>
						<hr>

                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Materia</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example">
                      <option selected>--Seleccione una Materia--</option>
                      <option value="1">Buenos Aires</option>
                      <option value="2">Entre Ríos</option>
                      <option value="3">Salta</option>
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Semestre</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example">
                      <option selected>--Seleccione un Semestre--</option>
                      <option value="1">Buenos Aires</option>
                      <option value="2">Entre Ríos</option>
                      <option value="3">Salta</option>
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Año</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control">
                  </div>
                </div>
                                
                
                                                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Profesores</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example">
                      <option selected>--Seleccione un profesor--</option>
                      <option value="1">Buenos Aires</option>
                      <option value="2">Entre Ríos</option>
                      <option value="3">Salta</option>
                    </select>
                  </div>
                </div>
                
                                <!-- BOTON DE AGREGAR-->
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary" style="float: right">Agregar Curso</button>
                  </div>
                </div>



					</div>
				</div>
			</div>
		</div>
	</section>
	</main>             
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