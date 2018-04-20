<!-- Supplier details page -->

<!--  importing packages -->
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
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Suppliers Details|Gheun Tak</title>
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
	
  <div class="logo">
	<img alt="Logo" src="gheun-tak.png" width=100% height=100%>
  </div>
  
  <div class="left">
  </div>
  <div class="right">
  </div>
  
  <div class="middle">
  	<br>
 	<center><h1><font size="23" color="#268f9b">SUPPLIER DETAILS</font></h1></center>
 	<br>
 	<!-- table formatting -->
	<table id="customers" >
	 <thead>
            <tr>
                <th>SID</th>
                <th>NAME</th>
                <th>CITY</th>
                <th>TELEPHONE</th>
                <th>EMAIL</th>
            </tr>
        </thead>
        <tbody>

			<!-- using post method  on action -->
            <%
          	//connection to database
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
            Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");

            //Prepare to call stored procedure  
            CallableStatement c4 = conn.prepareCall("begin ? := get_details.getsuppliers(); end;");
       	    c4.registerOutParameter(1, OracleTypes.CURSOR);

       		//exection 
            c4.execute();
            ResultSet rs = (ResultSet)c4.getObject(1);
            while(rs.next()){
            %>
            <tr>
                <%
                    String SID = rs.getString(1);
                    String NAME = rs.getString(2);
                    String CITY = rs.getString(3);
                    String TELEPHONE = rs.getString(4);
                    String EMAIL = rs.getString(5);
                %>
                
				 <!-- table entries -->
                <td><%=SID %></td>
               <td><%=NAME %></td>
               <td><%=CITY%></td>
               <td><%=TELEPHONE %></td>
               <td><%=EMAIL %></td>
            </tr>               

            <%      
                }
         	 //close connection and statement
               c4.close();
               conn.close(); 
            %>

        </tbody>
    </table>
  </div>
</div>


</body>
</html>
