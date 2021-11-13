package negocioImpl;

import java.util.ArrayList;

import dao.MateriaDao;
import daoImpl.MateriaDaoImpl;
import entidades.Materia;
import negocio.NegocioMateria;

public class NegocioMateriaImpl implements NegocioMateria {

	MateriaDao dao = new MateriaDaoImpl();
	
	@Override
	public ArrayList<Materia> obtenerMaterias() {
		return dao.obtenerMaterias();
	}

}