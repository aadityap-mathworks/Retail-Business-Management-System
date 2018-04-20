<!-- employee details page -->
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
<!-- styles sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Employee Details|Gheun Tak</title>
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

	<!-- to inser logo -->	
  <div class="logo">
	<img alt="Logo" src="gheun-tak.png" width=100% height=100%>
  </div>
  
  <div class="left">
  </div>
  <div class="right">
  </div>
  
  <div class="middle">
  
 	<br>
 	<center><h1><font size="23" color="#268f9b">EMPLOYEES DETAILS</font></h1></center>
 	<br>
 	<!-- using post method of EmployeeViewServlet on action -->
 	<form action="EmployeeViewServlet" method="post">
	<table id="customers" >
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Company</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tbody>

			<!-- java code to display details -->
            <%
            //connection to database
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
            Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
                
         	 //Prepare to call stored procedure
               CallableStatement c = conn.prepareCall("begin ? := get_details.getemployees(); end;");

               c.registerOutParameter(1, OracleTypes.CURSOR);
             //exection 
               c.execute();
               ResultSet rs = (ResultSet)c.getObject(1);
              
               while(rs.next()){
            %>
            <tr>
                <%
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    String tel = rs.getString(3);
                    String mail = rs.getString(4);
                %>
                <td><input type="radio" name="eid" value="<%=id %>" required="required"> <%=id %></td>
               <td><%=name %></td>
               <td><%=tel%></td>
               <td><%=mail %></td>
            </tr>               

            <%      
                }
               c.close();
               conn.close();
            %>

        </tbody>
        <tr>
        <td colspan="4" rowspan="2"><button type="submit" name="Get Monthly Sale">Get Monthly Sale</button>
        </td>
        </tr>
    </table>
    
    </form>
  </div>
</div>


</body>
</html>
