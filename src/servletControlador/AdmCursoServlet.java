package servletControlador;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidades.Profesor;

import negocio.NegocioProfesor;

import negocioImpl.NegocioProfesorImpl;

@WebServlet("/AdmCursoServlet")
public class AdmCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdmCursoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("Param").equals("AgregarCursos")) {
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
			ArrayList<Profesor> lista = NegocioProfesor.listaProfesores();

			request.setAttribute("listaProfesores", lista);

			RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_agregar.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}