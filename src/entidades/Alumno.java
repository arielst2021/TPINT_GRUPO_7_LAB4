package entidades;

public class Alumno {
	private int Legajo;
	private Persona Persona;
	private Estado Estado;

	public Alumno() {
	}

	public Alumno(int Legajo, Persona Persona, Estado Estado) {
		super();
		this.Legajo = Legajo;
		this.Persona = Persona;
		this.Estado = Estado;
	}

	public int getLegajo() {
		return Legajo;
	}

	public void setLegajo(int Legajo) {
		this.Legajo = Legajo;
	}

	public Persona getPersona() {
		return Persona;
	}

	public void setPersona(Persona persona) {
		Persona = persona;
	}

	public Estado getEstado() {
		return Estado;
	}

	public void setEstado(Estado Estado) {
		this.Estado = Estado;
	}
}