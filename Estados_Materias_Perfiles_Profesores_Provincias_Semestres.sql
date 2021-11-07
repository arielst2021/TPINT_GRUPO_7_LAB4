INSERT INTO `laboratorio4`.`perfiles` (`per_id`, `per_nombre`) VALUES ('1', 'Administrador');
INSERT INTO `laboratorio4`.`perfiles` (`per_id`, `per_nombre`) VALUES ('2', 'Docente');


INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('1', 'Buenos Aires');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('2', 'Catamarca');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('3', 'Chaco');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('4', 'Chubut');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('5', 'Ciudad de Bs. As.');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('6', 'Córdoba');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('7', 'Corrientes');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('8', 'Entre Ríos');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('9', 'Formosa');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('10', 'Jujuy');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('11', 'La Pampa');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('12', 'La Rioja');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('13', 'Mendoza');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('14', 'Misiones');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('15', 'Neuquén');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('16', 'Río Negro');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('17', 'Salta');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('18', 'San Juan');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('19', 'San Luis');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('20', 'Santa Cruz');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('21', 'Santa Fe');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('22', 'Santiago del Estero');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('23', 'Tierra del Fuego');
INSERT INTO `laboratorio4`.`provincias` (`prov_id`, `prov_nombre`) VALUES ('24', 'Tucumán');


INSERT INTO `laboratorio4`.`estados` (`est_id`, `est_nombre`) VALUES ('1', 'Activo');
INSERT INTO `laboratorio4`.`estados` (`est_id`, `est_nombre`) VALUES ('2', 'Inactivo');


INSERT INTO `laboratorio4`.`semestres` (`sem_id`, `sem_nombre`) VALUES ('1', 'Primer Semestre');
INSERT INTO `laboratorio4`.`semestres` (`sem_id`, `sem_nombre`) VALUES ('2', 'Segundo Semestre');


INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('1', 'Ciencias Naturales');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('2', 'Ciencias Sociales');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('3', 'Sociología');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('4', 'Educación Física');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('5', 'Inglés');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('6', 'Matemática');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('7', 'Literatura');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('8', 'Biología');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('9', 'Físico-química');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('10', 'Geografía');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('11', 'Historia');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('12', 'Informática');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('13', 'Catequesis');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('14', 'Derecho');
INSERT INTO `laboratorio4`.`materias` (`mat_id`, `mat_nombre`) VALUES ('15', 'Filosofía');


INSERT INTO `laboratorio4`.`profesores` (`pro_legajo`, `pro_dni`, `pro_nombre`, `pro_apellido`, `pro_fechanac`, `pro_direccion`, `pro_provincia_id`, `pro_email`, `pro_telefono`, `pro_estado_id`, `pro_perfil_id`, `pro_usuario`, `pro_contrasenia`) VALUES ('1', '18577302', 'Martin', 'Bartolome', '2070-12-31', 'Tacuarembo 4405', '5', 'bartolome@gmail', '555-5555', '1', '1', 'admin', 'admin');
INSERT INTO `laboratorio4`.`profesores` (`pro_legajo`, `pro_dni`, `pro_nombre`, `pro_apellido`, `pro_fechanac`, `pro_direccion`, `pro_provincia_id`, `pro_email`, `pro_telefono`, `pro_estado_id`, `pro_perfil_id`, `pro_usuario`, `pro_contrasenia`) VALUES ('2', '22450807', 'Marta', 'Arnau', '2075-05-06', 'Ituzaingo 9725', '1', 'marta@gmail.com', '555-1500', '1', '2', 'usuario', 'usuario');


