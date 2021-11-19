package servletControlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Profesor;
import negocio.NegocioProfesor;
import negocioImpl.NegocioProfesorImpl;

@WebServlet("/InicioServlet")
public class InicioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InicioServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// INGRESA EL USUARIO CON SU USER Y PASS
		if (request.getParameter("btnIngresarUsuario") != null) {
			
			String paginaDestino = "index.jsp";
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
			Profesor Profesor = null;
			//
			String userProfesor = request.getParameter("txtUsuario");
			String passProfesor = request.getParameter("txtContrasenia");

			if (userProfesor != null && passProfesor != null) {
				Profesor = new Profesor();
				Profesor = NegocioProfesor.iniciarSesion(userProfesor, passProfesor);
			}

			if (Profesor != null) {

				try {
					if (Profesor.getPerfil().getId() == 1) {
						paginaDestino = "adm_inicio.jsp";
					}
					if (Profesor.getPerfil().getId() == 2) {
						paginaDestino = "prof_inicio.jsp";
					}
					// SESIÓN DEL PROFESOR CONECTADO
					HttpSession session = request.getSession();
					session.setAttribute("perfil", Profesor);
				} catch (Exception e) {
					//
					String Mensaje = "NO EXISTE USUARIO";

					HttpSession session = request.getSession();
					session.setAttribute("Mensaje", Mensaje);					

					System.out.println("NO EXISTE USUARIO");

				}

			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(paginaDestino);
			dispatcher.forward(request, response);
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
