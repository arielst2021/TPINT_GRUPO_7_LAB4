package entidades;

public class Provincia {
	private int Id;
	private String Nombre;
	
	public Provincia () {}
		
	public Provincia(int Id, String Nombre) {
		super();
		this.Id = Id;
		this.Nombre = Nombre;
	}

	public int getId() {
		return Id;
	}

	public void setId(int Id) {
		this.Id = Id;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String Nombre) {
		this.Nombre = Nombre;
	}
}