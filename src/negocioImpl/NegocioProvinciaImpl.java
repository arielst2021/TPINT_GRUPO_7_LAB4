package negocioImpl;

import java.util.ArrayList;

import dao.ProvinciaDao;
import daoImpl.ProvinciaDaoImpl;
import entidades.Provincia;
import negocio.NegocioProvincia;

public class NegocioProvinciaImpl implements NegocioProvincia {
	ProvinciaDao dao = new ProvinciaDaoImpl();
	
	@Override
	public ArrayList<Provincia> listaProvincias(){
		return dao.listaProvincias();
	}
}