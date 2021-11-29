package dao;

import java.util.ArrayList;

import entidades.Alumno;

public interface AlumnoDao {
	public ArrayList<Alumno> obtenerAlumnosTodos();
	public ArrayList<Alumno> obtenerAlumnosEstado(int Estado);
	public Alumno obtenerAlumnoLegajo(int Legajo);
	public int modificarAlumno(Alumno alum);
	public int modificarAlumnoEstado(int Legajo);
	public int GuardarAlumno(Alumno alumno);
	public boolean verificar(String dni);
}