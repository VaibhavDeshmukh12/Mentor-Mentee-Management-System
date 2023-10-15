package maven.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import maven.dao.RegisterDao;
import maven.dao.RegisterDaoImpl;
import maven.model.Login;
import maven.model.Mentor;
import maven.model.Register;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/loginServlet")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		Login log = new Login(username, password, type);

		RegisterDao dao = new RegisterDaoImpl();
		HttpSession session = request.getSession();
		if (type.equals("Mentor")) {
			List<Mentor> mlist = dao.validateMentor(log);
			if(!mlist.isEmpty())
			{
				session.setAttribute("ment", mlist);
				response.sendRedirect("profileMentor.jsp");
			}
			else
			{
				session.setAttribute("loginerror","Login Failed ! Invalid Credentials ...");
				response.sendRedirect("login.jsp");
				
			}
		} else if (type.equals("Mentee")) {
			List<Register> list = dao.validateMentee(log);
			if(!list.isEmpty())
			{
				session.setAttribute("data", list);
				response.sendRedirect("profile.jsp");
			}
			else
			{
				session.setAttribute("loginerror","Login Failed ! Invalid Credentials ...");
				response.sendRedirect("login.jsp");
			}
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
