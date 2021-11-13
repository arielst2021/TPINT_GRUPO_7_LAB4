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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("agregarNuevoCurso") != null) {
			
			Curso Curso= null;
			NegocioCurso NegocioCurso = new NegocioCursoImpl();

			String MateriaId = request.getParameter("materiaSeleccionada");
			String SemestreId = request.getParameter("semestreSeleccionado");
			String Anio = request.getParameter("anioSeleccionado");
			String LegajoProfesor = request.getParameter("profesorSeleccionado");
			//
//			String profesorNombre = request.getParameter("profesorNombre");
//			String profesorApellido = request.getParameter("profesorApellido");
//			String semestreNombre = request.getParameter("semestreNombre");
//			String materiaNombre = request.getParameter("materiaNombre");

			if (MateriaId != null && SemestreId != null && Anio != null && LegajoProfesor != null) {

				try {
					int Materia = Integer.parseInt(MateriaId);
					int Semestre = Integer.parseInt(SemestreId);
					Year AnioCurso = Year.of(Integer.parseInt(Anio));
					int Legajo = Integer.parseInt(LegajoProfesor);

					// INSTANCIO EL NUEVO CURSO
					Curso = new Curso(new Materia(Materia), new Semestre(Semestre), AnioCurso,
							new Profesor(Legajo));

					System.out.println("materiaId: " + MateriaId);
//					System.out.println("materia Nombre: " + materiaNombre);
					System.out.println("semestreId: " + SemestreId);
//					System.out.println("semestre Nombre: " + semestreNombre);
					System.out.println("anio: " + Anio);
					System.out.println("legajoId: " + LegajoProfesor);					
//					System.out.println("profesor Nombre: " + profesorNombre);
//					System.out.println("profesor Apellido: " + profesorApellido);

				} catch (Exception e) {
					// TODO: handle exception
				}
				
				if(Curso != null) {
					
					// SI PUDO AGREGAR EL CURSO EXITOSAMENTE
					// SI EL CURSO ES DISTINTO DE NULL LO AGREGO A LA BD
					if(NegocioCurso.AgregarNuevoCurso(Curso)) {
						
						// OBTENGO LOS ALUMNOS DEL CURSO		
						ArrayList<Curso> lista = NegocioCurso.ObtenerAlumnosPorCurso(Curso);
						request.setAttribute("listaCursos", lista);

						RequestDispatcher rd = request.getRequestDispatcher("/adm_cursos_agregar_alumnos.jsp");
						rd.forward(request, response);

					}
					else {
						//EL CURSO NO FUE AGREGADO
					}
				}
			}
		}
	}
}