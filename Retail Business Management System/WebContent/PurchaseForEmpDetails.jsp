<!-- Purchase details for employee -->
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
<!-- Linking styles sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Purchase Details|Gheun Tak</title>
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
 	<center><h1><font size="23" color="#268f9b">PURCHASE DETAILS</font></h1></center>
 	<br>
	<table id="customers" >
  	<thead>
            <tr>
                <th>PUR#</th>
                <th>EID</th>
                <th>PID</th>
                <th>CID</th>
                <th>QTY</th>
                <th>PTIME</th>
                <th>TOTAL_PRICE</th>
            </tr>
        </thead>
        <tbody>
			<!-- java code to display details -->
            <%
            //connection to database
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
            Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
            String id= (String) session.getAttribute("userId");
          //Prepare to call stored procedure
            PreparedStatement p=conn.prepareStatement("select * from purchases where eid= ?");
            p.setString(1,id);
            
            ResultSet rs = p.executeQuery();
            while(rs.next()){
            %>
            <tr>
                <%	//variables
                    String PUR = rs.getString(1);
                    String EID = rs.getString(2);
                    String PID = rs.getString(3);
                    String CID = rs.getString(4);
                    String QTY = rs.getString(5);
                    String PTIME = rs.getString(6);
                    String TOTAL_PRICE = rs.getString(7);
                %>
                <!-- table entries -->
                <td><%=PUR %></td>
               <td><%=EID %></td>
               <td><%=PID%></td>
               <td><%=CID %>
               <td><%=QTY %></td>
               <td><%=PTIME %></td>
               <td><%=TOTAL_PRICE %></td>
            </tr>               

            <%      
                }
          //close connection and statement
              rs.close();
 	          conn.close();
            %>

        </tbody>
    </table>
  </div>
</div>


</body>
</html>
