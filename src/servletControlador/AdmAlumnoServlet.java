package servletControlador;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entidades.Alumno;
import entidades.Estado;
import entidades.Persona;
import entidades.Provincia;
import negocio.NegocioAlumno;
import negocio.NegocioEstado;
import negocio.NegocioProfesor;
import negocio.NegocioProvincia;
import negocioImpl.NegocioAlumnoImpl;
import negocioImpl.NegocioEstadoImpl;
import negocioImpl.NegocioProfesorImpl;
import negocioImpl.NegocioProvinciaImpl;


@WebServlet("/AdmAlumnoServlet")
public class AdmAlumnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NegocioAlumno negocioA;
	private NegocioProvincia negocioP; 
	private NegocioEstado negocioE;
	private NegocioProfesor negocioProf;
       

    public AdmAlumnoServlet() {
        this.negocioA = new NegocioAlumnoImpl();
        this.negocioP = new NegocioProvinciaImpl();
        this.negocioE = new NegocioEstadoImpl();
        this.negocioProf = new NegocioProfesorImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	if(request.getParameter("btnAgregarAlumno")!=null) {	
    		int aux=0;
			String Mensaje = "0";
    		if(request.getParameter("name") != null && request.getParameter("apellido") != null && request.getParameter("dni") != null
        			&& request.getParameter("nacimiento")  != null && request.getParameter("provincias") != null && request.getParameter("estado")  != null
        			&& request.getParameter("direccion")  != null && request.getParameter("mail") != null && request.getParameter("telefono") != null) {
    			try {
            		// USO DE FECHA
            		DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
            		LocalDate FechaNacimiento = LocalDate.parse(request.getParameter("nacimiento"), formato);
        			//
        			Provincia provincia= new Provincia();
        			int idprovincia = Integer.parseInt(request.getParameter("provincias"));
        			provincia.setId(idprovincia);
        			//
        			Estado estado= new Estado();
        			estado.setIdEstado(Integer.parseInt(request.getParameter("estado")));
        			//
        			Alumno alumno = new Alumno();
        			Persona persona= new Persona();
        			//
        			persona.setNombre(request.getParameter("name"));
        			persona.setApellido(request.getParameter("apellido"));
        			persona.setDni(request.getParameter("dni"));
        			persona.setFechaNacimiento(FechaNacimiento);
        			persona.setDireccion(request.getParameter("direccion"));
        			persona.setProvincia(provincia);
        			persona.setEmail(request.getParameter("mail"));
        			persona.setTelefono(request.getParameter("telefono"));
        			alumno.setEstado(estado);
        			alumno.setPersona(persona);
        			
        			System.out.println(negocioA.verificar(persona.getDni()));
        			//
        			if(negocioA.verificar(persona.getDni())==true || negocioProf.verificar(persona.getDni())==true) {
        				Mensaje = "-2";
        			}
        			else if (negocioProf.existeEmail(request.getParameter("mail")) == true
							|| negocioA.existeEmail(request.getParameter("mail")) == true) {
        				Mensaje = "-3";
        			}
        			else {
        				aux = negocioA.GuardarAlumno(alumno);
        				Mensaje = String.valueOf(aux);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
    		}
    		
			HttpSession session = request.getSession();
			session.setAttribute("Mensaje", Mensaje);
			
			List<Provincia> ListaProvincia= negocioP.listaProvincias();
			request.setAttribute("ListaProvincia", ListaProvincia);
			
    		//OBTENGO LISTADO DE ESTADOS
			ArrayList<Estado> listaEstados = negocioE.obtenerEstados();
			request.setAttribute("listarEstados", listaEstados);   
			
			RequestDispatcher RequestDispatcher = request.getRequestDispatcher("/adm_alumnos_agregar.jsp");
			RequestDispatcher.forward(request, response);
		}
    		
    	if (request.getParameter("btnIrEditarAlumno") != null) {
    		int Legajo = Integer.parseInt(request.getParameter("txtLegajoAlumno"));
    		Alumno alum = negocioA.obtenerAlumnoLegajo(Legajo);
    		
    		//OBTENGO LISTADO DE PROVINCIAS
			ArrayList<Provincia> listaProvincias = negocioP.listaProvincias();
			request.setAttribute("listarProvincias", listaProvincias);
			
    		//OBTENGO LISTADO DE ESTADOS
			ArrayList<Estado> listaEstados = negocioE.obtenerEstados();
			request.setAttribute("listarEstados", listaEstados);   

    		request.setAttribute("AlumnoEditar", alum);
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/adm_alumnos_editar.jsp");
    		dispatcher.forward(request, response);

    	}
    	
		if (request.getParameter("btnEditarEstado") != null) {
			String Mensaje = null;
			int EstadoEditado = 0;
			if (request.getParameter("txtLegajoAlumno") != null) {
				try {
					EstadoEditado = negocioA.modificarAlumnoEstado(Integer.parseInt(request.getParameter("txtLegajoAlumno")));

				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			if (EstadoEditado==1) {				
				//MENSAJE "Estado modificado exitosamente";
				Mensaje = "1";	
			}		
			if (EstadoEditado==0) {	
				//MENSAJE "Hubo un error al intentar modificar el estado";
				Mensaje = "0";	
			}	
			if (EstadoEditado==-1) {	
				//MENSAJE "Hubo un error interno al intentar modificar el estado";
				Mensaje = "-1";	
			}
			HttpSession session = request.getSession();
			session.setAttribute("Mensaje", Mensaje);
			
			// OBTENER ALUMNOS
			ArrayList<Alumno> ListaAlumnos = negocioA.obtenerAlumnosTodos();
			request.setAttribute("ListaAlumnos", ListaAlumnos);

			RequestDispatcher rd = request.getRequestDispatcher("/adm_alumnos_listar.jsp");
			rd.forward(request, response);
		}
    	
    	if (request.getParameter("btnEditarAlumno") != null){
    		Alumno alum = null;
			int AlumnoModificado = 0;
			String Mensaje = null;
    		// Se completa el objeto de alumno con los datos del formulario.
    		
    		// Se valida que el DNI ya no este en uso
    		
    		if(request.getParameter("txtLegajo") != null && request.getParameter("txtNombre") != null && request.getParameter("txtApellido") != null
    			&& request.getParameter("txtDni")  != null && request.getParameter("txtDireccion") != null && request.getParameter("txtTelefono")  != null
    			&& request.getParameter("txtProvincia")  != null && request.getParameter("txtEstado") != null && request.getParameter("txtEmail") != null
    			&& request.getParameter("txtNacimiento")  != null) {
    			try {
    				
    	    		// USO DE FECHA
    	    		DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
    	    		LocalDate FechaNacimiento = LocalDate.parse(request.getParameter("txtNacimiento"), formato); 
    	    		
    	    		Persona per = new Persona();
    	    		alum = new Alumno();
    	    		
    	    		// SETEA AL ALUMNO CON LOS DATOS
    	    		per.setFechaNacimiento(FechaNacimiento);
    	    		alum.setLegajo(Integer.parseInt(request.getParameter("txtLegajo")));
    	    		per.setNombre(request.getParameter("txtNombre"));
    	    		per.setApellido(request.getParameter("txtApellido"));
    	    		per.setDni(request.getParameter("txtDni"));
    	    		per.setDireccion(request.getParameter("txtDireccion"));
    	    		per.setEmail(request.getParameter("txtEmail"));
    	    		per.setTelefono(request.getParameter("txtTelefono"));
    				// Provincia
    				Provincia provAlumno = new Provincia();
    				provAlumno.setId(Integer.parseInt(request.getParameter("txtProvincia")));
    				per.setProvincia(provAlumno);
    				alum.setPersona(per);
    	    		// Estado
    				Estado estAlumno = new Estado();
    				estAlumno.setIdEstado(Integer.parseInt(request.getParameter("txtEstado")));
    				alum.setEstado(estAlumno);
    				
    				// SE GRABAN LOS CAMBIOS EN LA BASE DE DATOS
    				AlumnoModificado = negocioA.modificarAlumno(alum);
    				
				} catch (Exception e) {
					// TODO: handle exception
				}
    		}
			if (AlumnoModificado==1) {	
				
				//MENSAJE "Alumno modificado exitosamente";
				Mensaje = "1";	
			}
			
			if (AlumnoModificado==0) {	
				
				//MENSAJE "Hubo un error al intentar modificar el alumno";
				Mensaje = "0";	
			}
			
			if (AlumnoModificado==-1) {	
				
				//MENSAJE "Hubo un error interno al intentar modificar el alumno";
				Mensaje = "0";	
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("Mensaje", Mensaje);
			
			// OBTENER ALUMNOS		
			ArrayList<Alumno> ListaAlumnos = negocioA.obtenerAlumnosTodos();
			request.setAttribute("ListaAlumnos", ListaAlumnos);
			
			RequestDispatcher rd = request.getRequestDispatcher("/adm_alumnos_listar.jsp");
			rd.forward(request, response);
    	}
    	
    	if (request.getParameter("btnCancelarEditarAlumno") != null){
    		
			// OBTENER ALUMNOS		
			ArrayList<Alumno> ListaAlumnos = negocioA.obtenerAlumnosTodos();
			request.setAttribute("ListaAlumnos", ListaAlumnos);
			
      		RequestDispatcher dispatcher = request.getRequestDispatcher("/adm_alumnos_listar.jsp");
    		dispatcher.forward(request, response);
    	}
	}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("Param").equals("ListarAlumnos")) {
			
			// OBTENER ALUMNOS		
			ArrayList<Alumno> ListaAlumnos = negocioA.obtenerAlumnosTodos();
			request.setAttribute("ListaAlumnos", ListaAlumnos);

			RequestDispatcher rd = request.getRequestDispatcher("/adm_alumnos_listar.jsp");
			rd.forward(request, response);

		}	
		if(request.getParameter("Param").equals("AgregarAlumnos")) {
			
			// OBTENGO LISTA DE PROVINCIAS
			List<Provincia> ListaProvincia= negocioP.listaProvincias();
			request.setAttribute("ListaProvincia", ListaProvincia);
			
    		//OBTENGO LISTADO DE ESTADOS
			ArrayList<Estado> listaEstados = negocioE.obtenerEstados();
			request.setAttribute("listarEstados", listaEstados);   
			
			RequestDispatcher rd = request.getRequestDispatcher("/adm_alumnos_agregar.jsp");
			rd.forward(request, response);	        
		}
		
	}
}
