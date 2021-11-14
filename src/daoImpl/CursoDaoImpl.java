package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Year;
import java.util.ArrayList;
import java.util.Iterator;

import dao.CursoDao;
import entidades.Alumno;
import entidades.Curso;
import entidades.Estado;
import entidades.Materia;
import entidades.Persona;
import entidades.Profesor;
import entidades.Semestre;

public class CursoDaoImpl implements CursoDao {
	private static final String ObtenerCursosPorLegajoProfesor = "SELECT cur_materia_id, mat_nombre, cur_semestre_id, sem_nombre, cur_anio FROM cursos INNER JOIN materias ON materias.mat_id=cursos.cur_materia_id INNER JOIN semestres ON semestres.sem_id=cursos.cur_semestre_id WHERE cur_profesor_legajo=?";
	private static final String AgregarNotasCurso = "UPDATE alumnos_cursos SET axc_calificacion1=?, axc_calificacion2=?, axc_calificacion3=?, axc_calificacion4=?, axc_estado_id=? WHERE axc_materia_id=? AND axc_semestre_id=? AND axc_anio=? AND axc_profesor_legajo=? AND axc_alumno_legajo=?";
	private static final String ObtenerAlumnosPorCurso = "SELECT alu_nombre, alu_apellido, alu_legajo, axc_calificacion1, axc_calificacion2, axc_calificacion3, axc_calificacion4, axc_estado_id, est_nombre FROM alumnos_cursos INNER JOIN alumnos ON alumnos.alu_legajo=alumnos_cursos.axc_alumno_legajo INNER JOIN estados ON alumnos_cursos.axc_estado_id=estados.est_id WHERE axc_materia_id=? AND axc_semestre_id=? AND axc_anio=? AND axc_profesor_legajo=?";

	private static final String AgregarNuevoCurso = "INSERT INTO cursos (cur_materia_id, cur_semestre_id, cur_anio, cur_profesor_legajo) VALUES (?, ?, ?, ?);";
	private static final String ObtenerCurso = "SELECT cur_materia_id, mat_nombre, cur_semestre_id, sem_nombre, cur_anio, pro_legajo, pro_nombre, pro_apellido FROM cursos INNER JOIN materias ON materias.mat_id=cursos.cur_materia_id INNER JOIN semestres ON semestres.sem_id=cursos.cur_semestre_id INNER JOIN profesores ON profesores.pro_legajo=cursos.cur_profesor_legajo";

	
	Connection miConnection = null;
	PreparedStatement miPreparedStatement = null;
	ResultSet miResultSet = null;
	Curso Curso = new Curso();

