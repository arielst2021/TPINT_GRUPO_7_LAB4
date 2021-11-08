package servletControlador;

import java.io.IOException;
import java.time.Year;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Alumno;
import entidades.Curso;
import entidades.Provincia;
import negocio.NegocioAlumno;
import negocio.NegocioProvincia;
import negocioImpl.NegocioAlumnoImpl;
import negocioImpl.NegocioProvinciaImpl;


@WebServlet("/AlumnoServlet")
public class AlumnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NegocioAlumno negocioA;
       

    public AlumnoServlet() {
        this.negocioA = new NegocioAlumnoImpl();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if (request.getParameter("btnEditarAlumno") != null) {
    		int Legajo = Integer.parseInt(request.getParameter("txtLegajoAlumno"));
    		Alumno alum = negocioA.obtenerAlumnoLegajo(Legajo);
    		
    		//OBTENGO LISTADO DE PROVINCIAS
			NegocioProvincia NegocioProvincia = new NegocioProvinciaImpl();
			ArrayList<Provincia> lista = NegocioProvincia.listaProvincias();
			request.setAttribute("listarProvincias", lista);    		

    		request.setAttribute("AlumnoEditar", alum);
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/editarAlumno.jsp");
    		dispatcher.forward(request, response);

    	}
    	
    	if (request.getParameter("btnEditarEstado") != null){
    		int Legajo = Integer.parseInt(request.getParameter("txtLegajoAlumno"));
    		int resp = negocioA.modificarAlumnoEstado(Legajo);
    		System.out.println("hola");
    		System.out.println(resp);
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/listarAlumnos.jsp");
    		dispatcher.forward(request, response);
    	}
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		
	}
	
	private void obtenerAlumnosTodos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ArrayList<Alumno> alumnosTodos = negocioA.obtenerAlumnosTodos();
		request.setAttribute("alumnosTodos", alumnosTodos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/listarAlumnos.jsp");
		dispatcher.forward(request, response);
	}
	

}
