package servletControlador;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import entidades.Persona;
import entidades.Estado;
import entidades.Provincia;
import entidades.Perfil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Materia;
import entidades.Profesor;
import entidades.Provincia;

import negocio.NegocioProfesor;
import negocio.NegocioProvincia;

import negocioImpl.NegocioProfesorImpl;
import negocioImpl.NegocioProvinciaImpl;


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
				
				List<Profesor> ListaProfesor = negocioProfesor.listaProfesores();
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
		
		if (request.getParameter("EstadoProfesor") != null) {

			String string = request.getParameter("LegajoProfesor");
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
			NegocioProfesor.BajaProfesor(string);
			
			List<Profesor> ListaProfesor = NegocioProfesor.listaProfesores();
			request.setAttribute("ListaProfesor", ListaProfesor);
			
			RequestDispatcher miRequestDispatcher = request.getRequestDispatcher("/adm_profesores_listar.jsp");
			miRequestDispatcher.forward(request, response);
		}
	}

}
