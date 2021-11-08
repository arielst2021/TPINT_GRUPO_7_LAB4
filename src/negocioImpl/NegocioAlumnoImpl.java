package negocioImpl;

import entidades.Alumno;
import negocio.NegocioAlumno;

import java.util.ArrayList;

import dao.AlumnoDao;
import daoImpl.AlumnoDaoImpl;

public class NegocioAlumnoImpl implements NegocioAlumno {
	AlumnoDao dao = new AlumnoDaoImpl();
	
	@Override
	public ArrayList<Alumno> obtenerAlumnosTodos(){
		AlumnoDao alumnoDao = new AlumnoDaoImpl();
		return alumnoDao.obtenerAlumnosTodos();
	}
	@Override
	public ArrayList<Alumno> obtenerAlumnosEstado(int Estado){
		AlumnoDao alumnoDao = new AlumnoDaoImpl();
		return alumnoDao.obtenerAlumnosEstado(Estado);
		
	}
	@Override
	public Alumno obtenerAlumnoLegajo(int Legajo) {
		AlumnoDao alumnoDao = new AlumnoDaoImpl();
		return alumnoDao.obtenerAlumnoLegajo(Legajo);
	}
	@Override
	public int modificarAlumno(Alumno alu) {
		AlumnoDao alumnoDao = new AlumnoDaoImpl();
		return alumnoDao.modificarAlumno(alu);
	}
	@Override
	public int modificarAlumnoEstado(int Legajo) {
		AlumnoDao alumnoDao = new AlumnoDaoImpl();
		return alumnoDao.modificarAlumnoEstado(Legajo);
	}
}

