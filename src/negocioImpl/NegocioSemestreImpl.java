package negocioImpl;

import java.util.ArrayList;

import dao.SemestreDao;
import daoImpl.SemestreDaoImpl;
import entidades.Semestre;
import negocio.NegocioSemestre;

public class NegocioSemestreImpl implements NegocioSemestre{

	SemestreDao dao = new SemestreDaoImpl();

	@Override
	public ArrayList<Semestre> obtenerSemestres() {
		return dao.obtenerSemestres();
	}
}
