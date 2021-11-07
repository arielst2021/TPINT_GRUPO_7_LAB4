package entidades;

public class Materia {
	private int Id;
	private String Nombre;

	public Materia() {}

	public Materia(int Id, String Nombre) {
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