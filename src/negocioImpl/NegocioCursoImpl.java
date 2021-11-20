package negocioImpl;

import java.util.ArrayList;

import dao.CursoDao;
import daoImpl.CursoDaoImpl;
import entidades.Alumno;
import entidades.Curso;
import negocio.NegocioCurso;

public class NegocioCursoImpl implements NegocioCurso{
	
	CursoDao dao = new CursoDaoImpl();
	
	@Override
	public ArrayList<Curso> ObtenerCursosPorLegajoProfesor(int NroLegajo) {
		return dao.ObtenerCursosPorLegajoProfesor(NroLegajo);
	}

	@Override
	public ArrayList<Curso> ObtenerAlumnosPorCurso(Curso Curso) {
		return dao.ObtenerAlumnosPorCurso(Curso);
	}

	@Override
	public boolean AgregarNotasCurso(ArrayList<Curso> Curso) {
		return dao.AgregarNotasCurso(Curso);
	}
	@Override
	public int AgregarNuevoCurso(Curso Curso) {
		return dao.AgregarNuevoCurso(Curso);
	}

	@Override
	public Curso ObtenerUnCurso(Curso Curso) {
		return dao.ObtenerUnCurso(Curso);
	}
	
	@Override
	public  ArrayList<Curso> ObtenerTodosLosCursos() {
		return dao.ObtenerTodosLosCursos();
	}

	@Override
	public ArrayList<Alumno> ObtenerAlumnosNoEstanEnElCurso(Curso Curso) {
		return dao.ObtenerAlumnosNoEstanEnElCurso(Curso);
	}

	@Override
	public boolean AgregarAlumnosAlCurso(ArrayList<Curso> Curso) {
		return dao.AgregarAlumnosAlCurso(Curso);
	}
}