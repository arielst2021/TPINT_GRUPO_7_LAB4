package dao;

import java.util.ArrayList;

import entidades.Profesor;

public interface ProfesorDao {
	public Profesor iniciarSesion(String userProfesor, String passProfesor);
	public ArrayList<Profesor> listaProfesores();
	public int guardarprofesor(Profesor profesor);
	public boolean BajaProfesor(String Legajo);
}
