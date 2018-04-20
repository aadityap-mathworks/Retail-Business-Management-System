package Operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.SQLException;

//to carry Log out
//resets the status value to disable for all the entries in Login Table
public class Logout {
		String errorMessage="";
		public void logoutdone()
		{
			
			try{
				//connecton to database
				Class.forName("oracle.jdbc.driver.OracleDriver");
		        String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
		        Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
		        
		        //update the status in Login Table
		        String abc1="update login set status='disable' where status='enable'";
	            PreparedStatement ps3 = conn.prepareStatement(abc1);
	            
	            //execution
	            ps3.executeUpdate();
	            
	            //close connection
	            conn.close();
	            
			}

	   catch (SQLException ex) { 
		   //error message
		   errorMessage=ex.getMessage();
		   System.out.println ("\n*** SQLException caught ***\n" + ex.getMessage());
		      }
	   catch (Exception e) {System.out.println ("\n*** other Exception caught ***\n" +e.getMessage());
	   errorMessage=e.getMessage();
	   }
			
		}

}
