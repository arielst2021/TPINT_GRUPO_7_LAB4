package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dao.ProvinciaDao;
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
}


