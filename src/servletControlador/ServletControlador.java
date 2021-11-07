package servletControlador;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Curso;

//import com.sun.tools.javac.util.Convert;

import entidades.Profesor;
import entidades.Profesor2;
import negocio.NegocioCurso;
import negocio.NegocioProfesor;
import negocioImpl.NegocioCursoImpl;
import negocioImpl.NegocioProfesorImpl;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletControlador() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("Param").equals("ObtenerCursosPorLegajoProfesor")) {
			NegocioCurso NegocioCurso = new NegocioCursoImpl();

			HttpSession session = request.getSession();
			if (session.getAttribute("perfil") != null) {
				Profesor2 Profesor2 = (Profesor2) session.getAttribute("perfil");
				int NroLegajo = Profesor2.getLegajo();

				ArrayList<Curso> lista = NegocioCurso.ObtenerCursosPorLegajoProfesor(NroLegajo);

				request.setAttribute("listaCursos", lista);

				RequestDispatcher rd = request.getRequestDispatcher("/listarCursosPorProfesor.jsp");
				rd.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnregistrar") != null) {

			String string = request.getParameter("nacimiento");
			SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
			Date fecha = null;
			try {

				System.out.println("Se pudo castear el date");
				fecha = (Date) formato.parse(request.getParameter("nacimiento"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("No se pudo castear el date");
			}

			int idprovincia = Integer.parseInt(request.getParameter("provincias"));

			NegocioProfesor negocioprofesor = new NegocioProfesorImpl();
			Profesor profesor = new Profesor();
			profesor.setNombre(request.getParameter("name"));
			profesor.setApellido(request.getParameter("apellido"));
			profesor.setContraseña(request.getParameter("password"));
			profesor.setDireccion(request.getParameter("direccion"));
			profesor.setDni(request.getParameter("dni"));
			profesor.setEstado(1);
			profesor.setPerfil(1);
			profesor.setTelefono(request.getParameter("telefono"));
			profesor.setUsuario(request.getParameter("dni"));
			profesor.setMail(request.getParameter("mail"));
			profesor.setFechanacimiento(fecha);
			profesor.setProvincia(idprovincia);

			negocioprofesor.guardarprofesor(profesor);

			RequestDispatcher miRequestDispatcher = request.getRequestDispatcher("/registro.jsp");
			miRequestDispatcher.forward(request, response);
		}

		// doGet(request, response);

		// ####################################################
		// S E S I O N - I N G R E S O
		// ####################################################
		// INGRESA EL USUARIO CON SU USER Y PASS
		if (request.getParameter("btnIngresarUsuario") != null) {
			String paginaDestino = "";
			String userProfesor = request.getParameter("txtUsuario");
			String passProfesor = request.getParameter("txtContrasenia");
			//
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
			Profesor2 Profesor2 = NegocioProfesor.iniciarSesion(userProfesor, passProfesor);
			//
			if (Profesor2 != null) {
				if (Profesor2.getPerfil().getId() == 1) {
					// ESTABLECE UN ATRIBUTO EN LA SESIÓN PARA ALMACENAR INFORMACIÓN
					// SOBRE EL PROFESOR CONECTADO
					HttpSession session = request.getSession();
					session.setAttribute("perfil", Profesor2);
					paginaDestino = "administrador.jsp";
				}
				if (Profesor2.getPerfil().getId() == 2) {
					// ESTABLECE UN ATRIBUTO EN LA SESIÓN PARA ALMACENAR INFORMACIÓN
					// SOBRE EL PROFESOR CONECTADO
					HttpSession session = request.getSession();
					session.setAttribute("perfil", Profesor2);
					paginaDestino = "profesor.jsp";
				}
			} else {
				response.sendRedirect("index.jsp");
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
		// ####################################################
		// S E S I O N - S A L I D A
		// ####################################################
	}
}
// Probando repositorio