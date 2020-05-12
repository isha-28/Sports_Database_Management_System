<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Matches</title>
	<link href="logout.css" rel="stylesheet" type="text/css">
   <link href="button.css" rel="stylesheet" type="text/css">
   <link href="ani.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Merriweather" />
	<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
   	
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <style>
  
 
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   height:3%;
   width: 100%;
   background-color: black;
   color: white;
   text-align: center;
}

#text
{

  font-family: 'Merriweather';
  color:#D3D3D3;
  font-size: 15px;
  font-style:bold;
}

h2 {
  
  color: #000F00;
  text-shadow: 4px 4px 4px rgb(192,192,192);
  -webkit-background-clip: text;
     -moz-background-clip: text;
          background-clip: text;
}
#aligntable{

margin-left:auto;
margin-right:auto;
color:#ffffff;

}
div.transbox{
	margin:30px;
	margin-left:35%;
	padding:50px;
	background-color:#ffffff;
	border: 2px solid black;
	opacity:0.6;
	height:600px;
	width:500px;
}

div.transbox p
{
	color:#000000;
}
</style>
	
</head>
<body background="images/bg.jpg">
<%
	if(session.getAttribute("username")==null)
	{
		response.sendRedirect("login.jsp");
	}	
%>

<%@page import="com.sports.dao.StockDisplaydao,com.sports.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="navbar navbar-expand-sm bg-black navbar-black">
  <ul class="navbar-nav">
    <li style="margin-left: 20px">
      <img src="images/pictlogo.png" width="50" height="50" alt="">
        <li style="color:white; margin-left: 30px;"><b>
        Pune Institute of <br> Computer Technology</b>
        </li>
      </li>
  </ul>
</nav>

<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
  <span>
  <ol class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="home.jsp" style="font-size:20px;padding:2px;">Home&emsp;</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="products.jsp" style="font-size:20px;padding:2px;">Products&emsp;</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="issueret.jsp" style="font-size:20px;padding:2px;">Issued&emsp;</a>
    </li>
    <li class="nav-item  active">
      <a class="nav-link" href="matches.jsp" style="font-size:20px;padding:2px;">Matches&emsp;</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="attendance.jsp" style="font-size:20px;padding:2px;">Attendance&emsp;</a>
    </li>
    <li class="nav-item" style="color:blue">
      <a class="nav-link" href="aboutus.jsp" style="font-size:20px;padding:2px;">About Us</a>
    </li>    
  </ol>
  </span>
   <span>
     
          <p class="nav-item active" style="color:white;">
           <form action="logout" method="post">
           		<button class="button1">
           		LOGOUT
           		<i class="fas fa-sign-out-alt" style="margin-left:4px;">
           		</i>
            	</button>
            </form>
          </p>
       
   
    </span>
</nav>
<br><br>
<%
 try
{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/sports?user=vishwesh&password=root");

       Statement st = connection.createStatement() ;
%>
<div class="transbox">
	<form action="GenratePDF2" method="post">
		<center><font size="6" color="black">GENERATE REPORT</font>	
		<br><br><br><br>
		<font size="3" color="black">
		
			REPORT OF : 
			<select name="criteria" id="criteria">
			<option value="-1" diabled selected>--Sport--</option>
				<% 
                 	 resultset =st.executeQuery("select * from team") ;
                 	 while(resultset.next()){ %>
            <option 
			<%if(request.getParameter("tname")!=null)
			{
				if(resultset.getString("tname").equals(request.getParameter("tname")))
						out.print("selected");
			}
			
			%>><%= resultset.getString(2)%></option>
       		 <% } %>
			</select>
			<br><br><br><br><br><br>
			<input type="submit" value="Generate Report" style="margin-left:10%">
			</center>
		</font>
	</form>
</div>
<%
}
				
				catch(Exception e)
				{
					e.printStackTrace();
				}
				%>
<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>
</body>
</html>