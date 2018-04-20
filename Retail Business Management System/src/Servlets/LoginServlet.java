package Servlets;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Operations.Validation;

//Servlet for login validation
//validate username and password
//validates type of user
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			HttpSession session=request.getSession();
			String userId=request.getParameter("userId");
			String password=request.getParameter("password");
			
			// set userId attribute
			session.setAttribute("userId",userId);
			
			//remove session attribute
			session.removeAttribute("add customer error");
			
			//object of class validation
			Validation vd= new Validation();
			
			//check if user id is blank
			if(userId != null && !userId.isEmpty())
			{
				if(vd.validateLogin(userId, password))
				{
					//admin	
					if(userId.equalsIgnoreCase("admin"))
					{
						RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
						rd.forward(request, response);
					}
					//customers
					else if (userId.startsWith("c")) 
					{
						RequestDispatcher rd=request.getRequestDispatcher("CustomerView.jsp");
						rd.forward(request, response);
					}
					//employees
					else if (userId.startsWith("e")) 
					{
						System.out.println("LoginServlet.doPost()");
						RequestDispatcher rd=request.getRequestDispatcher("EmployeeView.jsp");
						rd.forward(request, response);
					}
				}
				else
				{
					//invalid user message to jsp
					session.setAttribute("invalidusr", "Invalid Username or Password");
					RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
					session.setAttribute("invalidusr", "");
				}
			}
			
	}

}
