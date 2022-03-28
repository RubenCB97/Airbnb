package airbnb.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

import es.unex.pi.model.User;

/**
 * Servlet implementation class MainWebServlet
 */
@WebServlet (urlPatterns = { "/MainWebServlet" })
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("MainWebServlet-GET");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		String visibility_profile = "visibility: hidden";
		String visibility_login = "visibility: visible";
		if (user != null) {
			visibility_profile = "visibility: visible";
			visibility_login = "visibility: hidden";
		}
		request.setAttribute("visibility_profile", visibility_profile);
		request.setAttribute("visibility_login", visibility_login);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/mainweb.jsp");
		view.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("MainWebServlet-POST");
		doGet(request, response);
	}

}