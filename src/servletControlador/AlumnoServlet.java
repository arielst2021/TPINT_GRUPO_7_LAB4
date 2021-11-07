package servletControlador;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Alumno;
import negocio.NegocioAlumno;
import negocioImpl.NegocioAlumnoImpl;


@WebServlet("/AlumnoServlet")
public class AlumnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NegocioAlumno negocioA;
       

    public AlumnoServlet() {
        this.negocioA = new NegocioAlumnoImpl();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String accion = request.getParameter("accion");


		switch(accion) {
		case "crear":
			break;
		case "editar":
			break;
		case "cambiarEstado":
			break;
		case "listaralumnostodos":
			// Lista todos los alumnos
			obtenerAlumnosTodos(request,response);
			break;
		default:
			// Lista todos los alumnos
			obtenerAlumnosTodos(request,response);
			break;
		}
	}
	
	private void obtenerAlumnosTodos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ArrayList<Alumno> alumnosTodos = negocioA.obtenerAlumnosTodos();
		request.setAttribute("alumnosTodos", alumnosTodos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/listarAlumnos.jsp");
		dispatcher.forward(request, response);
	}
	
	/*private void editarAlumno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int legajo = Integer.parseInt(request.getParameter("alum_legajo"));
		// Obtengo todos los datos del formulario.
		Alumno alum = new Alumno();
		negocioA.editarAlumno(alum);
		response.sendRedirect("");
	}*/

}
