package negocio;

import java.util.ArrayList;

import entidades.Curso;

public interface NegocioCurso {
	public ArrayList<Curso> ObtenerCursosPorLegajoProfesor(int NroLegajo);
	public ArrayList<Curso> ObtenerAlumnosPorCurso(Curso Curso);
}