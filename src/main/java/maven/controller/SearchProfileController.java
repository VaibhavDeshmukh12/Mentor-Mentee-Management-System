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
import maven.model.Register;

/**
 * Servlet implementation class SearchProfileController
 */
@WebServlet("/SearchServlet")
public class SearchProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roll=Integer.parseInt(request.getParameter("roll"));
		String mentor=request.getParameter("mentor");
		Register reg=new Register();
		List<Register> lst=new ArrayList<Register>();
		RegisterDao dao=new RegisterDaoImpl();
		lst=dao.searchStudent(roll,mentor);    
		HttpSession session=request.getSession();
		if(!lst.isEmpty())
		{
			session.setAttribute("search",lst);
			response.sendRedirect("SearchProfile.jsp");
		}
		else
		{
			String mssg="Record Not Found";
			session.setAttribute("mssg", mssg);
			response.sendRedirect("displayStud.jsp");
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
