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

/**
 * Servlet implementation class DeleteStud
 */
@WebServlet("/delete")
public class DeleteStud extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteStud() {
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
		int id = Integer.parseInt(request.getParameter("roll"));
		RegisterDao dao = new RegisterDaoImpl();
		boolean f = dao.deleteStudent(id);
		HttpSession session = request.getSession();
		if (f) {
			String message = "Student Details Delete Successfully";
			session.setAttribute("susmsg", message);
			response.sendRedirect("profileMentor.jsp");
		} else {
			String errormsg = "Something Wrong";
			session.setAttribute("errmsg", errormsg);
			response.sendRedirect("profileMentor.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		int id=Integer.parseInt(request.getParameter("roll"));
//		RegisterDao dao=new RegisterDaoImpl();
//		HttpSession session=request.getSession();
//		
//		boolean f=dao.deleteStudent(id);
//		if(f)
//		{
//			String message="Student Details Delete Successfully";
//			session.setAttribute("susmsg",message);
//			response.sendRedirect("displayStud.jsp");	
//		}
//		else
//		{
//			String errormsg="Something Wrong";
//			session.setAttribute("errmsg",errormsg);
//			response.sendRedirect("displayStud.jsp");
//		}
//	}

	}
}