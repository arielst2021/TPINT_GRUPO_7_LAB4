package negocio;

import java.util.ArrayList;

import entidades.Curso;

public interface NegocioCurso {
	public ArrayList<Curso> ObtenerCursosPorLegajoProfesor(int NroLegajo);
	public ArrayList<Curso> ObtenerAlumnosPorCurso(Curso Curso);
	//
	public boolean AgregarNotasCurso(ArrayList<Curso> Curso);
	//
	public boolean AgregarNuevoCurso(Curso Curso);
	//
	public Curso ObtenerCurso(Curso Curso);
	
	public ArrayList<Curso> ObtenerCursos();
}
