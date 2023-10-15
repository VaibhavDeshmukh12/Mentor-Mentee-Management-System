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
import maven.model.Mentor;

/**
 * Servlet implementation class UpdateMentorController
 */
@WebServlet("/UpdateMentorServlet")
public class UpdateMentorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateMentorController() {
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
// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int id = Integer.parseInt(request.getParameter("id"));

		Mentor mentor = new Mentor(id, name, phone, gender, username, password, email);

		RegisterDao dao = new RegisterDaoImpl();
		int i = dao.updateMentorRecord(mentor);
		HttpSession session = request.getSession();
		if (i > 0) {
			session.setAttribute("updatemsg", "Your Profile Updated Success Fully");
			response.sendRedirect("login.jsp");
		} else {
			session.setAttribute("updatemsg", "Please Check Your Id And Password ");
			response.sendRedirect("update.jsp");

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