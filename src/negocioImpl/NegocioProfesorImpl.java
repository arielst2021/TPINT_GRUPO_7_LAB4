package negocioImpl;

import entidades.Profesor;
<<<<<<< HEAD
import negocio.NegocioProfesor;

import java.util.ArrayList;
=======
import entidades.Provincia;
import entidades.Profesor;
import negocio.NegocioProfesor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
>>>>>>> bf78a33ad98d988885ce809e29e6557d68d73211

import dao.ProfesorDao;
import daoImpl.Conexion;
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

	@Override
<<<<<<< HEAD
	public ArrayList<Profesor> listaProfesores() {
		return dao.listaProfesores();
	}
=======
	public List<Provincia> obtenerprovincias() {
		
		 ProfesorDao profesordaoimp= new ProfesorDaoImpl();
		 
		 return  profesordaoimp.obtenerprovincias();
		 
	}
		
		
>>>>>>> bf78a33ad98d988885ce809e29e6557d68d73211
}