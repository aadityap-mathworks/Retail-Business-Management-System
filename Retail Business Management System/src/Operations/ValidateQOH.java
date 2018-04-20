package Operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//to get the QOH and Q_threshold from products table
//takes input pid and returns QOH
public class ValidateQOH {
	
	//to calculate QOH
	public int QOH(String p_id)
	{
		
		String errorMessage=null;
		int qoh = 0;
		
		try{	
				//connection to database
				Class.forName("oracle.jdbc.driver.OracleDriver");
		        String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
		        Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
		        
		        //query and execution
		        PreparedStatement p=conn.prepareStatement("select qoh from products where pid=?");
	            p.setString(1,p_id);
	            ResultSet rs1 = p.executeQuery();
	            while(rs1.next())
	            {
	            	qoh= rs1.getInt(1);
	            
	            }
	            
	            //close the connections
	            rs1.close();
	            conn.close();
	            
	            //return qoh
	            return qoh;
            
		}
		//excetion handling
		catch (SQLException ex) { 
			   errorMessage=ex.getMessage();
			   System.out.println ("\n*** SQLException caught ***\n" + ex.getMessage());
			   return 0;
			   }
		   catch (Exception e) {System.out.println ("\n*** other Exception caught ***\n" +e.getMessage());
		   errorMessage=e.getMessage();
		   return 0;}
		
		
	}
	
	//to calculate Q_threshold
	public int QTH(String p_id)
	{
		
		String errorMessage=null;
		int qth = 0;
		
		try{
				//connection to databse
				Class.forName("oracle.jdbc.driver.OracleDriver");
		        String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
		        Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
		        
		        //query and execution
		        PreparedStatement p=conn.prepareStatement("select qoh_threshold from products where pid=?");
	            p.setString(1,p_id);
	            ResultSet rs1 = p.executeQuery();
	            while(rs1.next())
	            {
	            	qth= rs1.getInt(1);
	            
	            }
	            
	            //close the connection and resultset
	            rs1.close();
	            conn.close();
	            return qth;
            
		}//exception handling
		catch (SQLException ex) { 
			   errorMessage=ex.getMessage();
			   System.out.println ("\n*** SQLException caught ***\n" + ex.getMessage());
			   return 0;
			   }
		   catch (Exception e) {System.out.println ("\n*** other Exception caught ***\n" +e.getMessage());
		   errorMessage=e.getMessage();
		   return 0;}
		
		
	}
	
}


