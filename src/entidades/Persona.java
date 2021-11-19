package entidades;

import java.time.LocalDate;

public class Persona {

	private String Dni;
	private String Nombre;
	private String Apellido;
	private LocalDate FechaNacimiento;
	private String Direccion;
	private Provincia Provincia;
	private String Email;
	private String Telefono;

	public Persona() {
	}
	
	public Persona(String Nombre, String Apellido) {
		this.Nombre = Nombre;
		this.Apellido = Apellido;
	}
	
	public Persona(String Dni, String Nombre, String Apellido) {
		this.Dni = Dni;
		this.Nombre = Nombre;
		this.Apellido = Apellido;
	}

	public Persona(String Dni, String Nombre, String Apellido, LocalDate FechaNacimiento, String Direccion,
			Provincia Provincia, String Email, String Telefono) {
		this.Dni = Dni;
		this.Nombre = Nombre;
		this.Apellido = Apellido;
		this.FechaNacimiento = FechaNacimiento;
		this.Direccion = Direccion;
		this.Provincia = Provincia;
		this.Email = Email;
		this.Telefono = Telefono;
	}

	public String getDni() {
		return Dni;
	}

	public void setDni(String Dni) {
		this.Dni = Dni;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String Nombre) {
		this.Nombre = Nombre;
	}

	public String getApellido() {
		return Apellido;
	}

	public void setApellido(String Apellido) {
		this.Apellido = Apellido;
	}

	public LocalDate getFechaNacimiento() {
		return FechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate FechaNacimiento) {
		this.FechaNacimiento = FechaNacimiento;
	}

	public String getDireccion() {
		return Direccion;
	}

	public void setDireccion(String Direccion) {
		this.Direccion = Direccion;
	}

	public Provincia getProvincia() {
		return Provincia;
	}

	public void setProvincia(Provincia Provincia) {
		this.Provincia = Provincia;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String Email) {
		this.Email = Email;
	}

	public String getTelefono() {
		return Telefono;
	}

	public void setTelefono(String Telefono) {
		this.Telefono = Telefono;
	}
}