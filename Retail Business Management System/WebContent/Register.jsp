<!-- registration page for new customes -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Linking styles sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="LoginPage.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Registration|Gheun Tak</title>
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
	
  <div class="logo">
	<img alt="Logo" src="gheun-tak.png" width=100% height=100%>
  </div>
  
  <div class="left">
  </div>
  <div class="right">
  </div>
  
  <div class="middle" >
	<p align="center">    
	<!-- using post method  on action -->
	<form action="RegistrationServlet" method="post">
	<br>
 	<center><h1><font size="23" color="#268f9b">LOG DETAILS</font></h1></center>
	<p align="center"><font size="6" color="#268f9b">Fill the following form</font></p>
	<br>
	<!-- java code to display details -->
	 <font color="red" size="5"><%
    String error= (String) session.getAttribute("add customer error");
    System.out.print(error);
    if(error != null && !error.isEmpty())
    {
    	out.print(error);
    }
   
    %></font>
    <br>
    <!-- inputs -->
	<label><b><font size="5">Customer ID (eg.c234)</font></b></label>
    <input type="text" placeholder="Enter Customer ID" name="CustID" required pattern="[a-z]{1}\d{3}">

    <label><b><font size="5">Name</font></b></label>
    <input type="text" placeholder="Enter Name" name="cname" required>
    
    <label><b><font size="5">Telephone No.(XXX-XXX-XXXX)</font></b></label>
    <input type="text" placeholder="Enter Telephone No." name="tele" required  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
    
    <label><b><font size="5">Email (xxx@domain.xxx)</font></b></label>
    <input type="text" placeholder="Enter email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
    
    <label><b><font size="5">Set Password</font></b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
    
    <label><b><font size="5">Confirm Password</font></b></label>
    <input type="password" placeholder="Confirm Password" name="cpwd" required>
    
        
    <button type="submit" class="login" >Register</button>
    <button type="reset" class="cancel">Cancel</button>

	</form>
  </div>
</div>


</body>
</html>

