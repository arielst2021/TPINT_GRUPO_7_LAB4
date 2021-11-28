package negocio;

import java.util.ArrayList;

import entidades.Alumno;

	public interface NegocioAlumno {
		ArrayList<Alumno> obtenerAlumnosTodos();
		public ArrayList<Alumno> obtenerAlumnosEstado(int Estado);
		public Alumno obtenerAlumnoLegajo(int Legajo);
		public int modificarAlumno(Alumno alu);
		public int modificarAlumnoEstado(int Legajo);
		int GuardarAlumno(Alumno alumno);
		boolean verificar(String dni);
}