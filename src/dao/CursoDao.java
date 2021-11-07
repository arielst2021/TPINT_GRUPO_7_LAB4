package dao;

import java.util.ArrayList;

import entidades.Curso;

public interface CursoDao {
	
	public ArrayList<Curso> ObtenerCursosPorLegajoProfesor(int NroLegajo);

}
