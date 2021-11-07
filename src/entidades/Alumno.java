package entidades;

public class Alumno {
	private int Legajo;
	private Persona2 Persona2;
	private Estado Estado;

	public Alumno() {
	}

	public Alumno(int Legajo, Persona2 Persona2, Estado Estado) {
		super();
		this.Legajo = Legajo;
		this.Persona2 = Persona2;
		this.Estado = Estado;
	}

	public int getLegajo() {
		return Legajo;
	}

	public void setLegajo(int Legajo) {
		this.Legajo = Legajo;
	}

	public Persona2 getPersona2() {
		return Persona2;
	}

	public void setPersona2(Persona2 persona2) {
		Persona2 = persona2;
	}

	public Estado getEstado() {
		return Estado;
	}

	public void setEstado(Estado Estado) {
		this.Estado = Estado;
	}
}