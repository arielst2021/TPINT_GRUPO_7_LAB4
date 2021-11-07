package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Year;
import java.util.ArrayList;

import dao.CursoDao;
import entidades.Curso;
import entidades.Materia;
import entidades.Semestre;

public class CursoDaoImpl implements CursoDao {
	private static final String ObtenerCursosPorLegajoProfesor = "SELECT cur_materia_id, mat_nombre, cur_semestre_id, sem_nombre, cur_anio FROM cursos INNER JOIN materias ON materias.mat_id=cursos.cur_materia_id INNER JOIN semestres ON semestres.sem_id=cursos.cur_semestre_id WHERE cur_profesor_legajo=?";

	Connection miConnection = null;
	PreparedStatement miPreparedStatement = null;
	ResultSet miResultSet = null;
	Curso Curso = new Curso();

	@Override
	public ArrayList<Curso> ObtenerCursosPorLegajoProfesor(int NroLegajo) {
		ArrayList<Curso> Curso = new ArrayList<Curso>();

		try {
			// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
			miConnection = Conexion.getConexion().getSQLConexion();

			// 2. PREPARAR DECLARACIÓN
			miPreparedStatement = miConnection.prepareStatement(ObtenerCursosPorLegajoProfesor);

			// 3. ESTABLECER LOS PARÁMETROS
			miPreparedStatement.setInt(1, NroLegajo);

			// 4. EJECUTAR CONSULTA SQL
			miResultSet = miPreparedStatement.executeQuery();

			// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
			while (miResultSet.next()) {
				int idMateria = miResultSet.getInt("cur_materia_id");
				String nombreMateria = miResultSet.getString("mat_nombre");
				int idSemestre = miResultSet.getInt("cur_semestre_id");
				String nombreSemestre = miResultSet.getString("sem_nombre");
				Year anio = Year.of(2020);
						//Year.of(Integer.parseInt(miResultSet.getString("cur_anio")));

				Materia Materia = new Materia(idMateria, nombreMateria);
				Semestre Semestre = new Semestre(idSemestre, nombreSemestre);

				// SET
				Curso.add(new Curso(Materia, Semestre, anio));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				// SI ALGO HA IDO MAL Y QUEREMOS DESHACER LOS CAMBIOS
				miConnection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return Curso;
	}
}