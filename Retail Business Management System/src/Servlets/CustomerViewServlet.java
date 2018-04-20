package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet for customer View page
//redirects to respectiive page depending on the input
@WebServlet("/CustomerViewServlet")
public class CustomerViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CustomerViewServlet() 
    {
        super();
    }

	//post method to check inputs and redirect to respective page
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//redirects to purchase page if add purchase is clicked
		if (request.getParameter("addpur") != null) 
		{
			RequestDispatcher rs= request.getRequestDispatcher("Purchase.jsp");
			rs.forward(request, response);
        } //redirects to PurchaseForCustDetails if view purchase is clicked
		else if (request.getParameter("viewpur") != null) 
		{
			RequestDispatcher rs= request.getRequestDispatcher("PurchaseForCustDetails.jsp");
			rs.forward(request, response);
        } //redirects to ReturnPurchase if return purchase is clicked
		else if (request.getParameter("retpur") != null) 
		{
			RequestDispatcher rs= request.getRequestDispatcher("ReturnPurchase.jsp");
			rs.forward(request, response);
        }
	}

}
