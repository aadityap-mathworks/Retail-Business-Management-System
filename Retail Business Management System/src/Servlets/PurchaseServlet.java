package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Operations.Purchases;
import Operations.ReturnPurchase;
import Operations.ValidateQOH;

@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int qoh;
	int qth;
	int qnow;
	
    public PurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	//doPost method to take input and redirect to pages
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		//remove session attributes
		session.removeAttribute("qoh message");
		session.removeAttribute("threshold");
		session.removeAttribute("threshold Back");
		session.removeAttribute("new_qoh");
		
		//variables
		String pur_qty;
		int qty = 0;
		String e_id= request.getParameter("eid");
		String p_id= request.getParameter("pid");
	
		pur_qty =request.getParameter("qty");
		qty = Integer.parseInt(pur_qty);
		
		//object of calss ValidateQOH
		ValidateQOH vq= new ValidateQOH();
		
		//call to fuction get QOH
		qoh= vq.QOH(p_id);
		
		//check if qoh is more than the quantity
		if(qoh>=qty)
		{
			
			String c_id= (String) session.getAttribute("userId");
			Purchases rp= new Purchases();
			
			//call to get threshold quantity
			qth=vq.QTH(p_id);
			
			//current value of quantity
			qnow=qoh-qty;
			
			//check if threshold value is reached
			if(qth>=qnow)
			{
				//set session attribute
				session.setAttribute("threshold", "Current Available Quantity of the product is below the required threshold and new supply is required.");
				
				if(rp.addPurchase( e_id,  p_id,  c_id,  qty)) // fuction call to add purchase
				{
					qth=vq.QTH(p_id);
					qoh= vq.QOH(p_id);
					
					if(qth<qoh)
					{	
						//new supply order
						session.setAttribute("threshold Back", "We Have Ordered New Supply. Happy Shopping!");
						session.setAttribute("new_qoh",qoh);
					}
					
					RequestDispatcher rs= request.getRequestDispatcher("SuccessfulPurchase.jsp");
					rs.forward(request, response);
				}
				else
				{
					System.out.println("Can not add purchase");
				}
				
			}
			
			
			else
			{
				//fuction call to add purchase
				if(rp.addPurchase( e_id,  p_id,  c_id,  qty))
				{
					RequestDispatcher rs= request.getRequestDispatcher("SuccessfulPurchase.jsp");
					rs.forward(request, response);
				}
			}
			
			
		}
		else
		{	
			session.setAttribute("qoh message", "Insufficient Quantity Available");
			RequestDispatcher rs= request.getRequestDispatcher("Purchase.jsp");
			rs.forward(request, response);
		}
		
		
		
		
		
	}

}
