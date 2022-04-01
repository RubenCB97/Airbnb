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
import es.unex.pi.dao.JDBCUserLikesDAOImpl;
import es.unex.pi.dao.ServiceDAO;
import es.unex.pi.dao.UserLikesDAO;
import es.unex.pi.model.Category;
import es.unex.pi.model.Hosting;
import es.unex.pi.model.HostingCategories;
import es.unex.pi.model.HostingServices;
import es.unex.pi.model.Service;
import es.unex.pi.model.User;
import es.unex.pi.model.UserLikes;

/**
 * Servlet implementation class DetailHostServlet
 */
@WebServlet (urlPatterns = { "/DetailHostServlet" })
public class DetailHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailHostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("DetailHostServlet-GET");
		request.setCharacterEncoding("UTF-8");

		String visibility_profile = "visibility: visible";
		String visibility_login = "visibility: hidden";
		
		request.setAttribute("visibility_profile", visibility_profile);
		request.setAttribute("visibility_login", visibility_login);
		
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
		
		UserLikesDAO userlikesDAO = new JDBCUserLikesDAOImpl();
		userlikesDAO.setConnection(conn);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Hosting host = hostingDAO.get(Integer.parseInt(request.getParameter("id")));
		
		
		
		List<Category> category = categoryDAO.getAll();
		List<HostingCategories> HC = HostingsCategoriesDAO.getAllByHosting(host.getId());	
		List<Category> hostCategories = new ArrayList<>();
		
		List<Service> service = serviceDAO.getAll();
		List<HostingServices> HS = hostingServicesDAO.getAllByHosting(host.getId());
		List<Service> hostServices = new ArrayList<>();

		String like = "0";
		for (Category ca : category) {
			for (HostingCategories hc : HC) {
				if(ca.getId() == hc.getIdct()) 
					hostCategories.add(ca);	
			}
			
		}
		
		for (Service se : service) {
			for (HostingServices hs : HS) {
				if(se.getId() == hs.getIds()) 
					hostServices.add(se);	
			}
		}
		if(user!=null) {
			List<UserLikes> allUserLikes = userlikesDAO.getAllByUser(user.getId());
			for (UserLikes aul : allUserLikes) {
				if(aul.getIdh()==host.getId()) 
					like = "1";
			}
		}
		
		
		
		request.setAttribute("like", like);
		request.setAttribute("serviceList", hostServices);
		request.setAttribute("categoryList", hostCategories);
		request.setAttribute("host", host);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/detail.jsp");
		view.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		//Conexion con BD
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		UserLikesDAO userlikesDAO = new JDBCUserLikesDAOImpl();
		userlikesDAO.setConnection(conn);
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);
		
		Hosting host = hostingDAO.get(Integer.parseInt(request.getParameter("id")));

		if(user!=null) {
			UserLikes ul = new UserLikes();
			List<UserLikes> allUserLikes = userlikesDAO.getAllByUser(user.getId());

			boolean flag = false;
			ul.setIdu(user.getId());
			ul.setIdh(host.getId());
			for (UserLikes userLikes : allUserLikes) {
				if(userLikes.getIdh()==host.getId()) {
					userlikesDAO.delete(host.getId(), user.getId());
					host.setLikes(host.getLikes()-1);
					hostingDAO.save(host);
					flag = true;
				}	
			}
			if(!flag) {
				host.setLikes(host.getLikes()+1);
				hostingDAO.save(host);
				userlikesDAO.add(ul);
			}
			response.sendRedirect("./MainWebServlet");

		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/login.jsp");
			view.forward(request, response);		
		}
	}
	
}


