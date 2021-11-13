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
import entidades.Estado;
import entidades.Materia;
import entidades.Profesor;
import entidades.Semestre;
import negocio.NegocioCurso;
import negocio.NegocioEstado;
import negocioImpl.NegocioCursoImpl;
import negocioImpl.NegocioEstadoImpl;

/**
 * Servlet implementation class ProfesorLogueadoServlet
 */
@WebServlet("/ProfCursoServlet")
public class ProfCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfCursoServlet() {
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
				Profesor Profesor2 = (Profesor) session.getAttribute("perfil");
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {



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
		
			Profesor Profesor2 = new Profesor();
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
			
			RequestDispatcher rd = request.getRequestDispatcher("prof_cursos_calificar.jsp");
			rd.forward(request, response);			
		}
		
		if (request.getParameter("btnGuardarNotas") != null) {

			ArrayList<Curso> Curso = new ArrayList<Curso>();
			NegocioCurso NegocioCurso = new NegocioCursoImpl();
			
			int MateriaId = Integer.parseInt(request.getParameter("txtMateriaId"));			
			int SemestreId = Integer.parseInt(request.getParameter("txtSemestreId"));
			Year Anio = Year.of(Integer.parseInt(request.getParameter("txtAnio")));
			int LegajoDocente = Integer.parseInt(request.getParameter("txtLegajoDocente"));
			
			String []Nota1 = request.getParameterValues("Nota1");
			String []Nota2 = request.getParameterValues("Nota2");
			String []Nota3 = request.getParameterValues("Nota3");
			String []Nota4 = request.getParameterValues("Nota4");
			String []EstadoId = request.getParameterValues("estadoAlumno");
			
			String []LegajoAlumno = request.getParameterValues("txtLegajoAlumno");
			//
			Materia Materia = new Materia();
			Materia.setId(MateriaId);
			Semestre Semestre = new Semestre();
			Semestre.setId(SemestreId);
			//
			Profesor Profesor2 = new Profesor();
			Profesor2.setLegajo(LegajoDocente);
					
			for(int i = 0; i < LegajoAlumno.length; i++) {			
				try {
					Float notaDecimal1 = Float.parseFloat(Nota1[i]);
					Float notaDecimal2 = Float.parseFloat(Nota2[i]);
					Float notaDecimal3 = Float.parseFloat(Nota3[i]);
					Float notaDecimal4 = Float.parseFloat(Nota4[i]);
					int EstadoNuevo = Integer.parseInt(EstadoId[i]);
					if(notaDecimal1 >= 0 && notaDecimal1 <= 10 && notaDecimal2 >= 0 && notaDecimal2 <= 10 && notaDecimal3 >= 0 && notaDecimal3 <= 10 && notaDecimal4 >= 0 && notaDecimal4 <= 10) { // LA NOTA INGRESADA DEBE SER ENTRE 0 Y 10
						Alumno Alumno = new Alumno();
						Alumno.setLegajo(Integer.parseInt(LegajoAlumno[i]));
						Estado Estado = new Estado();
						Estado.setIdEstado(EstadoNuevo);
						Curso.add(new Curso(Materia,Semestre,Anio, Profesor2, Alumno, notaDecimal1, notaDecimal2, notaDecimal3, notaDecimal4, Estado));
					}					
				} catch (Exception e) {
					// SI EL VALOR INGRESADO EN EL TEXT NO ES VALIDO NO SE AGREGA LA NOTA EN LA BASE DE DATOS
				}
			}
			
			if(Curso!=null) {			
				NegocioCurso.AgregarNotasCurso(Curso);
			}
			
			Curso CursoLista = new Curso(Materia, Semestre, Anio, Profesor2);

			ArrayList<Curso> lista = NegocioCurso.ObtenerAlumnosPorCurso(CursoLista);				
			request.setAttribute("listaAlumnosPorCursos", lista);

			//OBTENGO LOS ESTADOS PARA CALIFICAR AL ALUMNO
			NegocioEstado NegocioEstado = new NegocioEstadoImpl();
			ArrayList<Estado> ListaEstados = NegocioEstado.obtenerEstados();
			
			request.setAttribute("listaEstados", ListaEstados);
			
			RequestDispatcher rd = request.getRequestDispatcher("prof_cursos_calificar.jsp");
			rd.forward(request, response);		
		}
	}
}
