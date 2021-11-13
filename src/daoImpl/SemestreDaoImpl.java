package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dao.SemestreDao;
import entidades.Semestre;

public class SemestreDaoImpl implements SemestreDao{
	
	private static final String obtenerSemestres = "SELECT sem_id, sem_nombre FROM materias";

	private Connection miConnection = null;
	private PreparedStatement miPreparedStatement = null;
	private ResultSet miResultSet = null;
	
	@Override
	public ArrayList<Semestre> obtenerSemestres() {
		ArrayList<Semestre> Semestre = new ArrayList<Semestre>();

		try {
			// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
			miConnection = Conexion.getConexion().getSQLConexion();

			// 2. PREPARAR DECLARACIÓN // 3. ESTABLECER LOS PARÁMETROS
			miPreparedStatement = miConnection.prepareStatement(obtenerSemestres);

			// 4. EJECUTAR CONSULTA SQL
			miResultSet = miPreparedStatement.executeQuery();

			// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
			while (miResultSet.next()) {
				int idSemestre = miResultSet.getInt("sem_id");
				String nombreSemestre = miResultSet.getString("sem_nombre");

				Semestre.add(new Semestre(idSemestre, nombreSemestre));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Semestre;
	}
}