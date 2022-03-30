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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import es.unex.pi.dao.CategoryDAO;
import es.unex.pi.dao.HostingCategoriesDAO;
import es.unex.pi.dao.HostingDAO;
import es.unex.pi.dao.JDBCCategoryDAOImpl;
import es.unex.pi.dao.JDBCHostingCategoriesDAOImpl;
import es.unex.pi.dao.JDBCHostingDAOImpl;
import es.unex.pi.model.Hosting;
import es.unex.pi.model.HostingCategories;
import es.unex.pi.model.User;

/**
 * Servlet implementation class EditHostServlet
 */
@WebServlet (urlPatterns = { "/waterbnb/EditHostServlet" })
public class EditHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());   

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditHostServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("PerfilServlet-GET");
		//Conexion con BD
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);
		
		String visibility_profile = "visibility: visible";
		String visibility_login = "visibility: hidden";
		
		request.setAttribute("visibility_profile", visibility_profile);
		request.setAttribute("visibility_login", visibility_login);
		
		Hosting host = hostingDAO.get(Integer.parseInt(request.getParameter("id")));
		
		request.setAttribute("host", host);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/editHosts.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Conexion con BD
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);
		
		Hosting host = hostingDAO.get(Integer.parseInt(request.getParameter("id")));
		
		host.setTitle(request.getParameter("title"));
		host.setDescription(request.getParameter("description"));
		host.setTelephone(request.getParameter("telephone"));
		host.setLocation(request.getParameter("location"));
		host.setPrice(Float.parseFloat(request.getParameter("price")));
		host.setContactEmail(request.getParameter("contactEmail"));
		host.setAvailable(Integer.parseInt(request.getParameter("state")));


		hostingDAO.save(host);
		response.sendRedirect("../waterbnb/HostServlet");
		

	
	}

}
