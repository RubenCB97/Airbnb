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
import es.unex.pi.dao.HostingServicesDAO;
import es.unex.pi.dao.JDBCCategoryDAOImpl;
import es.unex.pi.dao.JDBCHostingCategoriesDAOImpl;
import es.unex.pi.dao.JDBCHostingDAOImpl;
import es.unex.pi.dao.JDBCHostingServicesDAOImpl;
import es.unex.pi.dao.JDBCServiceDAOImpl;
import es.unex.pi.dao.ServiceDAO;
import es.unex.pi.model.Category;
import es.unex.pi.model.Hosting;
import es.unex.pi.model.HostingCategories;
import es.unex.pi.model.HostingServices;
import es.unex.pi.model.User;
import es.unex.pi.util.Triplet;

/**
 * Servlet implementation class HostServlet
 */
@WebServlet(urlPatterns = { "/waterbnb/HostServlet" })

public class HostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.info("HostServlet-GET");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");


		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);

		CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
		categoryDAO.setConnection(conn);
		HostingCategoriesDAO HostingsCategoriesDAO = new JDBCHostingCategoriesDAOImpl();
		HostingsCategoriesDAO.setConnection(conn);
		ServiceDAO serviceDAO = new JDBCServiceDAOImpl();
		serviceDAO.setConnection(conn);
		HostingServicesDAO hostingServicesDAO = new JDBCHostingServicesDAOImpl();
		hostingServicesDAO.setConnection(conn);

		long idUser = user.getId();

		Map<Hosting, List<String>> userHostingMap = new HashMap<Hosting, List<String>>();
		Map<Hosting, List<String>> userServicesMap = new HashMap<Hosting, List<String>>();

		List<Hosting> Hosts = hostingDAO.getAllByUser(idUser);
		

		
		for (Hosting hs : Hosts) {
			List<HostingCategories> HC = HostingsCategoriesDAO.getAllByHosting(hs.getId());
			List<HostingServices> HS = hostingServicesDAO.getAllByHosting(hs.getId());

			List<String> caux = new ArrayList<String>();
			List<String> saux = new ArrayList<String>();

			
			for (HostingCategories hc : HC) {
				caux.add(categoryDAO.get(hc.getIdct()).getName());

				logger.info("NOMBRE cat: " + caux.get(0));

			}
			
			for (HostingServices hc : HS) {
				saux.add(serviceDAO.get(hc.getIds()).getName());

				logger.info("NOMBRE serv: " + saux.get(0));

			}
			userServicesMap.put(hs, saux);
			userHostingMap.put(hs, caux);
		}
		request.setAttribute("userServicesMap", userServicesMap);
		request.setAttribute("hostlistMap", userHostingMap);
		request.setAttribute("profile", "visibility: visible");
		request.setAttribute("login",  "visibility: hidden");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/myHosts.jsp");
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
