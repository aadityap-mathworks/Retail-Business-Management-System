package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Operations.ReturnPurchase;

//servlet to return purchase
@WebServlet("/ReturnPurchaseServlet")
public class ReturnPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ReturnPurchaseServlet() {
        super();
        }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		HttpSession session = request.getSession();
		String pur_no =request.getParameter("pur2#");
		session.setAttribute("pur2#", pur_no);
		if(pur_no != null && !pur_no.isEmpty())
		{
			//object of class ReturnPurchase
			ReturnPurchase rp= new ReturnPurchase();
			if(rp.returnPurchase(pur_no))//call return purchase
			{
				//redirects to SuccessfulReturn page
				RequestDispatcher rs= request.getRequestDispatcher("SuccessfulReturn.jsp");
				rs.forward(request, response);
			}
			else
			{
				//redirects to returnpurchase page
				RequestDispatcher rs= request.getRequestDispatcher("ReturnPurchase.jsp");
				rs.forward(request, response);
				System.out.println("Can not return purchase");
			}
			
		}
		else
		{	
			//set session attribute
			session.setAttribute("No Puchase to return", "No Purchase");
			RequestDispatcher rs= request.getRequestDispatcher("PurchaseForCustDetails.jsp");
			rs.forward(request, response);
			session.removeAttribute("No Puchase to return");
		}
		
	}

}
