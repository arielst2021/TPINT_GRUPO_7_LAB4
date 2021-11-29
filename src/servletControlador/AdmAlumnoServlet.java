package servletControlador;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Year;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Alumno;
import entidades.Curso;
import entidades.Estado;
import entidades.Materia;
import entidades.Persona;
import entidades.Profesor;
import entidades.Provincia;
import entidades.Semestre;
import negocio.NegocioAlumno;
import negocio.NegocioCurso;
import negocio.NegocioEstado;
import negocio.NegocioProvincia;
import negocioImpl.NegocioAlumnoImpl;
import negocioImpl.NegocioCursoImpl;
import negocioImpl.NegocioEstadoImpl;
import negocioImpl.NegocioProvinciaImpl;


@WebServlet("/AdmAlumnoServlet")
public class AdmAlumnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NegocioAlumno negocioA;
	private NegocioProvincia negocioP; 
	private NegocioEstado negocioE;
       

    public AdmAlumnoServlet() {
        this.negocioA = new NegocioAlumnoImpl();
        this.negocioP = new NegocioProvinciaImpl();
        this.negocioE = new NegocioEstadoImpl();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	if(request.getParameter("btnAgregarAlumno")!=null) {

			
    		int aux=0;
    		String nacimiento  = request.getParameter("nacimiento");
    		System.out.println(nacimiento);
    		SimpleDateFormat DateFormat = new SimpleDateFormat(nacimiento);
    		Date fecha = null;
    		
    		try {
    			fecha = (Date)DateFormat.parse(nacimiento);
    		}
    		catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			System.out.println(DateFormat.toString());
    		}
    		

			Date input = new Date();
			LocalDate date = input.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			int idprovincia = Integer.parseInt(request.getParameter("provincias"));

			NegocioAlumno NegAlumno = new NegocioAlumnoImpl();
			Alumno alumno = new Alumno();
			Provincia provincia= new Provincia();
			Estado estado= new Estado();
			Persona persona= new Persona();
			
			estado.setIdEstado(Integer.parseInt(request.getParameter("estado")));
			provincia.setId(idprovincia);
			
			
			persona.setNombre(request.getParameter("name"));
			persona.setApellido(request.getParameter("apellido"));
			persona.setDni(request.getParameter("dni"));
			persona.setFechaNacimiento(date);
			persona.setDireccion(request.getParameter("direccion"));
			persona.setProvincia(provincia);
			persona.setEmail(request.getParameter("mail"));
			persona.setTelefono(request.getParameter("telefono"));
			alumno.setEstado(estado);
			
			
			
			alumno.setPersona(persona);
			
			if(NegAlumno.verificar(persona.getDni())==false) {
				aux=NegAlumno.GuardarAlumno(alumno);
				request.setAttribute("respuestadb", aux);
				String Mensaje="1";
				HttpSession session = request.getSession();
				session.setAttribute("Mensaje", Mensaje);
			}
			else {
				String Mensaje="0";
				HttpSession session = request.getSession();
				session.setAttribute("Mensaje", Mensaje);
			}
			
			NegocioProvincia negocioProvincia = new NegocioProvinciaImpl();
			List<Provincia> ListaProvincia= negocioProvincia.listaProvincias();
			request.setAttribute("ListaProvincia", ListaProvincia);
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
    	
    	if (request.getParameter("btnEditarEstado") != null){
    		int Legajo = Integer.parseInt(request.getParameter("txtLegajoAlumno"));
    		int resp = negocioA.modificarAlumnoEstado(Legajo);


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
    	    		System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"+FechaNacimiento);
    	    		
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
			NegocioProvincia negocioProvincia = new NegocioProvinciaImpl();
			List<Provincia> ListaProvincia= negocioProvincia.listaProvincias();
			request.setAttribute("ListaProvincia", ListaProvincia);
			
			RequestDispatcher rd = request.getRequestDispatcher("/adm_alumnos_agregar.jsp");
			rd.forward(request, response);	        
		}
		
	}
	
	private void obtenerAlumnosTodos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ArrayList<Alumno> alumnosTodos = negocioA.obtenerAlumnosTodos();
		request.setAttribute("alumnosTodos", alumnosTodos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adm_alumnos_listar.jsp");
		dispatcher.forward(request, response);
	}
	

}
