<!-- purchase status page  -->
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
<title>Successful Purchase|Gheun Tak</title>
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
 	<center>   
	<h1><font size="23" color="#268f9b">Congratulations.!</font></h1>
	<h1><font size="23" color="#268f9b">Successful Purchase.!</font></h1>
	<br>
	<!-- java code to display details -->
	<font color="red" size="5"><%
    String error= (String) session.getAttribute("threshold");
    if(error != null && !error.isEmpty())
    {
    	out.print(error);
    }
   
    %></font>
    <br>
    <!-- java code to display details -->
    <font color="Blue" size="5"><%
    String message= (String) session.getAttribute("threshold Back");
    if(message != null && !message.isEmpty())
    {	
         	out.print(message);
        	out.print("\n Now the quantity is "+session.getAttribute("new_qoh"));
        
    }
    %></font>
     
  	<h3><a href="PurchaseForCustDetails.jsp">Click here to view other purchases.!!</a></h3>
  	<h3><a href="CustomerView.jsp">Click here to view Customer Home.!!</a></h3>
  	</center>
  </div>
</div>


</body>
</html>
