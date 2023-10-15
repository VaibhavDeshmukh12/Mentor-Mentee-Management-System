package maven.controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class DisplayStud
 */
@WebServlet("/noaction")
public class DisplayStud extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DisplayStud() {
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
		RegisterDao dao = new RegisterDaoImpl();
		System.out.println(name);
		List<Register> list = dao.displayAllStud(name);
		HttpSession session = request.getSession();
		if (!list.isEmpty()) {
			session.setAttribute("data", list);
			response.sendRedirect("displayStud.jsp");
		} else {
			String mssg="Sorry,You don't have Any Student Records..";
			session.setAttribute("mssg",mssg);
			response.sendRedirect("displayNull.jsp");
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
