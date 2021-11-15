package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.sql.Date;


import dao.ProfesorDao;
import entidades.Estado;
import entidades.Perfil;
import entidades.Persona;
import entidades.Profesor;
import entidades.Provincia;

public class ProfesorDaoImpl implements ProfesorDao {
	private static final String iniciarSesion = "SELECT pro_perfil_id, per_nombre, pro_estado_id, est_nombre, pro_nombre, pro_apellido, pro_legajo FROM profesores INNER JOIN perfiles ON perfiles.per_id=profesores.pro_perfil_id INNER JOIN estados ON estados.est_id=profesores.pro_estado_id WHERE pro_usuario = ? AND pro_contrasenia = ? AND pro_estado_id = 1";
	private static final String obtenerTodosLosProfesores = "SELECT pro_legajo, pro_dni, pro_nombre, pro_apellido, pro_fechanac, pro_direccion, pro_provincia_id, prov_nombre, pro_email, pro_telefono, pro_estado_id, est_nombre, pro_perfil_id, per_nombre, pro_usuario, pro_contrasenia FROM profesores INNER JOIN provincias ON provincias.prov_id=profesores.pro_provincia_id INNER JOIN perfiles ON perfiles.per_id=profesores.pro_perfil_id INNER JOIN estados ON estados.est_id= profesores.pro_estado_id WHERE pro_estado_id=1 AND pro_perfil_id=2";
	//
	private Connection miConnection = null;
	private PreparedStatement miPreparedStatement = null;
	private ResultSet miResultSet = null;

	 @Override
	 public int guardarprofesor(Profesor profesor) {
	 String agregarprofesor = "INSERT INTO profesores(pro_dni, pro_nombre,pro_apellido,pro_fechanac,pro_direccion,pro_provincia_id,pro_email,pro_telefono,pro_estado_id,pro_perfil_id,pro_usuario,pro_contrasenia) values (?,?,?,?,?,?,?,?,?,?,?,?);";
	 Profesor prof = new Profesor();
	 Persona persona =profesor.getPersona();

	 
	 LocalDate locald = persona.getFechaNacimiento();
	 Date date = Date.valueOf(locald); // Magic happens here!
	 

	 
	
	
	
	 Connection conexion = Conexion.getConexion().getSQLConexion();
	 try {
	 PreparedStatement statement = (PreparedStatement)
	 conexion.prepareStatement(agregarprofesor);
	 statement.setString(1, persona.getDni());
	 statement.setString(2, persona.getNombre());
	 statement.setString(3, persona.getApellido());
	 statement.setDate(4,date);
	 statement.setString(5, persona.getDireccion());
	 statement.setInt(6, persona.getProvincia().getId());
	 statement.setString(7, persona.getEmail());
	 statement.setString(8, persona.getTelefono());
	 statement.setInt(9, profesor.getEstado().getId());
	 statement.setInt(10, profesor.getPerfil().getId());
	 statement.setString(11, profesor.getUsuario());
	 statement.setString(12, profesor.getContrasenia());
	
	 if (statement.executeLargeUpdate() > 0) {
	 conexion.commit();
	 return 1;
	
	 }
	 } catch (SQLException e) {
	 e.printStackTrace();
	 try {
	 conexion.rollback();
	 } catch (SQLException e1) {
	 e1.printStackTrace();
	 }
	 }
	
	 return 0;
	 }

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
	public ArrayList<Profesor> listaProfesores() {

		ArrayList<Profesor> Profesor = new ArrayList<Profesor>();

		try {
			// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
			miConnection = Conexion.getConexion().getSQLConexion();

			// 2. PREPARAR DECLARACIÓN // 3. ESTABLECER LOS PARÁMETROS
			miPreparedStatement = miConnection.prepareStatement(obtenerTodosLosProfesores);

			// 4. EJECUTAR CONSULTA SQL
			miResultSet = miPreparedStatement.executeQuery();

			// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
			while (miResultSet.next()) {
				int legajoProfesor = miResultSet.getInt("pro_legajo");
				String dniProfesor = miResultSet.getString("pro_dni");
				String nombreProfesor = miResultSet.getString("pro_nombre");
				String apellidoProfesor = miResultSet.getString("pro_apellido");
				// FECHA NACIMIENTO
				int anio = Integer.parseInt(miResultSet.getString("pro_fechanac").substring(0, 4));
				int mes = Integer.parseInt(miResultSet.getString("pro_fechanac").substring(5, 7));
				int dia = Integer.parseInt(miResultSet.getString("pro_fechanac").substring(8, 10));
				LocalDate fechaNacimientoProfesor = LocalDate.of(anio, mes, dia);
				//
				String direccionProfesor = miResultSet.getString("pro_direccion");
				//
				int idProvincia = miResultSet.getInt("pro_provincia_id");
				String nombreProvincia = miResultSet.getString("prov_nombre");
				//
				String emailProfesor = miResultSet.getString("pro_email");
				String telefonoProfesor = miResultSet.getString("pro_telefono");
				//
				int idEstado = miResultSet.getInt("pro_estado_id");
				String nombreEstado = miResultSet.getString("est_nombre");
				//
				int idPerfil = miResultSet.getInt("pro_perfil_id");
				String nombrePerfil = miResultSet.getString("per_nombre");
				//
				String usuarioProfesor = miResultSet.getString("pro_usuario");
				String contraseniaProfesor = miResultSet.getString("pro_contrasenia");
				//
				// AGREGO EL PROFESOR AL ARRAYLIST
				Profesor.add(new Profesor(legajoProfesor,
						new Persona(dniProfesor, nombreProfesor, apellidoProfesor, fechaNacimientoProfesor,
								direccionProfesor, new Provincia(idProvincia, nombreProvincia), emailProfesor,
								telefonoProfesor),
						new Estado(idEstado, nombreEstado), new Perfil(idPerfil, nombrePerfil), usuarioProfesor,
						contraseniaProfesor));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Profesor;
	}
}