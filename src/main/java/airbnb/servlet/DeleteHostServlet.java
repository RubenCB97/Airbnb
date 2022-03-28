package airbnb.servlet;

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

/**
 * Servlet implementation class DeleteHostServlet
 */
@WebServlet (urlPatterns = { "/waterbnb/DeleteHostServlet" })

public class DeleteHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());   

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHostServlet() {
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
		logger.info("DeleteProfileServlet-POST");

		//Conexion con BD
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);
		
		
		long idHost = Integer.parseInt(request.getParameter("Host_delete"));
		
		hostingDAO.delete(idHost);

		response.sendRedirect("../MainWebServlet");
	}

}
