package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.AlumnoDao;
import entidades.Alumno;
import entidades.Persona2;
import entidades.Provincia;
import entidades.Estado;

public class AlumnoDaoImpl implements AlumnoDao{
	
	@Override
	public ArrayList<Alumno> obtenerAlumnosTodos() {
		String str = "SELECT * FROM laboratorio4.alumnos INNER JOIN estados ON estados.est_id=alumnos.alu_estado_id INNER JOIN provincias ON alu_provincia_id=prov_id;";
		
		ArrayList<Alumno> listaAlumnos = new ArrayList<Alumno>();
		
		// CONEXION
		Connection con = Conexion.getConexion().getSQLConexion();
		
		try{
			// Declaracion y ejecución
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				// Carga Objecto de Alumno y lo agrega al ArrayList
				Alumno alum = new Alumno();
				Persona2 per = new Persona2();
				alum.setLegajo(rs.getInt("alu_legajo"));

				per.setDni(rs.getString("alu_dni"));
				per.setNombre(rs.getString("alu_nombre"));
				per.setApellido(rs.getString("alu_apellido"));
				//fechanac
				per.setDireccion(rs.getString("alu_direccion"));
				//pronvicia
				Provincia prov = new Provincia();
				prov.setId(rs.getInt("prov_id"));
				prov.setNombre(rs.getString("prov_nombre"));
				per.setProvincia(prov);
				//email
				per.setEmail(rs.getString("alu_email"));
				//telefono
				per.setEmail(rs.getString("alu_email"));
				per.setTelefono(rs.getString("alu_telefono"));
				alum.setPersona2(per);
				//estado
				Estado est = new Estado();
				est.setIdEstado(rs.getInt("est_id"));
				est.setNombre(rs.getString("est_nombre"));
				alum.setEstado(est);
				
				listaAlumnos.add(alum);
			}
			
		}
		catch (SQLException e) {
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
		String str = "SELECT * FROM laboratorio4.alumnos INNER JOIN estados ON estados.est_id=alumnos.alu_estado_id INNER JOIN provincias ON alu_provincia_id=prov_id;";
			
			ArrayList<Alumno> listaAlumnos = new ArrayList<Alumno>();
			
			
			Connection con = Conexion.getConexion().getSQLConexion();
			try{
				PreparedStatement ps = con.prepareStatement(str);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					Alumno alum = new Alumno();
					Persona2 per = new Persona2();
					Estado est = new Estado();		
					alum.setLegajo(rs.getInt("alu_legajo"));
					
					
					
					// Persona2
					//DNI
					per.setDni(rs.getString("alu_dni"));
					per.setNombre(rs.getString("alu_nombre"));
					per.setApellido(rs.getString("alu_apellido"));
					//fechanac
					per.setDireccion(rs.getString("alu_direccion"));
					//pronvicia
					//email
					per.setEmail(rs.getString("alu_email"));
					//telefono
					per.setEmail(rs.getString("alu_email"));
					per.setTelefono(rs.getString("alu_telefono"));
					alum.setPersona2(per);
					//estado
					est.setIdEstado(rs.getInt("est_id"));
					est.setNombre(rs.getString("est_nombre"));
					alum.setEstado(est);
					
					listaAlumnos.add(alum);
				}
				
			}
			catch (SQLException e) {
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
		String str = "SELECT * FROM laboratorio4.alumnos INNER JOIN estados ON estados.est_id=alumnos.alu_estado_id INNER JOIN provincias ON alu_provincia_id=prov_id WHERE alu_legajo="+Legajo;
	
		
		Connection con = Conexion.getConexion().getSQLConexion();
		try{
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				// Carga Objecto de Alumno
				Persona2 per = new Persona2();
				alum.setLegajo(rs.getInt("alu_legajo"));

				per.setDni(rs.getString("alu_dni"));
				per.setNombre(rs.getString("alu_nombre"));
				per.setApellido(rs.getString("alu_apellido"));
				//fechanac
				per.setDireccion(rs.getString("alu_direccion"));
				//pronvicia
				Provincia prov = new Provincia();
				prov.setId(rs.getInt("prov_id"));
				prov.setNombre(rs.getString("prov_nombre"));
				per.setProvincia(prov);
				//email
				per.setEmail(rs.getString("alu_email"));
				//telefono
				per.setEmail(rs.getString("alu_email"));
				per.setTelefono(rs.getString("alu_telefono"));
				alum.setPersona2(per);
				//estado
				Estado est = new Estado();
				est.setIdEstado(rs.getInt("est_id"));
				est.setNombre(rs.getString("est_nombre"));
				alum.setEstado(est);
			}
		}
		catch (SQLException e) {
		e.printStackTrace();
		try {
			con.rollback();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
		}
		return alum;
	}
	
	
}
