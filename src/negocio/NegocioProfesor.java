package negocio;

import entidades.Profesor;
import entidades.Profesor;

public interface NegocioProfesor {
	
	public int guardarprofesor (Profesor profesor);
	public Profesor iniciarSesion(String userUsuario, String passUsuario);	
}
