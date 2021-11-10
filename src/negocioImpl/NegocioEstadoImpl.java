package negocioImpl;

import java.util.ArrayList;

import dao.EstadoDao;
import daoImpl.EstadoDaoImpl;
import entidades.Estado;
import negocio.NegocioEstado;

public class NegocioEstadoImpl implements NegocioEstado {

	EstadoDao dao = new EstadoDaoImpl();

	@Override
	public ArrayList<Estado> obtenerEstados() {
		return dao.obtenerEstados();
	}
	
	@Override
	public Estado obtenerEstadoAlumno(int ID) {
		return dao.obtenerEstadoAlumno(ID);
	}
}