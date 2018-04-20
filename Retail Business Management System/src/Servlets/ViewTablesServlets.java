package Servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.jdbc.OracleTypes;
import oracle.jdbc.pool.OracleDataSource;

//servlet to view the table depending on the input
@WebServlet("/ViewTablesServlets")
public class ViewTablesServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ViewTablesServlets() {
        super();
        
    }
    
    //doPost method to redirect to pages according to the inputs
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			
		HttpSession session=request.getSession();
		try{
			//to view employee details
			if (request.getParameter("getemp") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("EmployeeDetails.jsp");
				rs.forward(request, response);
	        }
			//to view customer details
			else if (request.getParameter("getcust") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("CustomersDetails.jsp");
				rs.forward(request, response);
	        } 
			//to view product details
			else if (request.getParameter("getprod") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("ProductsDetails.jsp");
				rs.forward(request, response);
	        }
			//to view discount details
			else if (request.getParameter("getdisc") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("DiscountsDetails.jsp");
				rs.forward(request, response);
	        }
			//to view purchase details
			else if (request.getParameter("getpur") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("PurchaseDetails.jsp");
				rs.forward(request, response);
	        }
			//to view suppliers details
			else if (request.getParameter("getsuppliers") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("SuppliersDetails.jsp");
				rs.forward(request, response);
	        }
			//to view supplies details
			else if (request.getParameter("getsupplies") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("SuppliesDetails.jsp");
				rs.forward(request, response);
	        }
			//to view logs details
			else if (request.getParameter("getlogs") != null) 
			{
				RequestDispatcher rs= request.getRequestDispatcher("LogsDetails.jsp");
				rs.forward(request, response);
	        }
		}// to handle exceptions
		catch (Exception e){System.out.println("Technical Error");}
	

	}

}
