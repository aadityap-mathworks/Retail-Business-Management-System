<!-- Customer Details page to view customer details -->
<!-- importing packages -->
<%@page import="Operations.Customer"%>
<%@page import="java.sql.CallableStatement" %>
<%@page import="java.sql.*" %>
<%@page import="oracle.jdbc.internal.OracleTypes" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- linking style sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Customer Details|Gheun Tak</title>
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
<!-- using to div tag to divide page -->
<div class="page">
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
	
	<!-- to inser logo -->
  <div class="logo">
	<img alt="Logo" src="gheun-tak.png" width=100% height=100%>
  </div>
  
  <div class="left">
  </div>
  <div class="right">
  </div>
  <!-- to set the content in the middle -->
  <div class="middle">
  <br>
 	<center><h1><font size="23" color="#268f9b">CUSTOMER DETAILS</font></h1></center>
 	<br>
 	<!-- table to display customer details -->
	<table id="customers" >
        <thead>
            <tr>
                <th>CID</th>
                <th>NAME</th>
                <th>TELEPHONE</th>
                <th>VISITS_MADE</th>
                <th>LAST_VISIT</th>
            </tr>
        </thead>
        <tbody>

			<!-- java code to display details -->
            <%
            //connection to database
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
            Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
               
            CallableStatement c3 = conn.prepareCall("begin ? := get_details.getcustomers(); end;");
	        c3.registerOutParameter(1, OracleTypes.CURSOR);
	        //execute query
	        c3.execute();
	        ResultSet rs = (ResultSet)c3.getObject(1);
	        
               while(rs.next()){
            %>
            <tr>
                <%
                    String CID = rs.getString(1);
                    String NAME = rs.getString(2);
                    String TELEPHONE = rs.getString(3);
                    String VISITS_MADE = rs.getString(4);
                    String LAST_VISIT = rs.getString(5);
                %>
                <td><%=CID %></td>
               <td><%=NAME %></td>
               <td><%=TELEPHONE%></td>
               <td><%=VISITS_MADE %></td>
               <td><%=LAST_VISIT %></td>
            </tr>               

            <%      
                }
               //close the connection
               c3.close();
 	          conn.close();
            %>

        </tbody>
    </table>
  </div>
</div>


</body>
</html>
