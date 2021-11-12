package negocioImpl;

import java.util.ArrayList;

import dao.CursoDao;
import daoImpl.CursoDaoImpl;
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
}