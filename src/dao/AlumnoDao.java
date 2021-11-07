package dao;

import java.util.ArrayList;

import entidades.Alumno;

public interface AlumnoDao {
	public ArrayList<Alumno> obtenerAlumnosTodos();
	public ArrayList<Alumno> obtenerAlumnosEstado(int Estado);
	public Alumno obtenerAlumnoLegajo(int Legajo);
	
}
