<!-- Home Page 
User can Login or Register-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- linking to style sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Home|Gheun Tak</title>
<!-- to format information bar -->
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
<!-- using division to divide page -->
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
  
  <br><br><br><br>
	<h1 align="center"><b><font size="23" color="#268f9b">Welcome to Gheun Tak Online Mart</font></b></h1>
	 <br>
	 
	  <!-- on action use post method of HomePage Servlet-->
	<form action="HomePage" method="post">
	<p align="center">
   		<input type="submit" class="glass" name="login" value="LOGIN" size="50">&nbsp;&nbsp;&nbsp;      
   		<input type="submit" class="glass" name="reg" value="REGISTER" size="50">
   </form>
    	  
</div>


</body>
</html>

