<!-- purchase page to make purchase-->
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
<!-- Linking styles sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Purchase|Gheun Tak</title>
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
 	<center><h1><font size="23" color="#268f9b">PURCHASE</font></h1></center>
 	
	<!-- java code to display details -->
 	<font color="red" size="5"><%
    String error= (String) session.getAttribute("qoh message");
    System.out.print(error);
    if(error != null && !error.isEmpty())
    {
    	out.print(error);
    }
   
    %></font>
    <br>
 	<h1><font size="5" color="#268f9b">Select Product</font></h1>
 	<form action="PurchaseServlet" method="post">
	<table id="customers" >
	<thead>
            <tr>
                <th>PID</th>
                <th>NAME</th>
                <th>QOH</th>
                <th>ORIG_PRICE</th>
                <th>DISNT_CATEGORY</th>
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
       		CallableStatement c1 = conn.prepareCall("begin ? := get_details.getproducts(); end;");
	       	
            c1.registerOutParameter(1, OracleTypes.CURSOR);
          //exection
            c1.execute();
            ResultSet rs = (ResultSet)c1.getObject(1);
               
               while(rs.next()){
            %>
            <tr>
                <%
               		//variables
                    String PID = rs.getString(1);
                    String NAME = rs.getString(2);
                    String QOH = rs.getString(3);
                    String ORIG_PRICE = rs.getString(5);
                    String DISNT_CATEGORY = rs.getString(6);
                %>
                <td><input type="radio" name="pid" value="<%=PID %>" required="required"> <%=PID %></td>
               <td><%=NAME %></td>
               <td><%=QOH%></td>
               <td><%=ORIG_PRICE %></td>
               <td><%=DISNT_CATEGORY %></td>
            </tr>               

            <%      
                }
             //close connection and statement
               c1.close();
               conn.close();
            %>

        </tbody>
    </table>
    
    <h1><font size="5" color="#268f9b">Select Quantity (Limited to 30)</font></h1>
    <!-- drop to select quantity -->
    <select name="qty" id="qty" style="width:100px;" >
	  <option value="1">1</option>
	  <option value="2">2</option>
	  <option value="3">3</option>
	  <option value="4">4</option>
	  <option value="5">5</option>
	  <option value="6">6</option>
	  <option value="7">7</option>
	  <option value="8">8</option>
	  <option value="9">9</option>
	  <option value="10">10</option>
	  <option value="11">11</option>
	  <option value="12">12</option>
	  <option value="13">13</option>
	  <option value="14">14</option>
	  <option value="15">15</option>
	  <option value="16">16</option>
	  <option value="17">17</option>
	  <option value="18">18</option>
	  <option value="19">19</option>
	  <option value="20">20</option>
	  <option value="21">21</option>
	  <option value="22">22</option>
	  <option value="23">23</option>
	  <option value="24">24</option>
	  <option value="25">25</option>
	  <option value="26">26</option>
	  <option value="27">27</option>
	  <option value="28">28</option>
	  <option value="29">29</option>
	  <option value="30">30</option>
	</select>
	<br>
	<br>
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

		<h1><font size="5" color="#268f9b">Select Employee</font></h1>
			
			<!-- java code to display details -->
            <%
          //connection to database
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url2="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
            Connection conn2= DriverManager.getConnection(url, "abora1","akshay97699");
                
         	 //Prepare to call stored procedure
               CallableStatement c = conn2.prepareCall("begin ? := get_details.getemployees(); end;");

                
               c.registerOutParameter(1, OracleTypes.CURSOR);
             	//exection 
				c.execute();
               ResultSet rs2 = (ResultSet)c.getObject(1);
              
               while(rs2.next()){
            %>
            <tr>
                <%
                    String id = rs2.getString(1);
                    String name = rs2.getString(2);
                    String tel = rs2.getString(3);
                    String mail = rs2.getString(4);
                %>
                <td><input type="radio" name="eid" value="<%=id %>"required="required"> <%=id %></td>
               <td><%=name %></td>
               <td><%=tel%></td>
               <td><%=mail %></td>
            </tr>               

            <%      
                }
               c.close();
               conn2.close();
            %>

        </tbody>
    </table>
    <br>
	<input type="submit" class="glass" name="purchasemade" value="Purchase" style="padding: 15px 20px;">
	    
    </form>
  </div>
</div>


</body>
</html>
