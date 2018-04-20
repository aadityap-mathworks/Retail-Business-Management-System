package Operations;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//to add a new entry in Login table
//add username and password
//updates the status column of Login Table
public class Customer 
{

	public static boolean addCustomer(String cid, String name, String tel, String pwd) 
	{
		String errorMessage = null;
		try{
			//connection 
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
	        Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
	        
	        //query and execution
	        String abc1="update login set status='disable' where status='enable'";
            PreparedStatement ps3 = conn.prepareStatement(abc1);
            ps3.executeUpdate();
            ps3.close();
            //Prepare to call stored procedure:
            String query ="call ins_login.add_login(?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString  (1, cid);
            ps.setString(2, pwd);
            ps.executeUpdate();
            //close the result set, statement, and the connection
            ps.close();
            
            String abc="update login set status=? where username=?";
            PreparedStatement ps1 = conn.prepareStatement(abc);
            ps1.setString  (1, "enable");
            ps1.setString(2, cid);
            
            // execute and retrieve the result set
            ps1.executeUpdate();
            
            //close the result set, statement, and the connection
            ps1.close();
             
            conn.close();
      
       
	        Connection conn1= DriverManager.getConnection(url, "abora1","akshay97699");
	        
	        //Prepare to call stored procedure:
	        CallableStatement cs = conn1.prepareCall("{call add_cust.add_customer(?,?,?)}");

           //register the out parameter (the first parameter)

	        cs.setString(1,cid);
	        cs.setString(2,name);       
	        cs.setString(3,tel);
	        // execute and retrieve the result set
	        cs.execute();
	        System.out.println("New customer registered");
	  
	
	        //close the result set, statement, and the connection
	        cs.close();
	        conn1.close();
       
       
	        Connection conn2= DriverManager.getConnection(url, "abora1","akshay97699");
           
	        String abc2="update login set status=? where username=?";
	        PreparedStatement ps2 = conn2.prepareStatement(abc2);
	        ps2.setString  (1, "disable");
	        ps2.setString(2, cid);
           
           // execute and retrieve the result set
           ps2.executeUpdate();
           
           //close the result set, statement, and the connection
           ps2.close();
            
           conn2.close();
     
   }
	//exception handling
   catch (SQLException ex) { 
	   errorMessage=ex.getMessage();
	   System.out.println ("\n*** SQLException caught ***\n" + ex.getMessage());
	   return false;
	   }
   catch (Exception e) {System.out.println ("\n*** other Exception caught ***\n" +e.getMessage());
   errorMessage=e.getMessage();
   return false;}
		
			return true;
		
		
		
	}

}
