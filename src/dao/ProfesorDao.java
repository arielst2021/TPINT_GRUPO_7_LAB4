package dao;

<<<<<<< HEAD
import java.util.ArrayList;
import entidades.Profesor;
=======
import entidades.Profesor;
import entidades.Provincia;
import java.util.ArrayList;
import java.util.List;
>>>>>>> bf78a33ad98d988885ce809e29e6557d68d73211

public interface ProfesorDao {
	
//	public int guardarprofesor (Profesor profesor);
	public Profesor iniciarSesion(String userProfesor, String passProfesor);
<<<<<<< HEAD
	public ArrayList<Profesor> listaProfesores();
}
=======
	
	public List<Provincia> obtenerprovincias();

}
>>>>>>> bf78a33ad98d988885ce809e29e6557d68d73211
