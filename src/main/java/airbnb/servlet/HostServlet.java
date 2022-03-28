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
import java.util.List;
import java.util.logging.Logger;

import es.unex.pi.dao.HostingDAO;
import es.unex.pi.dao.JDBCHostingDAOImpl;
import es.unex.pi.model.Hosting;
import es.unex.pi.model.User;

/**
 * Servlet implementation class HostServlet
 */
@WebServlet (urlPatterns = { "/waterbnb/HostServlet" })

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("HostServlet-GET");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		request.setAttribute("visibility_profile", "visibility: visible");
		request.setAttribute("visibility_login", "visibility: hidden");
		
		Connection conn = (Connection) getServletContext().getAttribute("dbConn");
		HostingDAO hostingDAO = new JDBCHostingDAOImpl();
		hostingDAO.setConnection(conn);
		
		List<Hosting> Hosts = hostingDAO.getAll();
		List<Hosting> userHosts = new ArrayList<Hosting>();
		long idUser = user.getId();
		
		for(Hosting hs : Hosts) {
			if(hs.getIdu() == idUser) {
				userHosts.add(hs);
			}

		}
		request.setAttribute("hostlist", userHosts);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/myHosts.jsp");
		view.forward(request, response);
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
