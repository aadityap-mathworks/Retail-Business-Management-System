package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Operations.Logout;

//to carry Logout
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LogoutServlet() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		//object of class Logout
		Logout lg= new Logout();
		try{
			if (request.getParameter("logout") != null) 
			{	
				//logout fuction call
				lg.logoutdone();
			 	session.invalidate();
		        response.sendRedirect("Home.jsp");
	        } 
			
		}catch (Exception e){System.out.println("Technical Error");}
		
			
	}

}
