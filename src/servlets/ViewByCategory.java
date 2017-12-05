package servlets;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewByCategory
 */
@WebServlet("/ViewByCategory")
public class ViewByCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String selectedFilter = "All";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewByCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewByCategory.jsp");
		dispatcher.forward(request, response);
		request.setAttribute("filter", selectedFilter);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.selectedFilter = request.getParameter("filter").toString();
		doGet(request, response);
	}

}
