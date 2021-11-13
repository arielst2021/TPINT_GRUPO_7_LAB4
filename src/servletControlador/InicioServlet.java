package servletControlador;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Curso;
import entidades.Profesor2;
import negocio.NegocioCurso;
import negocio.NegocioProfesor;
import negocioImpl.NegocioCursoImpl;
import negocioImpl.NegocioProfesorImpl;

/**
 * Servlet implementation class InicioServlet
 */
@WebServlet("/InicioServlet")
public class InicioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("Param").equals("ObtenerCursosPorLegajoProfesor")) {
			NegocioCurso NegocioCurso = new NegocioCursoImpl();

			HttpSession session = request.getSession();
			if (session.getAttribute("perfil") != null) {
				Profesor2 Profesor2 = (Profesor2) session.getAttribute("perfil");
				int NroLegajo = Profesor2.getLegajo();

				ArrayList<Curso> lista = NegocioCurso.ObtenerCursosPorLegajoProfesor(NroLegajo);

				request.setAttribute("listaCursos", lista);

				RequestDispatcher rd = request.getRequestDispatcher("/prof_cursos_listar.jsp");
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ####################################################
		// S E S I O N - L O G I N - L O G O U T
		// ####################################################
		// INGRESA EL USUARIO CON SU USER Y PASS
		if (request.getParameter("btnIngresarUsuario") != null) {
			String paginaDestino = "index.jsp";
			String userProfesor = request.getParameter("txtUsuario");
			String passProfesor = request.getParameter("txtContrasenia");
			//
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
			Profesor2 Profesor2 = NegocioProfesor.iniciarSesion(userProfesor, passProfesor);
			//
			if (Profesor2 == null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(paginaDestino);
				dispatcher.forward(request, response);
			} else {

				try {
					if (Profesor2.getPerfil().getId() == 1) {
						// ESTABLECE UN ATRIBUTO EN LA SESIÓN PARA ALMACENAR INFORMACIÓN
						// SOBRE EL PROFESOR CONECTADO
						HttpSession session = request.getSession();
						session.setAttribute("perfil", Profesor2);
						paginaDestino = "adm_inicio.jsp";
					}
					if (Profesor2.getPerfil().getId() == 2) {
						// ESTABLECE UN ATRIBUTO EN LA SESIÓN PARA ALMACENAR INFORMACIÓN
						// SOBRE EL PROFESOR CONECTADO
						HttpSession session = request.getSession();
						session.setAttribute("perfil", Profesor2);
						paginaDestino = "prof_inicio.jsp";
					}
					RequestDispatcher dispatcher = request.getRequestDispatcher(paginaDestino);
					dispatcher.forward(request, response);

				} catch (Exception e) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(paginaDestino);
					dispatcher.forward(request, response);
				}
			}

		}
		
		// SALE EL USUARIO DE LA SESION
		if (request.getParameter("btnSalirUsuario") != null) {
			HttpSession session = request.getSession(false);
			session.setAttribute("perfil", null);
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	}

}
