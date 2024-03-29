package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import dao.AlumnoDao;
import entidades.Alumno;
import entidades.Persona;
import entidades.Provincia;
import entidades.Estado;

public class AlumnoDaoImpl implements AlumnoDao {

	@Override
	public ArrayList<Alumno> obtenerAlumnosTodos() {
		String str = "SELECT * FROM alumnos INNER JOIN estados ON estados.est_id=alumnos.alu_estado_id INNER JOIN provincias ON alu_provincia_id=prov_id;";

		ArrayList<Alumno> listaAlumnos = new ArrayList<Alumno>();

		// CONEXION
		Connection con = Conexion.getConexion().getSQLConexion();
		try {
			// Declaracion y ejecución
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// Carga Objecto de Alumno y lo agrega al ArrayList
				Alumno alum = new Alumno();
				Persona per = new Persona();
				alum.setLegajo(rs.getInt("alu_legajo"));

				per.setDni(rs.getString("alu_dni"));
				per.setNombre(rs.getString("alu_nombre"));
				per.setApellido(rs.getString("alu_apellido"));
				per.setDireccion(rs.getString("alu_direccion"));

				// FECHA
				int anio = Integer.parseInt(rs.getString("alu_fechanac").substring(0, 4));
				int mes = Integer.parseInt(rs.getString("alu_fechanac").substring(5, 7));
				int dia = Integer.parseInt(rs.getString("alu_fechanac").substring(8, 10));
				LocalDate date = LocalDate.of(anio, mes, dia);
				per.setFechaNacimiento(date);

				// pronvicia
				Provincia prov = new Provincia();
				prov.setId(rs.getInt("prov_id"));
				prov.setNombre(rs.getString("prov_nombre"));
				per.setProvincia(prov);
				// email
				per.setEmail(rs.getString("alu_email"));
				// telefono
				per.setEmail(rs.getString("alu_email"));
				per.setTelefono(rs.getString("alu_telefono"));
				alum.setPersona(per);
				// estado
				Estado est = new Estado();
				est.setIdEstado(rs.getInt("est_id"));
				est.setNombre(rs.getString("est_nombre"));
				alum.setEstado(est);
				listaAlumnos.add(alum);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return listaAlumnos;
	}

	@Override
	public ArrayList<Alumno> obtenerAlumnosEstado(int Estado) {
		String str = "SELECT * FROM alumnos INNER JOIN estados ON estados.est_id=alumnos.alu_estado_id INNER JOIN provincias ON alu_provincia_id=prov_id;";

		ArrayList<Alumno> listaAlumnos = new ArrayList<Alumno>();

		Connection con = Conexion.getConexion().getSQLConexion();
		try {
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Alumno alum = new Alumno();
				Persona per = new Persona();
				Estado est = new Estado();
				alum.setLegajo(rs.getInt("alu_legajo"));

				// Persona2
				// DNI
				per.setDni(rs.getString("alu_dni"));
				per.setNombre(rs.getString("alu_nombre"));
				per.setApellido(rs.getString("alu_apellido"));

				// FECHA
				int anio = Integer.parseInt(rs.getString("alu_fechanac").substring(0, 4));
				int mes = Integer.parseInt(rs.getString("alu_fechanac").substring(5, 7));
				int dia = Integer.parseInt(rs.getString("alu_fechanac").substring(8, 10));
				LocalDate date = LocalDate.of(anio, mes, dia);
				per.setFechaNacimiento(date);

				per.setDireccion(rs.getString("alu_direccion"));
				// pronvicia
				// email
				per.setEmail(rs.getString("alu_email"));
				// telefono
				per.setEmail(rs.getString("alu_email"));
				per.setTelefono(rs.getString("alu_telefono"));
				alum.setPersona(per);
				// estado
				est.setIdEstado(rs.getInt("est_id"));
				est.setNombre(rs.getString("est_nombre"));
				alum.setEstado(est);

				listaAlumnos.add(alum);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return listaAlumnos;
	}

	@Override
	public Alumno obtenerAlumnoLegajo(int Legajo) {
		Alumno alum = new Alumno();
		String str = "SELECT * FROM alumnos INNER JOIN estados ON estados.est_id=alumnos.alu_estado_id INNER JOIN provincias ON alu_provincia_id=prov_id WHERE alu_legajo="
				+ Legajo;

		Connection con = Conexion.getConexion().getSQLConexion();
		try {
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// Carga Objecto de Alumno
				Persona per = new Persona();
				alum.setLegajo(rs.getInt("alu_legajo"));

				per.setDni(rs.getString("alu_dni"));
				per.setNombre(rs.getString("alu_nombre"));
				per.setApellido(rs.getString("alu_apellido"));

				// FECHA
				int anio = Integer.parseInt(rs.getString("alu_fechanac").substring(0, 4));
				int mes = Integer.parseInt(rs.getString("alu_fechanac").substring(5, 7));
				int dia = Integer.parseInt(rs.getString("alu_fechanac").substring(8, 10));
				LocalDate date = LocalDate.of(anio, mes, dia);
				per.setFechaNacimiento(date);

				per.setDireccion(rs.getString("alu_direccion"));
				// pronvicia
				Provincia prov = new Provincia();
				prov.setId(rs.getInt("prov_id"));
				prov.setNombre(rs.getString("prov_nombre"));
				per.setProvincia(prov);
				// email
				per.setEmail(rs.getString("alu_email"));
				// telefono
				per.setEmail(rs.getString("alu_email"));
				per.setTelefono(rs.getString("alu_telefono"));
				alum.setPersona(per);
				// estado
				Estado est = new Estado();
				est.setIdEstado(rs.getInt("est_id"));
				est.setNombre(rs.getString("est_nombre"));
				alum.setEstado(est);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return alum;
	}

	@Override
	public int modificarAlumno(Alumno alu) {
		int AlumnoModificado = 0;
		String str = "UPDATE alumnos SET alu_dni=?, alu_nombre=?, alu_apellido=?, alu_direccion=?, alu_provincia_id=?, alu_email=?, alu_telefono=?, alu_estado_id=?, alu_fechanac=? WHERE alu_legajo=?";
		Connection con = Conexion.getConexion().getSQLConexion();
		try {
			PreparedStatement ps = con.prepareStatement(str);
			// Se ordenan los campos para el statement

			ps.setString(1, alu.getPersona().getDni());
			ps.setString(2, alu.getPersona().getNombre());
			ps.setString(3, alu.getPersona().getApellido());
			ps.setString(4, alu.getPersona().getDireccion());
			ps.setInt(5, alu.getPersona().getProvincia().getId());
			ps.setString(6, alu.getPersona().getEmail());
			ps.setString(7, alu.getPersona().getTelefono());
			ps.setInt(8, alu.getEstado().getId());
			ps.setString(9, alu.getPersona().getFechaNacimiento().toString());
			ps.setInt(10, alu.getLegajo());

			if (ps.executeLargeUpdate() > 0) {
				con.commit();
				AlumnoModificado = 1;
			}

		} catch (SQLException e) {
			AlumnoModificado = -1;
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return AlumnoModificado;
	}

	@Override
	public int modificarAlumnoEstado(int Legajo) {
		int Modificar = 0;
		Alumno alum = obtenerAlumnoLegajo(Legajo);
		String str = "UPDATE alumnos SET alu_estado_id=? WHERE alu_legajo=" + Legajo;
		Connection con = Conexion.getConexion().getSQLConexion();
		int nuevoEstado = 1;
		if (alum.getEstado().getId() == 1) {
			nuevoEstado = 2;
		}
		try {
			PreparedStatement ps = con.prepareStatement(str);
			ps.setInt(1, nuevoEstado);
			if (ps.executeLargeUpdate() > 0) {
				con.commit();
				Modificar = 1;
			}
		} catch (SQLException e) {
			Modificar = -1;
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return Modificar;
	}

	@Override
	public int GuardarAlumno(Alumno alumno) {
		String agregarAlumno = "INSERT INTO `alumnos` (`alu_dni`, `alu_nombre`, `alu_apellido`, `alu_fechanac`, `alu_direccion`, `alu_provincia_id`, `alu_email`, `alu_telefono`, `alu_estado_id`) VALUES (?, ?, ?, ?,?,?,?,?,'1');";
		Persona persona = alumno.getPersona();

		LocalDate LocalDate = persona.getFechaNacimiento();
		Date date = Date.valueOf(LocalDate);
		int aux = 0;
		Connection connection = Conexion.getConexion().getSQLConexion();
		try {
			PreparedStatement statement = (PreparedStatement) connection.prepareStatement(agregarAlumno);
			statement.setString(1, persona.getDni());
			statement.setString(2, persona.getNombre());
			statement.setString(3, persona.getApellido());
			statement.setDate(4, date);
			statement.setString(5, persona.getDireccion());
			statement.setInt(6, persona.getProvincia().getId());
			statement.setString(7, persona.getEmail());
			statement.setString(8, persona.getTelefono());

			if (statement.executeLargeUpdate() > 0) {
				connection.commit();
				aux = 1;

			}
		} catch (SQLException e) {
			e.printStackTrace();
			aux = -1;
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return aux;
	}

	@Override
	public boolean verificar(String dni) {
		boolean aux = false;
		String str = "SELECT * FROM alumnos WHERE alu_dni=" + dni;

		Connection con = Conexion.getConexion().getSQLConexion();
		try {
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				aux = true;
			} else {
				aux = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return aux;
	}

	@Override
	public boolean existeEmail(String email) {
		boolean aux = false;
		String str = "SELECT * FROM alumnos WHERE alu_email=?";
		Connection con = Conexion.getConexion().getSQLConexion();
		try {
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				aux = true;
			} else {
				aux = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return aux;
	}
}