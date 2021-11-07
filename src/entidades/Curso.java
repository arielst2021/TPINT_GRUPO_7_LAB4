package entidades;

import java.time.Year;

public class Curso {
	private Materia Materia;
	private Semestre Semestre;
	private Year Anio;
	private Profesor2 Profesor2;
	private Alumno Alumno;
	private Float notaPrimerParcial;
	private Float notaPrimerRecuperatorio;
	private Float notaSegundoParcial;
	private Float notaSegundoRecuperatorio;
	private Estado estado;

	public Curso() {

	}

	public Curso(Materia Materia, Semestre Semestre, Year Anio) {
		this.Materia = Materia;
		this.Semestre = Semestre;
		this.Anio = Anio;
	}

	public Curso(Materia Materia, Semestre Semestre, Year Anio, Profesor2 Profesor2) {
		this.Materia = Materia;
		this.Semestre = Semestre;
		this.Anio = Anio;
		this.Profesor2 = Profesor2;
	}

	public Curso(Alumno alumno, Float notaPrimerParcial, Float notaPrimerRecuperatorio, Float notaSegundoParcial,
			Float notaSegundoRecuperatorio, Estado estado) {
		Alumno = alumno;
		this.notaPrimerParcial = notaPrimerParcial;
		this.notaPrimerRecuperatorio = notaPrimerRecuperatorio;
		this.notaSegundoParcial = notaSegundoParcial;
		this.notaSegundoRecuperatorio = notaSegundoRecuperatorio;
		this.estado = estado;
	}

	public Curso(Materia materia, Semestre semestre, Year anio, Profesor2 profesor2, Alumno alumno,
			Float notaPrimerParcial, Float notaPrimerRecuperatorio, Float notaSegundoParcial,
			Float notaSegundoRecuperatorio, Estado estado) {
		Materia = materia;
		Semestre = semestre;
		Anio = anio;
		Profesor2 = profesor2;
		Alumno = alumno;
		this.notaPrimerParcial = notaPrimerParcial;
		this.notaPrimerRecuperatorio = notaPrimerRecuperatorio;
		this.notaSegundoParcial = notaSegundoParcial;
		this.notaSegundoRecuperatorio = notaSegundoRecuperatorio;
		this.estado = estado;
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

	public Profesor2 getProfesor2() {
		return Profesor2;
	}

	public void setProfesor2(Profesor2 profesor2) {
		Profesor2 = profesor2;
	}

	public Alumno getAlumno() {
		return Alumno;
	}

	public void setAlumno(Alumno alumno) {
		Alumno = alumno;
	}

	public Float getNotaPrimerParcial() {
		return notaPrimerParcial;
	}

	public void setNotaPrimerParcial(Float notaPrimerParcial) {
		this.notaPrimerParcial = notaPrimerParcial;
	}

	public Float getNotaPrimerRecuperatorio() {
		return notaPrimerRecuperatorio;
	}

	public void setNotaPrimerRecuperatorio(Float notaPrimerRecuperatorio) {
		this.notaPrimerRecuperatorio = notaPrimerRecuperatorio;
	}

	public Float getNotaSegundoParcial() {
		return notaSegundoParcial;
	}

	public void setNotaSegundoParcial(Float notaSegundoParcial) {
		this.notaSegundoParcial = notaSegundoParcial;
	}

	public Float getNotaSegundoRecuperatorio() {
		return notaSegundoRecuperatorio;
	}

	public void setNotaSegundoRecuperatorio(Float notaSegundoRecuperatorio) {
		this.notaSegundoRecuperatorio = notaSegundoRecuperatorio;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}
}