package entidades;

import java.time.Year;

public class Curso {
	private Materia Materia;
	private Semestre Semestre;
	private Year Anio;
	private Profesor2 Profesor2;

	public Curso() {

	}

	public Curso(Materia Materia, Semestre Semestre, Year Anio, Profesor2 Profesor2) {
		super();
		this.Materia = Materia;
		this.Semestre = Semestre;
		this.Anio = Anio;
		this.Profesor2 = Profesor2;
	}

	public Materia getMateria() {
		return Materia;
	}

	public void setMateria(Materia Materia) {
		this.Materia = Materia;
	}

	public Semestre getSemestre() {
		return Semestre;
	}

	public void setSemestre(Semestre Semestre) {
		this.Semestre = Semestre;
	}

	public Year getAnio() {
		return Anio;
	}

	public void setAnio(Year Anio) {
		this.Anio = Anio;
	}

	public Profesor2 getProfesor() {
		return Profesor2;
	}

	public void setProfesor(Profesor2 Profesor2) {
		this.Profesor2 = Profesor2;
	}
}