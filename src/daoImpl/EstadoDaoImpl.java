package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dao.EstadoDao;
import entidades.Curso;
import entidades.Estado;

public class EstadoDaoImpl implements EstadoDao {

	private static final String obtenerEstados = "SELECT est_id, est_nombre FROM estados";

	Connection miConnection = null;
	PreparedStatement miPreparedStatement = null;
	ResultSet miResultSet = null;
	Curso Curso = new Curso();

	@Override
	public ArrayList<Estado> obtenerEstados() {

		ArrayList<Estado> Estado = new ArrayList<Estado>();

		try {
			// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
			miConnection = Conexion.getConexion().getSQLConexion();

			// 2. PREPARAR DECLARACIÓN // 3. ESTABLECER LOS PARÁMETROS
			miPreparedStatement = miConnection.prepareStatement(obtenerEstados);

			// 4. EJECUTAR CONSULTA SQL
			miResultSet = miPreparedStatement.executeQuery();

			// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
			while (miResultSet.next()) {
				int idEstado = miResultSet.getInt("est_id");
				String nombreEstado = miResultSet.getString("est_nombre");

				Estado.add(new Estado(idEstado, nombreEstado));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Estado;
	}
}