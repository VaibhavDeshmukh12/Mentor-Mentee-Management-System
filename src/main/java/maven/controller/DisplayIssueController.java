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
import maven.model.ContactModel;

/**
 * Servlet implementation class DisplayIssueController
 */
@WebServlet("/IssueServlet")
public class DisplayIssueController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayIssueController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RegisterDao rdao=new RegisterDaoImpl();
		String name = request.getParameter("name");
		List<ContactModel> lst=rdao.displayIssues(name);
		HttpSession session=request.getSession();
		if(!lst.isEmpty())
		{
			session.setAttribute("issue", lst);
			response.sendRedirect("displayissue.jsp");
		}
		else
		{
			String error="Sorry,You Don't have Student Complaints";
			session.setAttribute("error",error);
			response.sendRedirect("displayNull.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
