package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.MateriaDao;
import entidades.Materia;

public class MateriaDaoImpl implements MateriaDao {

	private static final String obtenerMaterias = "SELECT mat_id, mat_nombre FROM materias";

	private Connection miConnection = null;
	private PreparedStatement miPreparedStatement = null;
	private ResultSet miResultSet = null;
	
	@Override
	public ArrayList<Materia> obtenerMaterias() {

		ArrayList<Materia> Materia = new ArrayList<Materia>();

		try {
			// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
			miConnection = Conexion.getConexion().getSQLConexion();

			// 2. PREPARAR DECLARACIÓN // 3. ESTABLECER LOS PARÁMETROS
			miPreparedStatement = miConnection.prepareStatement(obtenerMaterias);

			// 4. EJECUTAR CONSULTA SQL
			miResultSet = miPreparedStatement.executeQuery();

			// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
			while (miResultSet.next()) {
				int idMateria = miResultSet.getInt("mat_id");
				String nombreMateria = miResultSet.getString("mat_nombre");

				Materia.add(new Materia(idMateria, nombreMateria));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Materia;
	}

}
