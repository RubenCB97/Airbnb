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
import java.util.Arrays;
import java.util.List;
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
import es.unex.pi.dao.JDBCUserDAOImpl;
import es.unex.pi.dao.ServiceDAO;
import es.unex.pi.dao.UserDAO;
import es.unex.pi.model.Category;
import es.unex.pi.model.Hosting;
import es.unex.pi.model.HostingCategories;
import es.unex.pi.model.User;
import es.unex.pi.model.Service;
import es.unex.pi.model.HostingServices;

/**
 * Servlet implementation class CreateHostServlet
 */
@WebServlet(urlPatterns = { "/user/CreateHostServlet" })
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
		request.setCharacterEncoding("UTF-8");
 
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
		categoryDAO.setConnection(conn);
		
		ServiceDAO serviceDAO = new JDBCServiceDAOImpl();
		serviceDAO.setConnection(conn);
		
		List<Service> allServices = serviceDAO.getAll();
		List<Category> allCategories = categoryDAO.getAll();
		
		
		request.setAttribute("serviceList", allServices);
		request.setAttribute("categoryList", allCategories);
		request.setAttribute("profile", "visibility: visible");
		request.setAttribute("login",  "visibility: hidden");
		
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
		HostingCategoriesDAO hostingsCategoriesDAO = new JDBCHostingCategoriesDAOImpl();
		hostingsCategoriesDAO.setConnection(conn);
		
		HostingServicesDAO hostingServicesDAO = new JDBCHostingServicesDAOImpl();
		hostingServicesDAO.setConnection(conn);
		
		
		
		//Obtenemos el usuario
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
		
			ArrayList<String> categories= null;
			if(request.getParameterValues("categories")!=null) {
				categories = new ArrayList<String>(Arrays.asList(request.getParameterValues("categories")));
			}else {
				request.setAttribute("menError", "Selecciona categoria");
				doGet(request, response);
			}
			
			ArrayList<String> services= null;
			if(request.getParameterValues("services")!=null) {
				services = new ArrayList<String>(Arrays.asList(request.getParameterValues("services")));
			}
			
			
			
			
				
			Hosting host = new Hosting();
			
			host.setIdu((int) user.getId());
			
			host.setTitle(request.getParameter("title"));
			host.setDescription(request.getParameter("description"));
			host.setTelephone(request.getParameter("telephone"));
			host.setLocation(request.getParameter("location"));
			host.setPrice(Float.parseFloat(request.getParameter("price")));
			host.setContactEmail(request.getParameter("contactEmail"));
			host.setAvailable(Integer.parseInt(request.getParameter("state")));
			
			
			
			long id = hostingDAO.add(host);
			
			for (String ca : categories) {
				HostingCategories h = new HostingCategories();
				h.setIdct(Long.parseLong(ca));
				h.setIdh(id);
				hostingsCategoriesDAO.add(h);
			}
			if(services!=null) {
				for (String se : services) {
					HostingServices h = new HostingServices();
					h.setIds(Long.parseLong(se));
					h.setIdh(id);
					hostingServicesDAO.add(h);
				}
			}
		
		response.sendRedirect("../user/HostServlet");
		}
		
	}

}
