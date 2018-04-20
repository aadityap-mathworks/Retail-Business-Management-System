<!-- Monthly sale details page -->

<!--  importing packages -->
<%@page import="Operations.Customer"%>
<%@page import="java.sql.CallableStatement" %>
<%@page import="java.sql.*" %>
<%@page import="oracle.jdbc.internal.OracleTypes" %>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.io.InputStreamReader" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Linking styles sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Monthly Sale|Gheun Tak</title>
<!-- formatting for information bar -->
<style>
ul {
    list-style-type: none;
    margin-left:10;
    padding: 0;
    overflow: hidden;
}

li {
    float: left;
}

li a {
    display: block;
    color: black;
    text-align: center;
    padding: 10px;
    text-decoration: none;
}
</style>
</head>
<body>
<!-- using div to divide page -->
<div class="page">
	<!-- information bar -->
	<div class="info">
		<ul>
            <li><a href="#"><i class="material-icons" style="font-size:12px">&#xe567;</i>Binghamton, NY</a>
            </li>
            <li><a href="#">&#9990;+1(607)245-4353</a>
            </li>
            <li><a href="#">&#x2709;info@gheuntak.in</a>
            </li>
        </ul>
	</div>
	<!-- to insert logo -->	
  <div class="logo">
	<img alt="Logo" src="gheun-tak.png" width=100% height=100%>
  </div>
  
  <div class="left">
  </div>
  <div class="right">
  </div>
  
  <div class="middle">
  <br>
 	<center><h1><font size="23" color="#268f9b">MONTHLY SALE</font></h1></center>
 	<br>
 	<!-- table formatting -->
	<table id="customers" >
        <thead>
            <tr>
                <th>EID</th>
                <th>NAME</th>
                <th>MONTH</th>
                <th>TOTAL_TRAN</th>
                <th>TOTAL_QTY</th>
                <th>TOTAL_SALE</th>
            </tr>
        </thead>
        <tbody>

			<!-- java code to display details -->
            <%
          //connection to database
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
            Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
               
            //Prepare to call stored procedure:
            CallableStatement cs = conn.prepareCall("begin ? := monthly_sales.monthly_sale_activity(?); end;");
            //register the out parameter (the first parameter)
            cs.registerOutParameter(1, OracleTypes.CURSOR);

            // Input gpg threshold from keyboard
            BufferedReader  br= new BufferedReader(new InputStreamReader(System.in));;
            String emp = (String) session.getAttribute("userId");
            if(emp.equalsIgnoreCase("admin"))
            {	
            	 String emp2=(String) session.getAttribute("eid");
            	 cs.setString(2, emp2);
            }
            else
            {
            	cs.setString(2, emp);
            }
            
			
            // execute and retrieve the result set
            cs.execute();
            ResultSet rs = (ResultSet)cs.getObject(1);

            // print the results
                   	        
               while(rs.next()){
            %>
            <tr>
                <%
                    String EID = rs.getString(1);
                    String NAME = rs.getString(2);
                    String MONTH = rs.getString(3);
                    String TOTAL_TRAN = rs.getString(4);
                    String TOTAL_QTY = rs.getString(5);
                    String TOTAL_SALE = rs.getString(6);
                %>
                <td><%=EID %></td>
               <td><%=NAME %></td>
               <td><%=MONTH%></td>
               <td><%=TOTAL_TRAN %></td>
               <td><%=TOTAL_QTY %></td>
               <td><%=TOTAL_SALE %></td>
            </tr>               

            <%      
                }
             //close the result set, statement, and the connection
               cs.close();
               conn.close();
            %>

        </tbody>
    </table>
  </div>
</div>


</body>
</html>
