package airbnb.servlet;

import java.io.IOException;
import java.sql.Connection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; 

import es.unex.pi.model.*;
import es.unex.pi.dao.*;

import java.util.logging.Logger;

/**
 * Servlet implementation class LoginUserServlet
 */
@WebServlet (urlPatterns = { "/LoginServlet.do" })
public class LoginUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());   

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		if (session.getAttribute("user")!=null) {
			logger.info("entrando");
			response.sendRedirect("/WEB-INF/mainweb.jsp"); //Página main //TODO
		}
		else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/login.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		logger.info("LoginUserServlet-POST");
		
		//Recuperamos la sesion
		HttpSession session = request.getSession();
		
		//Conexion con BD
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		UserDAO userDAO = new JDBCUserDAOImpl();
		userDAO.setConnection(conn);
		request.setCharacterEncoding("UTF-8");

		//Valores del login
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		logger.info("Usuario:" + name);
		logger.info("password:" + password);

		//Creo un user con el usuario dado
		User user = userDAO.get(name);

		if (user !=null && user.getPassword().equals(password)) {
			session.setAttribute("user", user);
			response.sendRedirect("/WEB-INF/mainweb.jsp"); //TODO
		}
		
		else {
			if(user == null)
				request.setAttribute("error", "Usuario no válido");
			else
				request.setAttribute("error", "Contraseña no válida");	
		}
		doGet(request, response);
	}

}
