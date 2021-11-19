package servletControlador;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Date;

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
import entidades.Persona;
import entidades.Provincia;
import negocio.NegocioAlumno;
import negocio.NegocioCurso;
import negocio.NegocioEstado;
import negocio.NegocioProvincia;
import negocioImpl.NegocioAlumnoImpl;
import negocioImpl.NegocioCursoImpl;
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

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if (request.getParameter("btnIrEditarAlumno") != null) {
    		int Legajo = Integer.parseInt(request.getParameter("txtLegajoAlumno"));
    		Alumno alum = negocioA.obtenerAlumnoLegajo(Legajo);
    		
    		//OBTENGO LISTADO DE PROVINCIAS
			ArrayList<Provincia> lista = negocioP.listaProvincias();
			request.setAttribute("listarProvincias", lista);    		

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
    		Alumno alum = new Alumno();
    		Persona per = new Persona();
    		// Se completa el objeto de alumno con los datos del formulario.
    		
    		// Se valida que el DNI ya no este en uso

    		// Persona2
    		System.out.println(request.getParameter("txtLegajo"));
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
			
			int resp = negocioA.modificarAlumno(alum);
			
			// OBTENER ALUMNOS		
			ArrayList<Alumno> ListaAlumnos = negocioA.obtenerAlumnosTodos();
			request.setAttribute("ListaAlumnos", ListaAlumnos);

			RequestDispatcher rd = request.getRequestDispatcher("/adm_alumnos_listar.jsp");
			rd.forward(request, response);
    	}
    	
    	if (request.getParameter("btnCancelarEditarAlumno") != null){
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
		
	}
	
	private void obtenerAlumnosTodos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ArrayList<Alumno> alumnosTodos = negocioA.obtenerAlumnosTodos();
		request.setAttribute("alumnosTodos", alumnosTodos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adm_alumnos_listar.jsp");
		dispatcher.forward(request, response);
	}
	

}
