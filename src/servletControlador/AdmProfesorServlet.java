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
import entidades.Provincia;

import negocio.NegocioProfesor;
import negocio.NegocioProvincia;

import negocioImpl.NegocioProfesorImpl;
import negocioImpl.NegocioProvinciaImpl;
import java.util.*;

/**
 * Servlet implementation class ProfesorServlet
 */
@WebServlet("/AdmProfesorServlet")
public class AdmProfesorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
			int profesoragregado = 0;
			String string = request.getParameter("nacimiento");
			SimpleDateFormat formato = new SimpleDateFormat(string);
			Date fecha = null;
			try {

				
				fecha = (Date) formato.parse(string);
				System.out.println("Se pudo castear el date");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(formato.toString());
				System.out.println("No se pudo castear el date");
			}

			
			Date input = new Date();
			LocalDate date = input.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			int idprovincia = Integer.parseInt(request.getParameter("provincias"));

			NegocioProfesor negocioprofesor = new NegocioProfesorImpl();
			Profesor profesor = new Profesor();
			Provincia provincia= new Provincia();
			Perfil perfil= new Perfil();
			Estado estado= new Estado();
			Persona persona= new Persona();
			
			perfil.setCodPerfil(Integer.parseInt( request.getParameter("perfil")));
			estado.setIdEstado(Integer.parseInt(request.getParameter("estado")));
			provincia.setId(idprovincia);
			
			
			persona.setNombre(request.getParameter("name"));
			persona.setApellido(request.getParameter("apellido"));
			profesor.setContrasenia(request.getParameter("password"));
			persona.setDireccion(request.getParameter("direccion"));
			persona.setDni(request.getParameter("dni"));
			profesor.setEstado(estado);
			profesor.setPerfil(perfil);
			persona.setTelefono(request.getParameter("telefono"));
			profesor.setUsuario(request.getParameter("dni"));
			persona.setEmail(request.getParameter("mail"));
			persona.setFechaNacimiento(date);
			persona.setProvincia(provincia);
			profesor.setPersona(persona);
			profesoragregado=negocioprofesor.guardarprofesor(profesor);
            
			request.setAttribute("respuestadb", profesoragregado);
			
			NegocioProvincia negocioProvincia = new NegocioProvinciaImpl();
			List<Provincia> ListaProvincia= negocioProvincia.listaProvincias();
			request.setAttribute("ListaProvincia", ListaProvincia);
			
			
			
			RequestDispatcher miRequestDispatcher = request.getRequestDispatcher("/adm_profesores_agregar.jsp");
			miRequestDispatcher.forward(request, response);
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
