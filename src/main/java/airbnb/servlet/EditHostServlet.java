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
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collector;
import java.util.stream.Collectors;

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
import es.unex.pi.model.Service;
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
		logger.info("EditHostServlet-GET");

	
		//Conexion con BD
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
		
		Hosting host = hostingDAO.get(Integer.parseInt(request.getParameter("id")));
		List<Category> category = categoryDAO.getAll();
		List<HostingCategories> HC = HostingsCategoriesDAO.getAllByHosting(host.getId());	
		Map<Category, Boolean> hostCategories = new HashMap<Category, Boolean>();
		
		List<Service> service = serviceDAO.getAll();
		List<HostingServices> HS = hostingServicesDAO.getAllByHosting(host.getId());
		Map<Service, Boolean> hostServices = new HashMap<Service, Boolean>();

		
		for (Category ca : category) {
			boolean flagC = false;
			for (HostingCategories hc : HC) {
				if(ca.getId() == hc.getIdct()) {
					hostCategories.put(ca, true);
					flagC = true;
				}
			}
			if(!flagC) {
				hostCategories.put(ca, false);
			}
		}
		
		for (Service se : service) {
			boolean flagS = false;
			for (HostingServices hs : HS) {
				if(se.getId() == hs.getIds()) {
					hostServices.put(se, true);
					flagS = true;
				}
			}
			if(!flagS) {
				hostServices.put(se, false);
			}
		}
		
		request.setAttribute("serviceList", hostServices);
		request.setAttribute("categoryList", hostCategories);
		request.setAttribute("host", host);
		request.setAttribute("profile", "visibility: visible");
		request.setAttribute("login",  "visibility: hidden");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/editHosts.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("EditHostServlet-POST");

		//Conexion con BD
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);
		
		HostingCategoriesDAO hostingsCategoriesDAO = new JDBCHostingCategoriesDAOImpl();
		hostingsCategoriesDAO.setConnection(conn);
		CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
		categoryDAO.setConnection(conn);
		

		ServiceDAO serviceDAO = new JDBCServiceDAOImpl();
		serviceDAO.setConnection(conn);
		HostingServicesDAO hostingServicesDAO = new JDBCHostingServicesDAOImpl();
		hostingServicesDAO.setConnection(conn);

		Hosting host = hostingDAO.get(Integer.parseInt(request.getParameter("id")));
		
		List<Category> allCategory = categoryDAO.getAll();
		ArrayList<String> categories= null;
		if(request.getParameterValues("categories")!=null) {
			categories = new ArrayList<String>(Arrays.asList(request.getParameterValues("categories")));
		}
		
		for (Category ca : allCategory) {
			hostingsCategoriesDAO.delete(host.getId(), ca.getId());
			HostingCategories h = new HostingCategories();
			if(categories!=null) {
				for (String caHost : categories) {
					if(ca.getId() == Long.parseLong(caHost)){
							h.setIdct(ca.getId());
							h.setIdh(host.getId());
							hostingsCategoriesDAO.add(h);
					}
				}
			}else {
				request.setAttribute("menError", "Selecciona categoria");
				doGet(request, response);
			}
		}
		

		List<Service> allService = serviceDAO.getAll();
		
			ArrayList<String> services= null;
			if(request.getParameterValues("services")!=null) {
				services = new ArrayList<String>(Arrays.asList(request.getParameterValues("services")));
			}
			
			for (Service se : allService) {
				hostingServicesDAO.delete(host.getId(), se.getId());
				HostingServices hs = new HostingServices();
				if(services!=null) {
				for (String seHost : services) {
					if(se.getId() == Long.parseLong(seHost)){
							hs.setIds(se.getId());
							hs.setIdh(host.getId());
							hostingServicesDAO.add(hs);
					}
				}	
			}
		}
        
        //TODO COMPROBAR
		
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
