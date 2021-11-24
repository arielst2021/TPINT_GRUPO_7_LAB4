package negocioImpl;

import java.util.ArrayList;
import java.util.List;

import dao.ProfesorDao;
import daoImpl.ProfesorDaoImpl;
import entidades.Profesor;
import entidades.Provincia;
import negocio.NegocioProfesor;

public class NegocioProfesorImpl implements NegocioProfesor{

	ProfesorDao dao = new ProfesorDaoImpl();

	@Override
	public int guardarprofesor(Profesor profesor) {
		ProfesorDao profesordao = new ProfesorDaoImpl();
		return profesordao.guardarprofesor(profesor);
	}

	@Override
	public Profesor iniciarSesion(String userUsuario, String passUsuario) {
		Profesor obj = null;
		if (userUsuario.trim().length() > 0 && passUsuario.trim().length() > 0) {
			obj = dao.iniciarSesion(userUsuario, passUsuario);
		}
		return obj;
	}



	@Override
	public ArrayList<Profesor> listaTodosProfesores() {
		return dao.listaTodosProfesores();
	}
	
	@Override
	public ArrayList<Profesor> listaProfesoresActivos() {
		return dao.listaProfesoresActivos();
	}
//	public List<Provincia> obtenerprovincias() {
//		
//		 ProfesorDao profesordaoimp= new ProfesorDaoImpl();
//		 
//		// return  profesordaoimp.obtenerprovincias();
//		 
//	}

	@Override
	public List<Provincia> obtenerprovincias() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int BajaProfesor(Profesor ObjProfesor) {
		
		return dao.BajaProfesor(ObjProfesor);
	}
}