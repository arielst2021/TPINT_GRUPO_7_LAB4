CREATE DATABASE laboratorio4;

USE laboratorio4;

CREATE TABLE perfiles(
	per_id INT AUTO_INCREMENT,
    per_nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_perfiles PRIMARY KEY (per_id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;
 
CREATE TABLE estados(
	est_id INT AUTO_INCREMENT,
    est_nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_estados PRIMARY KEY (est_id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE materias(
	mat_id INT AUTO_INCREMENT,
    mat_nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_materias PRIMARY KEY (mat_id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE semestres(
	sem_id INT AUTO_INCREMENT,
    sem_nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_semestres PRIMARY KEY (sem_id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE provincias(
	prov_id INT AUTO_INCREMENT,
    prov_nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_provincias PRIMARY KEY (prov_id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE alumnos(
	alu_legajo INT AUTO_INCREMENT NOT NULL,
    alu_dni CHAR (8) NOT NULL UNIQUE,
	alu_nombre VARCHAR (20) NOT NULL,
    alu_apellido VARCHAR (20) NOT NULL,
    alu_fechanac DATE NOT NULL,
	alu_direccion VARCHAR (20) NOT NULL,
    alu_provincia_id INT NOT NULL,
    alu_email VARCHAR (20) NOT NULL,
	alu_telefono VARCHAR (20) NOT NULL,
    alu_estado_id INT NOT NULL, 
	CONSTRAINT PK_alumnos PRIMARY KEY (alu_legajo)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE profesores(
	pro_legajo INT AUTO_INCREMENT,
    pro_dni CHAR (8) NOT NULL UNIQUE,
	pro_nombre VARCHAR (20) NOT NULL,
    pro_apellido VARCHAR (20) NOT NULL,
    pro_fechanac DATE NOT NULL,
	pro_direccion VARCHAR (20) NOT NULL,
    pro_provincia_id INT NOT NULL,
    pro_email VARCHAR (20) NOT NULL,
	pro_telefono VARCHAR (20) NOT NULL,
    pro_estado_id INT NOT NULL,
    pro_perfil_id INT NOT NULL, 
	pro_usuario VARCHAR (60) NOT NULL,
    pro_contrasenia VARCHAR (60) NOT NULL,    
	CONSTRAINT PK_profesores PRIMARY KEY (pro_legajo)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE cursos(
	cur_materia_id INT NOT NULL,
	cur_semestre_id INT NOT NULL,
	cur_anio YEAR NOT NULL,
	cur_profesor_legajo INT NOT NULL,    
	CONSTRAINT PK_cursos PRIMARY KEY (cur_materia_id, cur_semestre_id, cur_anio, cur_profesor_legajo)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE alumnos_cursos(
	axc_materia_id INT NOT NULL,
	axc_semestre_id INT NOT NULL,
	axc_anio YEAR NOT NULL,
	axc_profesor_legajo INT NOT NULL,
	axc_alumno_legajo INT NOT NULL,
    axc_calificacion1 DECIMAL (3,1) DEFAULT '0.0' NULL,
    axc_calificacion2 DECIMAL (3,1) DEFAULT '0.0' NULL,
    axc_calificacion3 DECIMAL (3,1) DEFAULT '0.0' NULL,
    axc_calificacion4 DECIMAL (3,1) DEFAULT '0.0' NULL,  
    axc_estado_id INT NULL,
	CONSTRAINT PK_alumnos_cursos PRIMARY KEY (axc_materia_id, axc_semestre_id, axc_anio, axc_profesor_legajo, axc_alumno_legajo)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE alumnos
ADD CONSTRAINT FK_alumnos_estados FOREIGN KEY (alu_estado_id) REFERENCES estados(est_id);

ALTER TABLE alumnos
ADD CONSTRAINT FK_alumnos_provincias FOREIGN KEY (alu_provincia_id) REFERENCES provincias(prov_id);

ALTER TABLE alumnos_cursos
ADD CONSTRAINT FK_alumnos_cursos_alumnos FOREIGN KEY (axc_alumno_legajo) REFERENCES alumnos(alu_legajo);

ALTER TABLE alumnos_cursos
ADD CONSTRAINT FK_alumnos_cursos_estados FOREIGN KEY (axc_estado_id) REFERENCES estados(est_id);

ALTER TABLE alumnos_cursos
ADD CONSTRAINT FK_alumnos_cursos_profesores FOREIGN KEY (axc_profesor_legajo) REFERENCES profesores(pro_legajo);

ALTER TABLE alumnos_cursos
ADD CONSTRAINT FK_alumnos_cursos_cursos FOREIGN KEY (axc_materia_id, axc_semestre_id, axc_anio, axc_profesor_legajo) REFERENCES cursos(cur_materia_id, cur_semestre_id, cur_anio, cur_profesor_legajo);

ALTER TABLE cursos
ADD CONSTRAINT FK_cursos_materias FOREIGN KEY (cur_materia_id) REFERENCES materias(mat_id);

ALTER TABLE cursos
ADD CONSTRAINT FK_alumnos_semestres FOREIGN KEY (cur_semestre_id) REFERENCES semestres(sem_id);

ALTER TABLE cursos
ADD CONSTRAINT FK_alumnos_profesores FOREIGN KEY (cur_profesor_legajo) REFERENCES profesores(pro_legajo);

ALTER TABLE profesores
ADD CONSTRAINT FK_profesores_estados FOREIGN KEY (pro_estado_id) REFERENCES estados(est_id);

ALTER TABLE profesores
ADD CONSTRAINT FK_profesores_provincias FOREIGN KEY (pro_provincia_id) REFERENCES provincias(prov_id);

ALTER TABLE profesores
ADD CONSTRAINT FK_profesores_perfiles FOREIGN KEY (pro_perfil_id) REFERENCES perfiles(per_id);