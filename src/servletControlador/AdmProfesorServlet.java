package servletControlador;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import entidades.Persona;
import entidades.Alumno;
import entidades.Estado;
import entidades.Provincia;
import entidades.Perfil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Materia;
import entidades.Profesor;
import negocio.NegocioAlumno;
import negocio.NegocioEstado;
import negocio.NegocioProfesor;
import negocio.NegocioProvincia;
import negocioImpl.NegocioAlumnoImpl;
import negocioImpl.NegocioEstadoImpl;
import negocioImpl.NegocioProfesorImpl;
import negocioImpl.NegocioProvinciaImpl;
import java.util.*;

/**
 * Servlet implementation class ProfesorServlet
 */
@WebServlet("/AdmProfesorServlet")
public class AdmProfesorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NegocioAlumno NegocioA = new NegocioAlumnoImpl();
	private NegocioProfesor NegocioP = new NegocioProfesorImpl();
	private NegocioProvincia negocioP = new NegocioProvinciaImpl();
	private NegocioEstado negocioE = new NegocioEstadoImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmProfesorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("Param")!=null)
		{
			if(request.getParameter("Param").equals("AgregarProfesores")) {
				
				// OBTENGO LISTA DE PROVINCIAS
				NegocioProvincia negocioProvincia = new NegocioProvinciaImpl();
				List<Provincia> ListaProvincia= negocioProvincia.listaProvincias();
				request.setAttribute("ListaProvincia", ListaProvincia);
				
				RequestDispatcher rd = request.getRequestDispatcher("/adm_profesores_agregar.jsp");
				rd.forward(request, response);	        
			}	
			
			if(request.getParameter("Param").equals("ListarProfesores")) {
				
				// OBTENGO LISTA DE PROVINCIAS
				NegocioProfesor negocioProfesor = new NegocioProfesorImpl();
				
				List<Profesor> ListaProfesor = negocioProfesor.listaTodosProfesores();
				request.setAttribute("ListaProfesor", ListaProfesor);
				
				RequestDispatcher rd = request.getRequestDispatcher("/adm_profesores_listar.jsp");
				rd.forward(request, response);	        
			}	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if (request.getParameter("btnregistrar") != null) {
			int ProfesorAgregado = 0;
			String MensajeRegistrar = "0";
			if(request.getParameter("name") != null && request.getParameter("apellido") != null && request.getParameter("dni") != null
        			&& request.getParameter("nacimiento")  != null && request.getParameter("provincias") != null && request.getParameter("estado")  != null
        			&& request.getParameter("direccion")  != null && request.getParameter("mail") != null && request.getParameter("telefono") != null) 
			{
				try {

    	    		// USO DE FECHA
    	    		DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
    	    		LocalDate FechaNacimiento = LocalDate.parse(request.getParameter("nacimiento"), formato);
    	    		
    	    		Persona persona = new Persona();
    	    		Profesor profesor = new Profesor();
    	    		//
    	    		Provincia provincia= new Provincia();
        			int idprovincia = Integer.parseInt(request.getParameter("provincias"));
        			provincia.setId(idprovincia);
        			//
        			Estado estado= new Estado();
        			estado.setIdEstado(Integer.parseInt(request.getParameter("estado")));
        			Perfil perfil= new Perfil();
        			perfil.setCodPerfil(2);
    	    		// PERSONA -> PROFESOR
    	    		persona.setNombre(request.getParameter("name"));
    	    		persona.setApellido(request.getParameter("apellido"));
        			persona.setDni(request.getParameter("dni"));
        			persona.setFechaNacimiento(FechaNacimiento);
        			persona.setDireccion(request.getParameter("direccion"));
        			persona.setProvincia(provincia);
        			persona.setEmail(request.getParameter("mail"));
        			persona.setTelefono(request.getParameter("telefono"));
    	    		profesor.setPersona(persona);
    	    		profesor.setEstado(estado);
    	    		profesor.setUsuario(request.getParameter("usuario"));
    	    		profesor.setPerfil(perfil);
    	    		profesor.setContrasenia(request.getParameter("password"));


    				// SE VALIDA QUE EL DNI NO HAYA SUDO UTILIZADO NI EN ALGUN ALUMNO NI EN PROFESORES
    	    		if(NegocioA.verificar(persona.getDni())==true || NegocioP.verificar(persona.getDni())==true) {
    	    		request.setAttribute("respuestadb", "-1");
    	    		MensajeRegistrar="-1";
    	    		System.out.println(NegocioP.existeUsuario(request.getParameter("usuario")));
    	    		}else if(NegocioP.existeUsuario(request.getParameter("usuario"))==true) {
        	    		request.setAttribute("respuestadb", "-2");
        	    		MensajeRegistrar="-2";
    	    		}else if(NegocioP.existeEmail(request.getParameter("mail"))==true || NegocioA.existeEmail(request.getParameter("mail"))==true) {
    	    			request.setAttribute("respuestadb", "-3");
        	    		MensajeRegistrar="-3";
    	    		}
    	    		else {
    	    			ProfesorAgregado = NegocioP.guardarprofesor(profesor);
        	    		request.setAttribute("respuestadb", ProfesorAgregado);
        	    		MensajeRegistrar="1";
    	    		}
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("Mensaje", MensajeRegistrar);
				 
				List<Provincia> ListaProvincia= negocioP.listaProvincias();
				request.setAttribute("ListaProvincia", ListaProvincia);
				
	    		//OBTENGO LISTADO DE ESTADOS
				ArrayList<Estado> listaEstados = negocioE.obtenerEstados();
				request.setAttribute("listarEstados", listaEstados); 
				
				RequestDispatcher RequestDispatcher = request.getRequestDispatcher("/adm_profesores_agregar.jsp");
				RequestDispatcher.forward(request, response);
		}
		
		if (request.getParameter("EditarEstado") != null) {

			String string = request.getParameter("LegajoProfesor");
			String estado = request.getParameter("EstadoProfesor");
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
			
			NegocioProfesor.BajaProfesor(new Profesor(Integer.parseInt(string),new Estado(Integer.parseInt(estado))));
	
			List<Profesor> ListaProfesor = NegocioProfesor.listaTodosProfesores();
			request.setAttribute("ListaProfesor", ListaProfesor);
			
			RequestDispatcher miRequestDispatcher = request.getRequestDispatcher("/adm_profesores_listar.jsp");
			miRequestDispatcher.forward(request, response);
		}
		if (request.getParameter("EditarProfesor") != null) {
			
			String Legajo = request.getParameter("LegajoProfesor");
    		
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
    		Profesor profe = new Profesor();
    		profe = NegocioProfesor.ProfePorLegajo(Legajo);
    		// OBTENGO LISTA DE PROVINCIAS
			NegocioProvincia negocioProvincia = new NegocioProvinciaImpl();
			List<Provincia> ListaProvincia= negocioProvincia.listaProvincias();
			request.setAttribute("ListaProvincia", ListaProvincia);	
			
			
    		request.setAttribute("EditarProfesor", profe);
			RequestDispatcher miRequestDispatcher = request.getRequestDispatcher("/adm_profesores_editar.jsp");
			miRequestDispatcher.forward(request, response);
		}
		
		if (request.getParameter("btnEditarProfesor") != null){
			Profesor Profe = null;
			int ProfesorModificado = 0;
			String Mensaje = null;
			
			NegocioProfesor NegocioP = new NegocioProfesorImpl();
			//
    		
    		if(request.getParameter("txtLegajo") != null && request.getParameter("txtNombre") != null && request.getParameter("txtApellido") != null
    			&& request.getParameter("txtDni")  != null && request.getParameter("txtDireccion") != null && request.getParameter("txtTelefono")  != null
    			&& request.getParameter("txtProvincia")  != null && request.getParameter("txtUsuario") != null && request.getParameter("txtEmail") != null
    			&& request.getParameter("txtNacimiento")  != null) {
    			try {
    				
    	    		// USO DE FECHA
    	    		DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
    	    		LocalDate FechaNacimiento = LocalDate.parse(request.getParameter("txtNacimiento"), formato); 
    	    		
    	    		Persona per = new Persona();
    	    		Profe = new Profesor();
    	    		
    	    		// SETEA AL ALUMNO CON LOS DATOS
    	    		per.setFechaNacimiento(FechaNacimiento);
    	    		Profe.setLegajo(Integer.parseInt(request.getParameter("txtLegajo")));
    	    		Profe.setUsuario(request.getParameter("txtUsuario"));
    	    		per.setNombre(request.getParameter("txtNombre"));
    	    		per.setApellido(request.getParameter("txtApellido"));
    	    		per.setDni(request.getParameter("txtDni"));
    	    		per.setDireccion(request.getParameter("txtDireccion"));
    	    		per.setEmail(request.getParameter("txtEmail"));
    	    		per.setTelefono(request.getParameter("txtTelefono"));
    				// Provincia
    				Provincia provProfesor = new Provincia();
    				provProfesor.setId(Integer.parseInt(request.getParameter("txtProvincia")));
    				per.setProvincia(provProfesor);
    				Profe.setPersona(per);
    				
    				// SE GRABAN LOS CAMBIOS EN LA BASE DE DATOS
    				ProfesorModificado = NegocioP.ModificarProfesor(Profe);
    				
    				
				} catch (Exception e) {
					// TODO: handle exception
				}
    		}
			if (ProfesorModificado==1) {	
				//MENSAJE "Profesor modificado exitosamente";
				Mensaje = "1";	
			}
			
			if (ProfesorModificado==0) {	
				
				//MENSAJE "Hubo un error al intentar modificar el profesor";
				Mensaje = "0";	
			}
			
			if (ProfesorModificado==-1) {	
				
				//MENSAJE "Hubo un error interno al intentar modificar el profesor";
				Mensaje = "0";	
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("Mensaje", Mensaje);
			
			// OBTENER PROFESORES		
			List<Profesor> ListaProfesor = NegocioP.listaTodosProfesores();
			request.setAttribute("ListaProfesor", ListaProfesor);
			
			RequestDispatcher rd = request.getRequestDispatcher("/adm_profesores_listar.jsp");
			rd.forward(request, response);
    	}
		
    	if (request.getParameter("btnCancelarEditarProfesor") != null){
    		
    		NegocioProfesor NegocioP = new NegocioProfesorImpl();
    		
			// OBTENER PROFESORES		
			List<Profesor> ListaProfesor = NegocioP.listaTodosProfesores();
			request.setAttribute("ListaProfesor", ListaProfesor);
			
			RequestDispatcher rd = request.getRequestDispatcher("/adm_profesores_listar.jsp");
			rd.forward(request, response);	
    	}		
	}
}
}
