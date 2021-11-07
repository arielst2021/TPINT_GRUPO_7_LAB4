package negocio;

import entidades.Profesor;
import entidades.Profesor2;

public interface NegocioProfesor {
	
	public int guardarprofesor (Profesor profesor);
	public Profesor2 iniciarSesion(String userUsuario, String passUsuario);	
}
