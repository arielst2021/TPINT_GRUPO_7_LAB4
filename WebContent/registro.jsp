<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Pages / Register - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<link href="Recursos/css/estilos.css" type ="text/css" rel="StyleSheet"/>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

  <main>
<%--   <jsp:include page="logout.jsp"></jsp:include> --%>
    <div >

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="rojo">
                
                 
                  
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5  >Crear  usuario profesor</h5>
                   
                    <p class="text-center small">Ingrese los datos personales para crear una usuario</p>
                  </div>

                  <form class="row g-3 needs-validation"   action="ServletControlador" method="post">
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
                      
                 <option value=1>BuenosAires<option>
                 <option value=2>BuenosAires-GBA<option>
                 <option value=3>CapitalFederal<option>
                 <option value=4>Catamarca<option>
                 <option value=5>Chaco<option>
                 <option value=6>Chubut<option>
                 <option value=7>Córdoba<option>
                 <option value=8>Corrientes<option>
                 <option value=9>EntreRíos<option>
                 <option value=10>Formosa<option>
                 <option value=11>Jujuy<option>
                 <option value=12>LaPampa<option>
                 <option value=13>LaRioja<option>
                 <option value=14>Mendoza<option>
                 <option value=15>Misiones<option>
                 <option value=16>Neuquén<option>
                 <option value=17>RíoNegro<option>
                 <option value=18>Salta<option>
                 <option value=19>SanJuan<option>
                 <option value=20>SanLuis<option>
                 <option value=21>SantaCruz<option>
                 <option value=22>SantaFe<option>
                 <option value=23>SantiagodelEstero<option>
                 <option value=24>TierradelFuego<option>
                 <option value=25>Tucumán<option>

                      
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
                      <p class="small mb-0">Ya tengo una cuenta <a href=""></a></p>
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


</body>

</html>