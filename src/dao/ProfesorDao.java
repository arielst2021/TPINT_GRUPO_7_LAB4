package dao;

import entidades.Profesor;
import entidades.Provincia;
import java.util.ArrayList;
import java.util.List;

public interface ProfesorDao {
	
//	public int guardarprofesor (Profesor profesor);
	public Profesor iniciarSesion(String userProfesor, String passProfesor);
	
	public List<Provincia> obtenerprovincias();

}
