<!-- Login page -->
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
<title>Login|Gheun Tak</title>
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
  
    <h1 align="center"><b><font size="23" color="#268f9b">LOGIN HERE</font></b></h1>
    
	<!-- java code to display details -->
    <font color="red" size="5"><%
    String error= (String) session.getAttribute("invalidusr");
    System.out.print(error);
    if(error != null && !error.isEmpty())
    {
    	out.print("Invalid username or password");
    }
   
    %></font>
    <!-- using post method  on action -->
	<form action="LoginServlet" method="post">
    <label><b><font size="5">Username</font></b></label>
    <input type="text" placeholder="Enter Username" name="userId" required>

    <label><b><font size="5">Password</font></b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit" class="login" >Login</button>
    <button type="reset" class="cancel">Cancel</button>
 
	 <a href="Register.jsp"> New User?</a></span>
	</form>
  </div>
</div>


</body>
</html>
