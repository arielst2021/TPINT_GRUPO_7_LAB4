package entidades;

public class Estado {
	private int Id;
	private String Nombre;

	public Estado() {
	}

	public Estado(int Id) {
		this.Id = Id;

	}
	
	public Estado(String Nombre) {
		this.Nombre = Nombre;
	}
	
	public Estado(int Id, String Nombre) {
		this.Id = Id;
		this.Nombre = Nombre;
	}

	public int getId() {
		return Id;
	}

	public void setIdEstado(int Id) {
		this.Id = Id;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String Nombre) {
		this.Nombre = Nombre;
	}
}