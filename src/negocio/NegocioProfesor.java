package negocio;

<<<<<<< HEAD
import java.util.ArrayList;
=======
import java.util.List;
import entidades.Provincia;

import entidades.Profesor;
>>>>>>> bf78a33ad98d988885ce809e29e6557d68d73211
import entidades.Profesor;

public interface NegocioProfesor {
	
	public int guardarprofesor (Profesor profesor);
	public Profesor iniciarSesion(String userUsuario, String passUsuario);
<<<<<<< HEAD
	public ArrayList<Profesor> listaProfesores();
=======
	public List<Provincia> obtenerprovincias();
>>>>>>> bf78a33ad98d988885ce809e29e6557d68d73211
}
