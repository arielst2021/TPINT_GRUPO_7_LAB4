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
			
			String paginaDestino = "/adm_cursos_agregar.jsp";
			String Mensaje = null;

			NegocioCurso NegocioCurso = new NegocioCursoImpl();
			Curso Curso = null;
			Curso CursoDatos = null;
			int CursoAgregado = 0;

			// OBTENGO LOS DATOS DE LA VISTA ADM_CURSOS_AGREGAR
			String MateriaId = request.getParameter("txtMateriaId");
			String SemestreId = request.getParameter("txtSemestreId");
			String Anio = request.getParameter("txtAnio");
			String ProfesorLegajo = request.getParameter("txtProfesorLegajo");

			if (MateriaId != null && SemestreId != null && Anio != null && ProfesorLegajo != null) {
				try {
					int Materia = Integer.parseInt(request.getParameter("txtMateriaId"));
					int Semestre = Integer.parseInt(request.getParameter("txtSemestreId"));
					Year Fecha = Year.of(Integer.parseInt(request.getParameter("txtAnio")));
					int Profesor = Integer.parseInt(request.getParameter("txtProfesorLegajo"));

					Curso = new Curso(new Materia(Materia), new Semestre(Semestre), Fecha, new Profesor(Profesor));

					CursoAgregado = NegocioCurso.AgregarNuevoCurso(Curso);

				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			if (CursoAgregado==1) {	
				
				//MENSAJE
				Mensaje = "CURSO AGREGADO EXITOSAMENTE";
				
				System.out.println(Mensaje);
				
				// OBTENGO DATOS DEL CURSO
				CursoDatos = NegocioCurso.ObtenerUnCurso(Curso);
				request.setAttribute("NuevoCurso", CursoDatos);

				// OBTENGO LOS ALUMNOS QUE ESTAN EN EL CURSO
				ArrayList<Curso> CursoAlumnosLista = NegocioCurso.ObtenerAlumnosPorCurso(CursoDatos);
				request.setAttribute("CursoAlumnosLista", CursoAlumnosLista);

				// OBTENGO LOS ALUMNOS QUE NO ESTAN EN EL CURSO NI ESTAN DADOS DE BAJA
				ArrayList<Alumno> AlumnosNoEstanEnElCurso = NegocioCurso.ObtenerAlumnosNoEstanEnElCurso(CursoDatos);
				request.setAttribute("AlumnosNoEstanEnElCurso", AlumnosNoEstanEnElCurso);
				
				//
				paginaDestino = "/adm_cursos_agregar_alumnos.jsp";
				
			}
			else {
				if(CursoAgregado==0) {
				Mensaje = "HUBO UN ERROR AL INTENTAR AGREGAR EL CURSO";
				}
				if(CursoAgregado==-1) {
				Mensaje = "CURSO DUPLICADO, NO SE AGREGÓ EL CURSO";
				}
				
				System.out.println(Mensaje);
				System.out.println(CursoAgregado);
				
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
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("Mensaje", Mensaje);
			
			RequestDispatcher rd = request.getRequestDispatcher(paginaDestino);
			rd.forward(request, response);
		}

		// VIENE DE ADM_CURSOS_LISTAR
		if (request.getParameter("btnAgregarAlumnos") != null) {

			NegocioCurso NegocioCurso = new NegocioCursoImpl();
			Curso Curso = null;
			Curso CursoDatos = null;

			try {
				// OBTENGO LOS DATOS DE LA VISTA ADM_CURSOS_LISTAR
				int MateriaId = Integer.parseInt(request.getParameter("txtMateriaId"));
				int SemestreId = Integer.parseInt(request.getParameter("txtSemestreId"));
				Year Anio = Year.of(Integer.parseInt(request.getParameter("txtAnio")));
				int ProfesorLegajo = Integer.parseInt(request.getParameter("txtProfesorLegajo"));

				Curso = new Curso(new Materia(MateriaId), new Semestre(SemestreId), Anio, new Profesor(ProfesorLegajo));

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

				ArrayList<Curso> lista = NegocioCurso.ObtenerTodosLosCursos();
				request.setAttribute("listaCursos", lista);

				RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_listar.jsp");
				rd.forward(request, response);
			}
		}

		// AGREGA ALUMNOS AL CURSO
		if (request.getParameter("btnAgregarAlumnosAlCurso") != null) {

			ArrayList<Curso> ListaCurso = null;
			NegocioCurso NegocioCurso = new NegocioCursoImpl();

			int MateriaId = Integer.parseInt(request.getParameter("txtMateriaId"));
			int SemestreId = Integer.parseInt(request.getParameter("txtSemestreId"));
			Year Anio = Year.of(Integer.parseInt(request.getParameter("txtAnio")));
			int LegajoDocente = Integer.parseInt(request.getParameter("txtLegajoDocente"));

			// OBTENGO EL LEGAJO DEL ALUMNO
			String[] LegajoAlumno = request.getParameterValues("txtAlumnoLegajo");
			//

			if (LegajoAlumno != null) {
				ListaCurso = new ArrayList<Curso>();
				for (int i = 0; i < LegajoAlumno.length; i++) {
					int alumno = Integer.parseInt(LegajoAlumno[i]);
					ListaCurso.add(new Curso(new Materia(MateriaId), new Semestre(SemestreId), Anio,
							new Profesor(LegajoDocente), new Alumno(alumno)));
				}
			}

			if (ListaCurso != null) {
				// AGREGO ALUMNOS
				NegocioCurso.AgregarAlumnosAlCurso(ListaCurso);
			}

			// OBTENGO DATOS DEL CURSO
			Curso CursoDatos = NegocioCurso.ObtenerUnCurso(
					new Curso(new Materia(MateriaId), new Semestre(SemestreId), Anio, new Profesor(LegajoDocente)));
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
		}
	}
}