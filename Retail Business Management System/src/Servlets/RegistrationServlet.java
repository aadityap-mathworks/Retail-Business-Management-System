package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Operations.Customer;

//servlet to carry out registration of a customer
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrationServlet() {
        super();
    }

	//do Post method to fetch all the inputs from jsp and redirecting to pages
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session= request.getSession();
		String CustID=request.getParameter("CustID");
		String cname = request.getParameter("cname");
		String telephone=request.getParameter("tele");
		String pwd = request.getParameter("pwd");
		String cpwd = request.getParameter("cpwd");

		//check if customer if id is empty
		if(CustID != null && !CustID.isEmpty())
		{	
			//to check password matches
			if(!pwd.equals(cpwd))	
			{
				session.setAttribute("add customer error", "Password did not match");
				RequestDispatcher rd= request.getRequestDispatcher("Register.jsp");
				rd.forward(request, response);
			}
			//format of cutomer id
			else if(!CustID.startsWith("c"))
			{
				session.setAttribute("add customer error", "Invalid Customer Id format");
				RequestDispatcher rd= request.getRequestDispatcher("Register.jsp");
				rd.forward(request, response);
			}
			else
			{	
				//fuction call to add customer 
				if(Customer.addCustomer(CustID, cname, telephone,pwd))
				{
					RequestDispatcher rd= request.getRequestDispatcher("RegSuccess.jsp");
					rd.forward(request, response);
				}
				else
				{
					//set session attribute
					session.setAttribute("add customer error", "Customer id is unavailable");
					RequestDispatcher rd= request.getRequestDispatcher("Register.jsp");
					rd.forward(request, response);
				}
			}	
		}	
				
		
		
		
	}

}
