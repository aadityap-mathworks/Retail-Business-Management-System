<!-- cutomer view page -->
<!-- customer can add, view or delete purchase -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- linkin style sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Customer View|Gheun Tak</title>
<!-- formatiing for info bar-->
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
<!-- using div class page to divide page -->
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
  
  <!-- welcome message -->
  <h1 align="left"><b><font size="8" color="#268f9b">Welcome <%out.print(session.getAttribute("userId")); %></font></b></h1>
  	<form action="LogoutServlet" method="post">
	<h6 align="right"><input type="submit" name="logout" value="Logout"></h6>
	</form>
	<!-- usein post method of CustomerViewServleton action -->
	<form action="CustomerViewServlet" method="post"  >
	
	<table align="center">
		<!-- input actions -->
		<tr>
			<td><input type="submit" name="addpur" value="Purchase" class="glass2" style="width:100%" ></td>
			<td><input type="submit" name="viewpur" value="View Purchases" class="glass2" style="width:100%" ></td>
			<td><input type="submit" name="retpur" value="Return Purchase" class="glass2" style="width:100%" ></td>
		</tr>
	</table>
	
	</form>

</div>

</body>
</html>

