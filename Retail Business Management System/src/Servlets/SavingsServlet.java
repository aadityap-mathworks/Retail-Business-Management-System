package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//to view savings of a purchase
@WebServlet("/SavingsServlet")
public class SavingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SavingsServlet() {
        super();
    }

    //doPost method to redirect to savings page
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		
		String pur_no =request.getParameter("pur#");
		
		if(pur_no != null && !pur_no.isEmpty())
		{
			//set session attribute
			session.setAttribute("pur#", pur_no);
			RequestDispatcher rs= request.getRequestDispatcher("Savings.jsp");
			rs.forward(request, response);
			
		}
		else
		{	
			//set session attribute
			session.setAttribute("No Puchase", "No Purchase");
			RequestDispatcher rs= request.getRequestDispatcher("PurchaseForCustDetails.jsp");
			rs.forward(request, response);
			session.removeAttribute("No Puchase");
		}
	}

}
