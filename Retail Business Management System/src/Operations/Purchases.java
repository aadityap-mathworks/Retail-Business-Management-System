package Operations;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.pool.OracleDataSource;

public class Purchases {
	public boolean addPurchase(String e_id, String p_id, String c_id, int pur_qty)
	{
		try
	    {

	        //Connecting to Oracle server
	        OracleDataSource ds = new oracle.jdbc.pool.OracleDataSource();
	        
	        ds.setURL("jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111");
	        Connection conn = ds.getConnection("abora1", "akshay97699");
	        //Prepare to call stored procedure:
	        CallableStatement cs = conn.prepareCall("{call add_pur.add_purchase(?,?,?,?)}");

           //register the out parameter (the first parameter)
  	        String ab=e_id;
  	        cs.setString(1,ab);
            
  	        String abc=p_id;
            cs.setString(2,abc);

            String abc1=c_id;
            cs.setString(3,abc1);
            
            int abc2=pur_qty;
            cs.setInt(4, abc2);
            
	        // execute and retrieve the result set
	        cs.execute();
	        
	        //close the result set, statement, and the connection
	        cs.close();
	        conn.close();
	   }
		//exception handling
	   catch (SQLException ex) { System.out.println ("\n*** SQLException caught ***\n" + ex.getMessage());
	   return false;}
	   catch (Exception e) {System.out.println ("\n*** other Exception caught ***\n" +e.getMessage());
	   return false;}
		return true;
	}

}
