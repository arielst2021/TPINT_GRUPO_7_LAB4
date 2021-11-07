package entidades;

public class Profesor2 {
	private int Legajo;
	private Persona2 Persona2;
	private Estado Estado;
	private Perfil Perfil;
	private String Usuario;
	private String Contrasenia;

	public Profesor2() {
	}

	public Profesor2(int Legajo, Persona2 Persona2, Estado Estado, Perfil Perfil, String Usuario, String Contrasenia) {
		super();
		this.Legajo = Legajo;
		this.Persona2 = Persona2;
		this.Estado = Estado;
		this.Perfil = Perfil;
		this.Usuario = Usuario;
		this.Contrasenia = Contrasenia;
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

	public Perfil getPerfil() {
		return Perfil;
	}

	public void setPerfil(Perfil Perfil) {
		this.Perfil = Perfil;
	}

	public String getUsuario() {
		return Usuario;
	}

	public void setUsuario(String Usuario) {
		this.Usuario = Usuario;
	}

	public String getContrasenia() {
		return Contrasenia;
	}

	public void setContrasenia(String Contrasenia) {
		this.Contrasenia = Contrasenia;
	}
}