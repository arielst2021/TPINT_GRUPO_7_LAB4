package negocio;

import java.util.ArrayList;
import java.util.List;
import entidades.Provincia;
import entidades.Profesor;

public interface NegocioProfesor {
	
	public int guardarprofesor (Profesor profesor);
	public Profesor iniciarSesion(String userUsuario, String passUsuario);
	public ArrayList<Profesor> listaProfesores();
	public List<Provincia> obtenerprovincias();
	public boolean BajaProfesor(String Legajo);
}
