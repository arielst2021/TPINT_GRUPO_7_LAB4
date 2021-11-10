package negocio;

import java.util.ArrayList;

import entidades.Provincia;

public interface NegocioProvincia {
	public ArrayList<Provincia> listaProvincias();
	public Provincia obtenerProvinciaID(int ID);
}