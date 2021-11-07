package negocio;

import java.util.ArrayList;

import entidades.Alumno;

	public interface NegocioAlumno {
		ArrayList<Alumno> obtenerAlumnosTodos();
		public ArrayList<Alumno> obtenerAlumnosEstado(int Estado);
		public Alumno obtenerAlumnoLegajo(int Legajo);
		public int editarAlumno(int legajo, Alumno alum);
	
}

