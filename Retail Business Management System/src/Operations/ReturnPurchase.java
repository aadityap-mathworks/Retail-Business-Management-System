package Operations;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.pool.OracleDataSource;

//to carry out delete purchase

public class ReturnPurchase {
	
	//takes input purchase number and returns boolenn value
	public boolean returnPurchase(String pur_no)
	{
		try
	    {

	        //Connecting to Oracle server. 
	        OracleDataSource ds = new oracle.jdbc.pool.OracleDataSource();
	        ds.setURL("jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111");
	        Connection conn = ds.getConnection("abora1", "akshay97699");
	        
	        
	        CallableStatement cs = conn.prepareCall("{call del_pur.delete_purchase(?)}");

	        //register the out parameter (the first parameter)
	        int ab=Integer.parseInt(pur_no);
  	        cs.setInt(1,ab);
  	        
	        // execute 
	        cs.execute();
	        
	        //close the statement, and the connection
	        cs.close();
	        conn.close();
	   }
		//exception handling
	   catch (SQLException ex) { System.out.println ("\n*** SQLException caught ***\n" + ex.getMessage()); 
	   return false;}
	   catch (Exception e) {System.out.println ("\n*** other Exception caught ***\n" +e.getMessage());
	   return false;}
		
		//return value
		return true;
	}
}
