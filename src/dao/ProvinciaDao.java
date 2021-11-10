package dao;

import java.util.ArrayList;

import entidades.Provincia;

public interface ProvinciaDao {
	public ArrayList<Provincia> listaProvincias();
	public Provincia obtenerProvinciaID(int ID);
}