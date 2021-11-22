package negocio;

import java.util.ArrayList;

import entidades.Alumno;
import entidades.Curso;

public interface NegocioCurso {
	public ArrayList<Curso> ObtenerCursosPorLegajoProfesor(int NroLegajo);
	//
	public ArrayList<Curso> ObtenerAlumnosPorCurso(Curso Curso);
	//
	public int AgregarNotasCurso(ArrayList<Curso> Curso);
	//
	public int AgregarNuevoCurso(Curso Curso);
	//
	public Curso ObtenerUnCurso(Curso Curso);
	
	public ArrayList<Curso> ObtenerTodosLosCursos();
	//
	public ArrayList<Alumno> ObtenerAlumnosNoEstanEnElCurso(Curso Curso);
	//
	public int AgregarAlumnosAlCurso(ArrayList<Curso> Curso);
	//
	public static void main(String[] args) {
	}
}
