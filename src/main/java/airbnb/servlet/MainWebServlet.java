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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Logger;


import es.unex.pi.dao.CategoryDAO;
import es.unex.pi.dao.HostingDAO;
import es.unex.pi.dao.JDBCCategoryDAOImpl;
import es.unex.pi.dao.JDBCHostingDAOImpl;
import es.unex.pi.dao.JDBCServiceDAOImpl;
import es.unex.pi.dao.ServiceDAO;
import es.unex.pi.model.Category;
import es.unex.pi.model.Hosting;
import es.unex.pi.model.Service;
import es.unex.pi.model.User;

/**
 * Servlet implementation class MainWebServlet
 */
@WebServlet(urlPatterns = { "/MainWebServlet" })
public class MainWebServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainWebServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private List<Hosting> ordenarFavoritos(List<Hosting> allHost, String likes , String minlikes) {
		
		List<Hosting> listAux = new ArrayList<Hosting>();
		
		if(minlikes!=null) {
		for (Hosting hosting : allHost) {
			if(hosting.getLikes()>= Integer.parseInt(minlikes)) {
				listAux.add(hosting);
			}
		}
		}else {
			listAux = allHost;
		}
		
		
		if(likes!=null) {
		Collections.sort(listAux, new Comparator<Hosting>() {
			@Override
			public int compare(Hosting h1, Hosting h2) {
				if (likes.equals("MasLikes")) {
					return Integer.valueOf(h2.getLikes()).compareTo(Integer.valueOf(h1.getLikes()));

				} else {
					return Integer.valueOf(h1.getLikes()).compareTo(Integer.valueOf(h2.getLikes()));

				}
			}
		
		});
		}
		return listAux;

	}
	
	private List<Hosting> buscaEstado(List<Hosting> allHost, String state) {

		List<Hosting> listAux = new ArrayList<Hosting>();
		for (Hosting hosting : allHost) {
			
			if(state.equals("AllHosts")) {
				return allHost;
				
			}else if(state.equals("DispHosts")) {
				if(hosting.getAvailable() == 0) 
					listAux.add(hosting);			
			}else if(state.equals("ResHosts")) {
				if(hosting.getAvailable() == 1) 
					listAux.add(hosting);			
			}
		}

		return listAux;

	}
	private List<Hosting> busquedadAvanzada(List<Hosting> allHost,List<Service> allService,List<Category> allCategory,
			String category,String provincia,String search2, String MinPrice, String MaxPrice, String service){
		
		
		
		
		return allHost;
		
	}
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.info("MainWebServlet-GET");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");

		CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
		categoryDAO.setConnection(conn);
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);
		
		ServiceDAO serviceDAO = new JDBCServiceDAOImpl();
		serviceDAO.setConnection(conn);

		List<Service> allService = serviceDAO.getAll();
		List<Hosting> allHost = hostingDAO.getAll();
		List<Category> allCategory = categoryDAO.getAll();

		String profile = "visibility: hidden";
		String login = "visibility: visible";
		if (user != null) {
			profile = "visibility: visible";
			login = "visibility: hidden";
		}

		if (request.getParameter("filterLikes") != null || request.getParameter("MinLikes")!=null)
			allHost = ordenarFavoritos(allHost, request.getParameter("filterLikes"),request.getParameter("MinLikes"));
		if(request.getParameter("filterFav")!=null)
			allHost = buscaEstado(allHost, request.getParameter("filterFav"));
		if(request.getParameter("search")!=null)
			allHost = hostingDAO.getAllBySearchAll(request.getParameter("search"));
		
	
		
		String category="";
		String provincia="";
		String search2="";
		String MinPrice="";
		String MaxPrice="";
		String service="";
		
		if(request.getParameter("search2")!=null)	{
			
			search2 = request.getParameter("search2");

			if(request.getParameter("category")!=null)
				category = request.getParameter("category");
			
			if(request.getParameter("provincia")!=null)
				provincia = request.getParameter("provincia");
	
			if(request.getParameter("MinPrice")!=null)
				MinPrice = request.getParameter("MinPrice");
			
			if(request.getParameter("MaxPrice")!=null)
				MaxPrice = request.getParameter("MaxPrice");
			
			if(request.getParameter("service")!=null)
				service = request.getParameter("service");
		
			allHost = busquedadAvanzada(allHost,allService,allCategory,category,provincia,
					search2,MinPrice,MaxPrice,service);
		}
		request.setAttribute("profile", profile);
		request.setAttribute("login", login);
		request.setAttribute("category", allCategory);
		request.setAttribute("allHost", allHost);
		request.setAttribute("allServ", allService);


		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/mainweb.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.info("MainWebServlet-POST");
		doGet(request, response);
	}

}
