package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewByCategory
 */
@WebServlet("/ViewItemsGreaterThan")
public class ViewItemsGreaterThan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Double minValue = 0.0;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewItemsGreaterThan() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewItemsGreaterThan.jsp");
		request.setAttribute("minValue", minValue.toString());
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.minValue = Double.parseDouble(request.getParameter("minValue").toString());
		doGet(request, response);
	}

}
