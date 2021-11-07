package servletControlador;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Year;
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
import entidades.Estado;
import entidades.Materia;

//import com.sun.tools.javac.util.Convert;

import entidades.Profesor;
import entidades.Profesor2;
import entidades.Semestre;
import negocio.NegocioCurso;
import negocio.NegocioEstado;
import negocio.NegocioProfesor;
import negocioImpl.NegocioCursoImpl;
import negocioImpl.NegocioEstadoImpl;
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
			}
			else {
				
				try {
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
		// ####################################################
		// O B T E N E R   A L U M N O S   P O R   C U R S O
		// ####################################################
		
		if (request.getParameter("btnObtenerAlumnosPorCurso") != null) {
			
			int MateriaId = Integer.parseInt(request.getParameter("txtMateriaId"));
			String MateriaNombre = request.getParameter("txtMateriaNombre");			
			int SemestreId = Integer.parseInt(request.getParameter("txtSemestreId"));
			String SemestreNombre = request.getParameter("txtSemestreNombre");
			Year Anio = Year.of(Integer.parseInt(request.getParameter("txtAnio")));
			int Legajo = Integer.parseInt(request.getParameter("txtLegajo"));
			
			Materia Materia = new Materia();
			Materia.setId(MateriaId);
			Materia.setNombre(MateriaNombre);
			
			Semestre Semestre = new Semestre();
			Semestre.setId(SemestreId);
			Semestre.setNombre(SemestreNombre);
			
			// GUARDO LOS DATOS DEL CURSO EN UNA VARIABLE SESSION
			Curso Curso = new Curso(Materia, Semestre, Anio);
			HttpSession session = request.getSession();
			session.setAttribute("DatosDelCurso", Curso);
			//

			
			Profesor2 Profesor2 = new Profesor2();
			Profesor2.setLegajo(Legajo);
			
			NegocioCurso NegocioCurso = new NegocioCursoImpl();
			Curso = new Curso(Materia, Semestre, Anio, Profesor2);			
			ArrayList<Curso> lista = NegocioCurso.ObtenerAlumnosPorCurso(Curso);
			
			request.setAttribute("listaAlumnosPorCursos", lista);

			//OBTENGO LOS ESTADOS PARA CALIFICAR AL ALUMNO
			NegocioEstado NegocioEstado = new NegocioEstadoImpl();
			Curso = new Curso(Materia, Semestre, Anio, Profesor2);			
			ArrayList<Estado> ListaEstados = NegocioEstado.obtenerEstados();
			
			request.setAttribute("listaEstados", ListaEstados);
			
			RequestDispatcher rd = request.getRequestDispatcher("/agregarNota.jsp");
			rd.forward(request, response);			
		}
	}
}
// Probando repositorio