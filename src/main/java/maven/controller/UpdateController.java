package maven.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import maven.dao.RegisterDao;
import maven.dao.RegisterDaoImpl;
import maven.model.Register;

/**
 * 
 * Servlet implementation class UpdateController
 * 
 */

@WebServlet("/UpdateServlet")

public class UpdateController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * 
	 * @see HttpServlet#HttpServlet()
	 * 
	 */

	public UpdateController() {

		super();

		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
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

		HttpSession session = request.getSession();

		int i = dao.updateRecord(reg);

		if (i > 0)

		{

			session.setAttribute("updatemsgsuccess", "Your Profile Updated SuccessFully ....");

			response.sendRedirect("login.jsp");

		}

		else

		{

			session.setAttribute("updatemsgerror", "Please Check Your Roll Number and Password");

			response.sendRedirect("update.jsp");

		}

	}

	/**
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub

		doGet(request, response);

	}

}