package maven.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import maven.dao.RegisterDao;
import maven.dao.RegisterDaoImpl;
import maven.model.ContactModel;

/**
 * Servlet implementation class ContactController
 */
@WebServlet("/ContactServlet")

public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		int roll=Integer.parseInt(request.getParameter("roll"));
		String mentor =request.getParameter("mentor");
		String issue=request.getParameter("issue");
		
		ContactModel cm=new ContactModel(name, roll, mentor, issue);
		RegisterDao rdao=new RegisterDaoImpl();
		int i=rdao.addIssue(cm);
		if(i>0)
		{
			response.sendRedirect("login.jsp");
		}
		else
		{
			response.sendRedirect("contact.jsp");
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
