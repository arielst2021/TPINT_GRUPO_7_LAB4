package negocio;

import java.util.ArrayList;
import java.util.List;
import entidades.Provincia;
import entidades.Profesor;

public interface NegocioProfesor {
	
	public int guardarprofesor (Profesor profesor);
	public Profesor iniciarSesion(String userUsuario, String passUsuario);
	public ArrayList<Profesor> listaTodosProfesores();
	public ArrayList<Profesor> listaProfesoresActivos();
	public List<Provincia> obtenerprovincias();
	public int BajaProfesor(Profesor ObjProfesor);
}
