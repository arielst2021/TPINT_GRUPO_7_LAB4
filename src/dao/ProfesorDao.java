package dao;

import java.util.ArrayList;

import entidades.Profesor;

public interface ProfesorDao {
	public Profesor iniciarSesion(String userProfesor, String passProfesor);
	public ArrayList<Profesor> listaTodosProfesores();
	public ArrayList<Profesor> listaProfesoresActivos();
	public int guardarprofesor(Profesor profesor);
	public int BajaProfesor(Profesor ObjProfesor);
	public Profesor ProfePorLegajo(String legajo);
	public int ModificarProfesor(Profesor objProfesor);
	public boolean verificar(String dni);
	public boolean existeUsuario(String usuario);
}
