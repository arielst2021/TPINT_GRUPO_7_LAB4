package entidades;

public class Perfil {
	private int Id;
	private String Nombre;

	public Perfil() {
	}

	public Perfil(int Id, String Nombre) {
		this.Id = Id;
		this.Nombre = Nombre;
	}

	public int getId() {
		return Id;
	}

	public void setCodPerfil(int Id) {
		this.Id = Id;
	}

	public String getNombrePerfil() {
		return Nombre;
	}

	public void setNombrePerfil(String Nombre) {
		this.Nombre = Nombre;
	}
}