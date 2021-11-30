package negocioImpl;

import entidades.Alumno;
import negocio.NegocioAlumno;

import java.util.ArrayList;

import dao.AlumnoDao;
import daoImpl.AlumnoDaoImpl;

public class NegocioAlumnoImpl implements NegocioAlumno {
	AlumnoDao alumnoDao = new AlumnoDaoImpl();
	
	@Override
	public ArrayList<Alumno> obtenerAlumnosTodos(){
		return alumnoDao.obtenerAlumnosTodos();
	}
	@Override
	public ArrayList<Alumno> obtenerAlumnosEstado(int Estado){
		return alumnoDao.obtenerAlumnosEstado(Estado);
		
	}
	@Override
	public Alumno obtenerAlumnoLegajo(int Legajo) {
		return alumnoDao.obtenerAlumnoLegajo(Legajo);
	}
	@Override
	public int modificarAlumno(Alumno alu) {
		// Se valida que todos los campos contenan información'
		return alumnoDao.modificarAlumno(alu);
	}
	@Override
	public int modificarAlumnoEstado(int Legajo) {
		return alumnoDao.modificarAlumnoEstado(Legajo);
	}
	@Override
	public int GuardarAlumno(Alumno alumno) {
		return alumnoDao.GuardarAlumno(alumno);
	}
	@Override
	public boolean verificar(String dni) {
		return alumnoDao.verificar(dni);
	}
	
	@Override
	public boolean existeEmail(String email) {
		return alumnoDao.existeEmail(email);
	}

}

