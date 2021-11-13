package daoImpl;

import java.sql.Connection;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.ProfesorDao;

import entidades.Estado;
import entidades.Perfil;
import entidades.Persona;
import entidades.Profesor;
import entidades.Provincia;
import entidades.Profesor;

public class ProfesorDaoImpl implements ProfesorDao {
	private static final String iniciarSesion = "SELECT pro_perfil_id, per_nombre, pro_estado_id, est_nombre, pro_nombre, pro_apellido, pro_legajo FROM profesores INNER JOIN perfiles ON perfiles.per_id=profesores.pro_perfil_id INNER JOIN estados ON estados.est_id=profesores.pro_estado_id WHERE pro_usuario = ? AND pro_contrasenia = ? AND pro_estado_id = 1";
	private String getprovincias = "SELECT * FROM provincias";
//	@Override
//	public int guardarprofesor(Profesor profesor) {
//		String agregarprofesor = "INSERT INTO profesores(pro_dni, pro_nombre, pro_apellido, pro_fechanac,pro_direccion,pro_provincia_id,pro_email,pro_telefono,pro_estado_id,pro_perfil_id,pro_usuario,pro_contrasenia) values (?,?,?,?,?,?,?,?,?,?,?,?);";
//		Profesor prof = new Profesor();

//		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//		String fechaComoCadena = sdf.format(profesor.getFechanacimiento());
//
//		Date fecha = new Date(fechaComoCadena);
//
//		java.sql.Date date2 = new java.sql.Date(fecha.getDay(), fecha.getMonth(), fecha.getYear());
//
//		Connection conexion = Conexion.getConexion().getSQLConexion();
//		try {
//			PreparedStatement statement = (PreparedStatement) conexion.prepareStatement(agregarprofesor);
//			statement.setString(1, profesor.getDni());
//			statement.setString(2, profesor.getNombre());
//			statement.setString(3, profesor.getApellido());
//			statement.setDate(4, date2);
//			statement.setString(5, profesor.getDireccion());
//			statement.setInt(6, profesor.getProvincia());
//			statement.setString(7, profesor.getMail());
//			statement.setString(8, profesor.getTelefono());
//			statement.setInt(9, profesor.getEstado());
//			statement.setInt(10, profesor.getPerfil());
//			statement.setString(11, profesor.getUsuario());
//			statement.setString(12, profesor.getContraseña());
//
//			if (statement.executeLargeUpdate() > 0) {
//				conexion.commit();
//				return 1;
//
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			try {
//				conexion.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
//		}
//
//		return 0;
//	}

	@Override
	public Profesor iniciarSesion(String userProfesor, String passProfesor) {

		Connection miConnection = null;
		PreparedStatement miPreparedStatement = null;
		ResultSet miResultSet = null;
		Profesor Profesor2 = new Profesor();

		try {
			// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
			miConnection = Conexion.getConexion().getSQLConexion();

			// 2. PREPARAR DECLARACIÓN
			miPreparedStatement = miConnection.prepareStatement(iniciarSesion);

			// 3. ESTABLECER LOS PARÁMETROS
			miPreparedStatement.setString(1, userProfesor);
			miPreparedStatement.setString(2, passProfesor);

			// 4. EJECUTAR CONSULTA SQL
			miResultSet = miPreparedStatement.executeQuery();

			// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
			if (miResultSet.next()) {

				int idPerfil = miResultSet.getInt("pro_perfil_id");
				String nombrePerfil = miResultSet.getString("per_nombre");
				int idEstado = miResultSet.getInt("pro_estado_id");
				String nombreEstado = miResultSet.getString("est_nombre");
				String apellidoProfesor = miResultSet.getString("pro_apellido");
				String nombreProfesor = miResultSet.getString("pro_nombre");
				int legajoProfesor = miResultSet.getInt("pro_legajo");

				Perfil Perfil = new Perfil(idPerfil, nombrePerfil);
				Estado Estado = new Estado(idEstado, nombreEstado);
				Persona Persona = new Persona(nombreProfesor, apellidoProfesor);

				Profesor2.setLegajo(legajoProfesor);
				Profesor2.setPerfil(Perfil);
				Profesor2.setEstado(Estado);
				Profesor2.setPersona(Persona);
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
		return Profesor2;
	}

	@Override
	public List<Provincia> obtenerprovincias() {
		
		ArrayList<Provincia> listadoprovincia = new ArrayList<Provincia>();
		Connection conexion = Conexion.getConexion().getSQLConexion();
		Provincia provincia = new Provincia();
		
		try {
			PreparedStatement miPreparedStatement = conexion.prepareStatement(getprovincias);
			miPreparedStatement.execute();
		 ResultSet miResultSet = miPreparedStatement.getResultSet();		
			while (miResultSet.next()) {
				
				provincia.setId(miResultSet.getInt("prov_id"));
				provincia.setNombre(miResultSet.getString("prov_nombre"));
				
				
				
				listadoprovincia.add(provincia);
				System.out.println(provincia.getId()+ "   "+provincia.getNombre().toString());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listadoprovincia;
		 
	}
	
}