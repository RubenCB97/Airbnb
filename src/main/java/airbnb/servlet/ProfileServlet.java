package airbnb.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.logging.Logger;

import es.unex.pi.dao.JDBCUserDAOImpl;
import es.unex.pi.dao.UserDAO;
import es.unex.pi.model.User;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet(urlPatterns = { "/waterbnb/ProfileServlet" })
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.info("PerfilServlet-GET");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String profile = "visibility: visible";
		String login = "visibility: hidden";
		request.setAttribute("profile", profile);
		request.setAttribute("login", login);

		request.setAttribute("name", user.getUsername());
		request.setAttribute("email", user.getEmail());

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/editProfile.jsp");
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.info("PerfilServlet-POST");

		// Conexion con BD
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		UserDAO userDAO = new JDBCUserDAOImpl();
		userDAO.setConnection(conn);

		// Recuperamos session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String NewEmail = request.getParameter("email");
		String Newpassword = request.getParameter("password");
		String Oldpassword = request.getParameter("passwordOld");

		if (!user.getPassword().equals(Oldpassword)) {
			request.setAttribute("messages", "Contraseña actual invalida");
			doGet(request, response);

		}

		user.setEmail(NewEmail);
		user.setPassword(Newpassword);
		userDAO.save(user);
		response.sendRedirect("../MainWebServlet");
	}

}
