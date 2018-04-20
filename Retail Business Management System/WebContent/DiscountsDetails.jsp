<!-- pageg to display discount details -->
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
<!-- style sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Discount Details|Gheun Tak</title>
<!-- information bar formatting -->
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
<!-- page division  -->
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
 	<center><h1><font size="23" color="#268f9b">DISCOUNT DETAILS</font></h1></center>
 	<br>
	<table id="customers" >
		<thead>
            <tr>
                <th>D_CATEGORY</th>
                <th>D_RATE</th>
            </tr>
        </thead>
        <tbody>

		<!-- java code to display detials -->
            <%
            //connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
            Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
              
            //calable statement
            CallableStatement c7 = conn.prepareCall("begin ? := get_details.getdiscounts(); end;");
	       	 
            c7.registerOutParameter(1, OracleTypes.CURSOR);
          	//execution
            c7.execute();
            ResultSet rs = (ResultSet)c7.getObject(1);
               while(rs.next()){
            %>
            <tr>
                <%
                    String D_CATEGORY = rs.getString(1);
                    String D_RATE = rs.getString(2);
                %>
                <td><%=D_CATEGORY %></td>
               <td><%=D_RATE %></td>
             </tr>               

            <%      
                }
               c7.close();
               conn.close();
            %>

        </tbody>
    </table>
  </div>
</div>


</body>
</html>
