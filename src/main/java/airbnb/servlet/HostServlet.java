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
import es.unex.pi.model.Category;
import es.unex.pi.model.Hosting;
import es.unex.pi.model.HostingCategories;
import es.unex.pi.model.User;

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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		request.setAttribute("visibility_profile", "visibility: visible");
		request.setAttribute("visibility_login", "visibility: hidden");

		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);

		CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
		categoryDAO.setConnection(conn);
		HostingCategoriesDAO HostingsCategoriesDAO = new JDBCHostingCategoriesDAOImpl();
		HostingsCategoriesDAO.setConnection(conn);

		long idUser = user.getId();

		List<String> caux = new ArrayList<String>();
		Map<Hosting, List<String>> userHostingMap = new HashMap<Hosting, List<String>>();

		List<Hosting> Hosts = hostingDAO.getAllByUser(idUser);

		for (Hosting hs : Hosts) {
			List<HostingCategories> HC = HostingsCategoriesDAO.getAllByHosting(hs.getId());
			for (HostingCategories hc : HC) {
				caux.add(categoryDAO.get(hc.getIdct()).getName());
				logger.info("NOMBREE: " + caux.get(0));

			}
			userHostingMap.put(hs, caux);
		}

		request.setAttribute("hostlistMap", userHostingMap);
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
