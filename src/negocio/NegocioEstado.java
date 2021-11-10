package negocio;

import java.util.ArrayList;

import entidades.Estado;

public interface NegocioEstado {
	public ArrayList<Estado> obtenerEstados();
	public Estado obtenerEstadoAlumno(int ID);
}
