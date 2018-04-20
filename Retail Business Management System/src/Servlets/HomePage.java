package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Operations.Customer;

@WebServlet("/HomePage")
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public HomePage() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			//request session
			HttpSession session= request.getSession();
			
			//remove session attribute
			session.removeAttribute("add customer error");
			
			//if login is clicked 
			if (request.getParameter("login") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("Login.jsp");
				rs.forward(request, response);
	        } 
			//if registration button is clicked
			else if (request.getParameter("reg") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("Register.jsp");
				rs.forward(request, response);
	        } 
	       
		}catch (Exception e){System.out.println("technuical error");}
		
	}

}