	@Override
	public ArrayList<Curso> ObtenerCursosPorLegajoProfesor(int NroLegajo) {
		ArrayList<Curso> Curso = new ArrayList<Curso>();

		try {
			// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
			miConnection = Conexion.getConexion().getSQLConexion();

			// 2. PREPARAR DECLARACIÓN
			miPreparedStatement = miConnection.prepareStatement(ObtenerCursosPorLegajoProfesor);

			// 3. ESTABLECER LOS PARÁMETROS
			miPreparedStatement.setInt(1, NroLegajo);

			// 4. EJECUTAR CONSULTA SQL
			miResultSet = miPreparedStatement.executeQuery();

			// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
			while (miResultSet.next()) {
				int idMateria = miResultSet.getInt("cur_materia_id");
				String nombreMateria = miResultSet.getString("mat_nombre");
				int idSemestre = miResultSet.getInt("cur_semestre_id");
				String nombreSemestre = miResultSet.getString("sem_nombre");
				
				//
				Year anio = Year.of(Integer.parseInt(miResultSet.getString("cur_anio").substring(0, 4)));

				Materia Materia = new Materia(idMateria, nombreMateria);
				Semestre Semestre = new Semestre(idSemestre, nombreSemestre);

				// SET
				Curso.add(new Curso(Materia, Semestre, anio));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				// SI ALGO HA IDO MAL Y QUEREMOS DESHACER LOS CAMBIOS
				miConnection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return Curso;
	}

	@Override
	public ArrayList<Curso> ObtenerAlumnosPorCurso(Curso Curso) {
		ArrayList<Curso> AlumnosPorCurso = new ArrayList<Curso>();

		try {
			// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
			miConnection = Conexion.getConexion().getSQLConexion();

			// 2. PREPARAR DECLARACIÓN
			miPreparedStatement = miConnection.prepareStatement(ObtenerAlumnosPorCurso);

			// 3. ESTABLECER LOS PARÁMETROS
			miPreparedStatement.setInt(1, Curso.getMateria().getId());
			miPreparedStatement.setInt(2, Curso.getSemestre().getId());
			String anio = String.valueOf(Curso.getAnio());
			miPreparedStatement.setString(3, anio);
			miPreparedStatement.setInt(4, Curso.getProfesor().getLegajo());
			
			// 4. EJECUTAR CONSULTA SQL
			miResultSet = miPreparedStatement.executeQuery();

			// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
			while (miResultSet.next()) {
				String AlumnoNombre = miResultSet.getString("alu_nombre");
				String AlumnoApellido = miResultSet.getString("alu_apellido");
				int AlumnoLegajo = miResultSet.getInt("alu_legajo");
				Float Nota1 = miResultSet.getFloat("axc_calificacion1");
				Float Nota2 = miResultSet.getFloat("axc_calificacion2");
				Float Nota3 = miResultSet.getFloat("axc_calificacion3");
				Float Nota4 = miResultSet.getFloat("axc_calificacion4");
				int EstadoId = miResultSet.getInt("axc_estado_id");
				String EstadoNombre = miResultSet.getString("est_nombre");
				//
				//
				Persona Persona = new Persona();
				Persona.setNombre(AlumnoNombre);
				Persona.setApellido(AlumnoApellido);			
				//
				Alumno Alumno = new Alumno();
				Alumno.setLegajo(AlumnoLegajo);
				Alumno.setPersona(Persona);
				//
				Estado Estado = new Estado(EstadoId, EstadoNombre);
				//

				AlumnosPorCurso.add(new Curso(Alumno, Nota1, Nota2, Nota3, Nota4, Estado));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				// SI ALGO HA IDO MAL Y QUEREMOS DESHACER LOS CAMBIOS
				miConnection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		System.out.println("TAMAÑO..."+ AlumnosPorCurso.size());	
		return AlumnosPorCurso;
	}
		
	@Override
	public boolean AgregarNotasCurso(ArrayList<Curso> Curso) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {			
			statement = conexion.prepareStatement(AgregarNotasCurso);
			Iterator<Curso> iterador = Curso.iterator();
			while(iterador.hasNext()) {
				Curso miCurso = (Curso)iterador.next();
				statement.setFloat(1, miCurso.getNotaPrimerParcial());
				statement.setFloat(2, miCurso.getNotaPrimerRecuperatorio());
				statement.setFloat(3, miCurso.getNotaSegundoParcial());
				statement.setFloat(4, miCurso.getNotaSegundoRecuperatorio());
				statement.setInt(5, miCurso.getEstado().getId());		
				statement.setInt(6, miCurso.getMateria().getId());
				statement.setInt(7, miCurso.getSemestre().getId());
				//
				statement.setString(8, miCurso.getAnio().toString());
				//
				statement.setInt(9, miCurso.getProfesor().getLegajo());
				statement.setInt(10, miCurso.getAlumno().getLegajo());
				if (statement.executeUpdate() > 0) {
					conexion.commit();
					isInsertExitoso = true;
				}								
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return isInsertExitoso;
	}

	@Override
	public boolean AgregarNuevoCurso(Curso Curso) {
		
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		
		boolean isInsertExitoso = false;
		try {
			statement = conexion.prepareStatement(AgregarNuevoCurso);
			statement.setInt(1, Curso.getMateria().getId());
			statement.setInt(2, Curso.getSemestre().getId());
			statement.setString(3, Curso.getAnio().toString()); // FORMATO YEAR
			statement.setInt(4, Curso.getProfesor().getLegajo());
			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return isInsertExitoso;
	}

	@Override
	public Curso ObtenerCurso(entidades.Curso Curso) {

			Curso miCurso = null;

			try {
				// 1. OBTENER UNA CONEXIÓN A LA BASE DE DATOS
				miConnection = Conexion.getConexion().getSQLConexion();

				// 2. PREPARAR DECLARACIÓN // 3. ESTABLECER LOS PARÁMETROS
				miPreparedStatement = miConnection.prepareStatement(ObtenerCurso);

				// 4. EJECUTAR CONSULTA SQL
				miResultSet = miPreparedStatement.executeQuery();

				// 5. AGREGAR EL CONJUNTO DE RESULTADOS EN UN ARRAY
				while (miResultSet.next()) {
					
					// CARGA DATOS
															
					int MateriaId = miResultSet.getInt("cur_materia_id");
					String MateriaNombre = miResultSet.getString("mat_nombre");
					
					int SemestreId = miResultSet.getInt("cur_semestre_id");
					String SemestreNombre = miResultSet.getString("sem_nombre");
					//
					Year anio = Year.of(Integer.parseInt(miResultSet.getString("cur_anio").substring(0, 4)));					
					//				
					int ProfesorLegajo = miResultSet.getInt("pro_legajo");
					String ProfesorNombre = miResultSet.getString("pro_nombre");
					String ProfesorApellido = miResultSet.getString("pro_apellido");

					miCurso = new Curso(new Materia(MateriaId, MateriaNombre), new Semestre(SemestreId, SemestreNombre), anio, new Profesor(ProfesorLegajo, new Persona(ProfesorNombre, ProfesorApellido)));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return miCurso;
		}
}