package entidades;
import java.time.LocalDate;
import java.util.Date;

public class Persona {
	
	private String nombre ;
	private String apellido ;
	private String telefono ;
	private String mail ;
	private String dni ;
	private String direccion ;
	private int provincia ;
	private Date fechanacimiento;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getProvincia() {
		return provincia;
	}
	public void setProvincia(int provincia) {
		this.provincia = provincia;
	}
	public Date getFechanacimiento() {
		
		
		
		
		return fechanacimiento;
	}
	public void setFechanacimiento(Date fechanacimiento) {
		this.fechanacimiento = fechanacimiento;
	}
	

}
