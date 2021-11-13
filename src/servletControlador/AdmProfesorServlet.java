package servletControlador;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Profesor;
import negocio.NegocioProfesor;
import negocioImpl.NegocioProfesorImpl;

/**
 * Servlet implementation class ProfesorServlet
 */
@WebServlet("/AdmProfesorServlet")
public class AdmProfesorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmProfesorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("btnregistrar") != null) {

			String string = request.getParameter("nacimiento");
			SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
			Date fecha = null;
			try {

				System.out.println("Se pudo castear el date");
				fecha = (Date) formato.parse(request.getParameter("nacimiento"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("No se pudo castear el date");
			}

			int idprovincia = Integer.parseInt(request.getParameter("provincias"));

			NegocioProfesor negocioprofesor = new NegocioProfesorImpl();
//			Profesor profesor = new Profesor();
//			profesor.setNombre(request.getParameter("name"));
//			profesor.setApellido(request.getParameter("apellido"));
//			profesor.setContraseña(request.getParameter("password"));
//			profesor.setDireccion(request.getParameter("direccion"));
//			profesor.setDni(request.getParameter("dni"));
//			profesor.setEstado(1);
//			profesor.setPerfil(1);
//			profesor.setTelefono(request.getParameter("telefono"));
//			profesor.setUsuario(request.getParameter("dni"));
//			profesor.setMail(request.getParameter("mail"));
//			profesor.setFechanacimiento(fecha);
//			profesor.setProvincia(idprovincia);
//			negocioprofesor.guardarprofesor(profesor);

			RequestDispatcher miRequestDispatcher = request.getRequestDispatcher("/registro.jsp");
			miRequestDispatcher.forward(request, response);
		}
	}

}
