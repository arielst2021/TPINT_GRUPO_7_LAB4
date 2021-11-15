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
import entidades.Materia;
import entidades.Profesor;
import entidades.Semestre;
import negocio.NegocioCurso;
import negocio.NegocioMateria;
import negocio.NegocioProfesor;
import negocio.NegocioSemestre;
import negocioImpl.NegocioCursoImpl;
import negocioImpl.NegocioMateriaImpl;
import negocioImpl.NegocioProfesorImpl;
import negocioImpl.NegocioSemestreImpl;

@WebServlet("/AdmCursoServlet")
public class AdmCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdmCursoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("Param").equals("AgregarCursos")) {

			// OBTENGO LISTA DE PROFESORES
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
			ArrayList<Profesor> lista = NegocioProfesor.listaProfesores();
			request.setAttribute("listaProfesores", lista);

			// OBTENGO LISTA DE MATERIAS
			NegocioMateria NegocioMateria = new NegocioMateriaImpl();
			ArrayList<Materia> listaMaterias = NegocioMateria.obtenerMaterias();
			request.setAttribute("listaMaterias", listaMaterias);

			// OBTENGO LISTA DE SEMESTRES
			NegocioSemestre NegocioSemestre = new NegocioSemestreImpl();
			ArrayList<Semestre> listaSemestres = NegocioSemestre.obtenerSemestres();
			request.setAttribute("listaSemestres", listaSemestres);

			RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_agregar.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("Param").equals("ListarCursos")) {

			NegocioCurso NegocioCurso = new NegocioCursoImpl();
			ArrayList<Curso> lista = NegocioCurso.ObtenerTodosLosCursos();

			request.setAttribute("listaCursos", lista);

			RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_listar.jsp");
			rd.forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("agregarNuevoCurso") != null) {

			Curso Curso = null;
			Curso CursoDatos = null;
			NegocioCurso NegocioCurso = new NegocioCursoImpl();

			try {

				int Materia = Integer.parseInt(request.getParameter("materiaSeleccionada"));
				int Semestre = Integer.parseInt(request.getParameter("semestreSeleccionado"));
				Year AnioCurso = Year.of(Integer.parseInt(request.getParameter("anioSeleccionado")));
				int Legajo = Integer.parseInt(request.getParameter("profesorSeleccionado"));

				Curso = new Curso(new Materia(Materia), new Semestre(Semestre), AnioCurso, new Profesor(Legajo));

				// OBTENGO DATOS DEL CURSO
				CursoDatos = NegocioCurso.ObtenerUnCurso(Curso);
				request.setAttribute("NuevoCurso", CursoDatos);

				// OBTENGO LOS ALUMNOS QUE ESTAN EN EL CURSO
				ArrayList<Curso> CursoAlumnosLista = NegocioCurso.ObtenerAlumnosPorCurso(CursoDatos);
				request.setAttribute("CursoAlumnosLista", CursoAlumnosLista);

				// OBTENGO LOS ALUMNOS QUE NO ESTAN EN EL CURSO NI ESTAN DADOS DE BAJA
				ArrayList<Alumno> AlumnosNoEstanEnElCurso = NegocioCurso.ObtenerAlumnosNoEstanEnElCurso(CursoDatos);
				request.setAttribute("AlumnosNoEstanEnElCurso", AlumnosNoEstanEnElCurso);

				// VOY A ADM_CURSOS_AGREGAR_ALUMNOS
				RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_agregar_alumnos.jsp");
				rd.forward(request, response);

			} catch (Exception e) {
				// TODO: handle exception
			}

			if (CursoDatos != null) {

				// SI PUDO AGREGAR EL CURSO EXITOSAMENTE
				// SI EL CURSO ES DISTINTO DE NULL LO AGREGO A LA BD
				if (NegocioCurso.AgregarNuevoCurso(CursoDatos)) {

					// OBTENGO DATOS DEL CURSO
					CursoDatos = NegocioCurso.ObtenerUnCurso(CursoDatos);

					// GUARDO LOS DATOS DEL CURSO EN UNA VARIABLE SESSION
					HttpSession session = request.getSession();
					session.setAttribute("DatosNuevoCurso", CursoDatos);
					//
					request.setAttribute("NuevoCurso", CursoDatos);

					// OBTENGO LOS ALUMNOS QUE NO ESTAN EN EL CURSO NI ESTAN DADOS DE BAJA
					ArrayList<Alumno> AlumnosNoEstanEnElCurso = NegocioCurso.ObtenerAlumnosNoEstanEnElCurso(CursoDatos);
					request.setAttribute("AlumnosNoEstanEnElCurso", AlumnosNoEstanEnElCurso);

					// OBTENGO LOS ALUMNOS QUE ESTAN EN EL CURSO
					ArrayList<Curso> CursoAlumnosLista = NegocioCurso.ObtenerAlumnosPorCurso(CursoDatos);
					request.setAttribute("CursoAlumnosLista", CursoAlumnosLista);

					RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_agregar_alumnos.jsp");
					rd.forward(request, response);

				} else {
					// EL CURSO NO FUE AGREGADO
				}

			}
			// OBTENGO LISTA DE PROFESORES
			NegocioProfesor NegocioProfesor = new NegocioProfesorImpl();
			ArrayList<Profesor> lista = NegocioProfesor.listaProfesores();
			request.setAttribute("listaProfesores", lista);

			// OBTENGO LISTA DE MATERIAS
			NegocioMateria NegocioMateria = new NegocioMateriaImpl();
			ArrayList<Materia> listaMaterias = NegocioMateria.obtenerMaterias();
			request.setAttribute("listaMaterias", listaMaterias);

			// OBTENGO LISTA DE SEMESTRES
			NegocioSemestre NegocioSemestre = new NegocioSemestreImpl();
			ArrayList<Semestre> listaSemestres = NegocioSemestre.obtenerSemestres();
			request.setAttribute("listaSemestres", listaSemestres);

			RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_agregar.jsp");
			rd.forward(request, response);
		}

		// VIENE DE ADM_CURSOS_LISTAR
		if (request.getParameter("btnAgregarAlumnos") != null) {

			try {

				NegocioCurso NegocioCurso = new NegocioCursoImpl();
				Curso Curso = null;
				Curso CursoDatos = null;

				int MateriaId = Integer.parseInt(request.getParameter("txtMateriaId"));
				int SemestreId = Integer.parseInt(request.getParameter("txtSemestreId"));
				Year Anio = Year.of(Integer.parseInt(request.getParameter("txtAnio")));
				int ProfesorLegajo = Integer.parseInt(request.getParameter("txtProfesorLegajo"));

				System.out.println(MateriaId);
				System.out.println(SemestreId);
				System.out.println(Anio);
				System.out.println(ProfesorLegajo);

				Curso = new Curso(new Materia(MateriaId), new Semestre(SemestreId), Anio, new Profesor(ProfesorLegajo));

				// OBTENGO DATOS DEL CURSO
				CursoDatos = NegocioCurso.ObtenerUnCurso(Curso);

				System.out.println(CursoDatos.getMateria().getNombre());
				System.out.println(CursoDatos.getSemestre().getNombre());
				System.out.println(CursoDatos.getAnio());
				System.out.println(CursoDatos.getProfesor().getPersona().getApellido());

				request.setAttribute("NuevoCurso", CursoDatos);

				// OBTENGO LOS ALUMNOS QUE ESTAN EN EL CURSO
				ArrayList<Curso> CursoAlumnosLista = NegocioCurso.ObtenerAlumnosPorCurso(CursoDatos);
				request.setAttribute("CursoAlumnosLista", CursoAlumnosLista);

				// OBTENGO LOS ALUMNOS QUE NO ESTAN EN EL CURSO NI ESTAN DADOS DE BAJA
				ArrayList<Alumno> AlumnosNoEstanEnElCurso = NegocioCurso.ObtenerAlumnosNoEstanEnElCurso(CursoDatos);
				request.setAttribute("AlumnosNoEstanEnElCurso", AlumnosNoEstanEnElCurso);

				// VOY A ADM_CURSOS_AGREGAR_ALUMNOS
				RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_agregar_alumnos.jsp");
				rd.forward(request, response);

			} catch (Exception e) {
				// TODO: handle exception
			}

			NegocioCurso NegocioCurso = new NegocioCursoImpl();
			ArrayList<Curso> lista = NegocioCurso.ObtenerTodosLosCursos();

			request.setAttribute("listaCursos", lista);

			RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_listar.jsp");
			rd.forward(request, response);
		}
	}
}