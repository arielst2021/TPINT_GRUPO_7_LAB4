package entidades;

public class Profesor {
	private int Legajo;
	private Persona Persona;
	private Estado Estado;
	private Perfil Perfil;
	private String Usuario;
	private String Contrasenia;

	public Profesor() {	
	}
	
	public Profesor(int Legajo) {
		this.Legajo = Legajo;
	}

	public Profesor(int Legajo, Persona Persona) {
		this.Legajo = Legajo;
		this.Persona = Persona;
	}
	
	public Profesor(int Legajo, Persona Persona, Estado Estado, Perfil Perfil, String Usuario, String Contrasenia) {
		super();
		this.Legajo = Legajo;
		this.Persona = Persona;
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

	public Persona getPersona() {
		return Persona;
	}

	public void setPersona(Persona Persona) {
		this.Persona = Persona;
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