package dao;

import java.util.ArrayList;
import entidades.Estado;

public interface EstadoDao {
	public ArrayList<Estado> obtenerEstados();
	public Estado obtenerEstadoAlumno(int ID);
}
