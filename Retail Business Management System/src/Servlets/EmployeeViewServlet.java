package Servlets;

import java.io.IOException;
import java.nio.channels.SeekableByteChannel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//servlet for employee page
@WebServlet("/EmployeeViewServlet")
public class EmployeeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmployeeViewServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			HttpSession session = request.getSession();
			String eid=request.getParameter("eid");
			
			//set attribute
			session.setAttribute("eid", eid);
			
		try{
			
			//check if admin
			if(eid!=null)
			{
				System.out.println("EmployeeViewServlet.doPost()");
				RequestDispatcher rs= request.getRequestDispatcher("MonthlySale.jsp");
				rs.forward(request, response);
			}
			else
			{	//get mothly sale
				if (request.getParameter("getmonthlysale") != null) 
				{
					RequestDispatcher rs= request.getRequestDispatcher("MonthlySale.jsp");
					rs.forward(request, response);
		        } 
				//het purchase for employee
				else if (request.getParameter("getpurofemp") != null) 
				{
					RequestDispatcher rs= request.getRequestDispatcher("PurchaseForEmpDetails.jsp");
					rs.forward(request, response);
		        } 
				//get products details
				else if (request.getParameter("getprod") != null) 
				{
					RequestDispatcher rs= request.getRequestDispatcher("ProductsDetails.jsp");
					rs.forward(request, response);
		        }
				//get discount details
				else if (request.getParameter("getdisc") != null) 
				{
					RequestDispatcher rs= request.getRequestDispatcher("DiscountsDetails.jsp");
					rs.forward(request, response);
		        }
			}
			
		}catch (Exception e){System.out.println("Technical Error");}
		
		
	}

}
