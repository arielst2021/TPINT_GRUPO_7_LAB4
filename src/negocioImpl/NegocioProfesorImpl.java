package negocioImpl;

import entidades.Profesor;
import entidades.Profesor2;
import negocio.NegocioProfesor;
import dao.ProfesorDao;
import daoImpl.ProfesorDaoImpl;

public class NegocioProfesorImpl implements NegocioProfesor {

	ProfesorDao dao = new ProfesorDaoImpl();

	@Override
	public int guardarprofesor(Profesor profesor) {
		ProfesorDao profesordao = new ProfesorDaoImpl();
		return profesordao.guardarprofesor(profesor);
	}

	@Override
	public Profesor2 iniciarSesion(String userUsuario, String passUsuario) {
		Profesor2 obj = null;
		if (userUsuario.trim().length() > 0 && passUsuario.trim().length() > 0) {
			obj = dao.iniciarSesion(userUsuario, passUsuario);
		}
		return obj;
	}
}