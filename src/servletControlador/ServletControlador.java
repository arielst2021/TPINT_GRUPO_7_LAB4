package servletControlador;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Alumno;
import entidades.Curso;
import entidades.Estado;
import entidades.Materia;

//import com.sun.tools.javac.util.Convert;

import entidades.Profesor;
import entidades.Profesor2;
import entidades.Semestre;
import negocio.NegocioCurso;
import negocio.NegocioEstado;
import negocio.NegocioProfesor;
import negocioImpl.NegocioCursoImpl;
import negocioImpl.NegocioEstadoImpl;
import negocioImpl.NegocioProfesorImpl;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletControlador() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


				
	}


}
// Probando repositorio