package dao;

import java.util.ArrayList;
import entidades.Profesor;

public interface ProfesorDao {
	
//	public int guardarprofesor (Profesor profesor);
	public Profesor iniciarSesion(String userProfesor, String passProfesor);
	public ArrayList<Profesor> listaProfesores();
}
