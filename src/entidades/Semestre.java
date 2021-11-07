package entidades;

public class Semestre {
	private int Id;
	private String Nombre;

	public Semestre() {
	}

	public Semestre(int Id, String Nombre) {
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