package maven.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import maven.dao.RegisterDao;
import maven.dao.RegisterDaoImpl;
import maven.model.Register;

/**
 * Servlet implementation class RegController
 */
@WebServlet("/RegisterServlet")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String year = request.getParameter("year");
		String gender = request.getParameter("gender");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String mentor = request.getParameter("mentor");
		int roll = Integer.parseInt(request.getParameter("roll"));

		Register reg = new Register(name, roll, phone, year, gender, email, username, password, mentor);

		RegisterDao dao = new RegisterDaoImpl();

		int i = dao.addRecord(reg);

		if (i > 0) {
			response.sendRedirect("login.jsp");
		} else {
			System.out.println("Error insertion!");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
