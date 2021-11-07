package dao;

import entidades.Profesor;
import entidades.Profesor2;

public interface ProfesorDao {
	
	public int guardarprofesor (Profesor profesor);
	public Profesor2 iniciarSesion(String userProfesor, String passProfesor);

}
