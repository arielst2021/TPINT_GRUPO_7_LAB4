package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dao.ProvinciaDao;
import entidades.Estado;
import entidades.Persona;
import entidades.Provincia;

public class ProvinciaDaoImpl implements ProvinciaDao {
	
	@Override
	public ArrayList<Provincia> listaProvincias() {
		ArrayList<Provincia> provincias = new ArrayList<Provincia>();
		String str = "SELECT * FROM laboratorio4.provincias;";
		

		// CONEXION
		Connection con = Conexion.getConexion().getSQLConexion();
		
		try{
			// Declaracion y ejecución
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				Provincia prov = new Provincia();
				prov.setId(rs.getInt("prov_id"));
				prov.setNombre(rs.getString("prov_nombre"));
				provincias.add(prov);
			}
		}
		catch (SQLException e) {
		e.printStackTrace();
		try {
			con.rollback();
		} catch (SQLException e1) {
			e1.printStackTrace();}	
		}
		return provincias;
	}
	
	@Override
	public Provincia obtenerProvinciaID(int ID) {
		Provincia prov = new Provincia();
		String str = "SELECT * FROM laboratorio4.provincias WHERE prov_id="+ID;
		Connection con = Conexion.getConexion().getSQLConexion();
		try{
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				prov.setId(rs.getInt("prov_id"));
				prov.setNombre(rs.getString("prov_nombre"));
			}
		}
		catch (SQLException e) {e.printStackTrace();try {con.rollback();} catch (SQLException e1) {e1.printStackTrace();}}
		return prov;
	}
}


