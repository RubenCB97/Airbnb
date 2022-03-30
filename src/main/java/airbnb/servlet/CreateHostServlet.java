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

import es.unex.pi.dao.HostingDAO;
import es.unex.pi.dao.JDBCHostingDAOImpl;
import es.unex.pi.dao.JDBCUserDAOImpl;
import es.unex.pi.dao.UserDAO;
import es.unex.pi.model.Hosting;
import es.unex.pi.model.User;

/**
 * Servlet implementation class CreateHostServlet
 */
@WebServlet(urlPatterns = { "/waterbnb/CreateHostServlet" })
public class CreateHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateHostServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("CreateHostServlet-GET");


		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/createHost.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("CreateHostServlet-POST");

		// Conexion con BD
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);
		//Obtenemos el usuario
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
		Hosting host = new Hosting();
		host.setIdu((int) user.getId());
		host.setTitle(request.getParameter("title"));
		host.setDescription(request.getParameter("description"));
		host.setTelephone(request.getParameter("telephone"));
		host.setLocation(request.getParameter("location"));
		host.setPrice(Float.parseFloat(request.getParameter("price")));
		host.setContactEmail(request.getParameter("contactEmail"));
		host.setAvailable(Integer.parseInt(request.getParameter("state")));

		hostingDAO.add(host);
		response.sendRedirect("../waterbnb/HostServlet");
		}
		
	}

}
