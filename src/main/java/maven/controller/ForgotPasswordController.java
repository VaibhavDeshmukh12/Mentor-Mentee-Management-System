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
import maven.model.Login;
import maven.model.Mentor;
import maven.model.Register;

/**
 * Servlet implementation class ForgotPasswordController
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String type=request.getParameter("type");
			Login log = new Login(username, password, type);

			RegisterDao dao = new RegisterDaoImpl();
			HttpSession session = request.getSession();
			if (type.equals("Mentor")) {
				int i=dao.updateMentor(log);
				if(i>0)
				{
					session.setAttribute("updatePasswordMsg","Password Updated SuccessFully ......");
					response.sendRedirect("login.jsp");
				}
				else
				{
					session.setAttribute("updatePasswordError","Invalid Username ....");
					response.sendRedirect("forgotten.jsp");
				}
				
			} else if (type.equals("Mentee")) {
			
				int i=dao.updateStudent(log);
				if(i>0)
				{
					session.setAttribute("updatePasswordMsg","Password Updated SuccessFully ......");
					response.sendRedirect("login.jsp");
				}
				else
				{
					session.setAttribute("updatePasswordError","Invalid Username ....");
					response.sendRedirect("forgotten.jsp");
				}
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
