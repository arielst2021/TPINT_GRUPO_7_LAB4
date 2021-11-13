package negocio;

import java.util.List;
import entidades.Provincia;

import entidades.Profesor;
import entidades.Profesor;

public interface NegocioProfesor {
	
	public int guardarprofesor (Profesor profesor);
	public Profesor iniciarSesion(String userUsuario, String passUsuario);
	public List<Provincia> obtenerprovincias();
}
