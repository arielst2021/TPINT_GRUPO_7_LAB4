package negocioImpl;

import entidades.Profesor;
import entidades.Profesor;
import negocio.NegocioProfesor;
import dao.ProfesorDao;
import daoImpl.ProfesorDaoImpl;

public class NegocioProfesorImpl implements NegocioProfesor {

	ProfesorDao dao = new ProfesorDaoImpl();

//	@Override
//	public int guardarprofesor(Profesor profesor) {
//		ProfesorDao profesordao = new ProfesorDaoImpl();
//		return profesordao.guardarprofesor(profesor);
//	}

	@Override
	public Profesor iniciarSesion(String userUsuario, String passUsuario) {
		Profesor obj = null;
		if (userUsuario.trim().length() > 0 && passUsuario.trim().length() > 0) {
			obj = dao.iniciarSesion(userUsuario, passUsuario);
		}
		return obj;
	}

	@Override
	public int guardarprofesor(Profesor profesor) {
		// TODO Auto-generated method stub
		return 0;
	}
}