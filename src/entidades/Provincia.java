package entidades;

public class Provincia {
	private int Id;
	private int Nombre;
		
	public Provincia(int Id, int Nombre) {
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

	public int getNombre() {
		return Nombre;
	}

	public void setNombre(int Nombre) {
		this.Nombre = Nombre;
	}
}