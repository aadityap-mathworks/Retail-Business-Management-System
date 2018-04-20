package Operations;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// to carry out validation of username and password from Login Table
//
public class Validation {

	public boolean validateLogin(String userName, String pwd)
	{ 
		String errorMessage=null;
		String correctuser;
		
		try{
			//connection to database
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
	        Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
	        
	      //query and execution
	        String abc1="update login set status='disable' where status='enable'";
            PreparedStatement ps3 = conn.prepareStatement(abc1);
            ps3.executeUpdate();
            
            //query and execution
	        PreparedStatement p=conn.prepareStatement("select status from login where username= ? and password=?");
            p.setString(1,userName);
            p.setString(2,pwd);
            ResultSet rs1 = p.executeQuery();
            while(rs1.next())
            {
            	correctuser= (String) rs1.getString(1);
            	System.out.println(correctuser);
            	if(correctuser.equals("enable")||correctuser.equals("disable"))
            	{
            		//query
                    String abc2="update login set status=? where username=?";
                    PreparedStatement ps2 = conn.prepareStatement(abc2);
                    
                    //inputs
                    ps2.setString  (1, "enable");
                    ps2.setString(2, userName);
                    
                    // execute and retrieve the result set
                    ps2.executeUpdate();
                    
                    //close the result set, statement, and the connection
                    ps2.close();
                    rs1.close();
                    conn.close();
                    
                    //return value
            		return true;
            	}
            }
            //close connection and resulset
            rs1.close();
            conn.close();
            
		}

		catch (SQLException ex) { //exception handling
	   errorMessage=ex.getMessage();
	   System.out.println ("\n*** SQLException caught ***\n" + ex.getMessage());
	   return false;
	   }
   catch (Exception e) {System.out.println ("\n*** other Exception caught ***\n" +e.getMessage());
   errorMessage=e.getMessage();
   return false;}
		
		return false;
			
	}
}
