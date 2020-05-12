<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Attendance</title>
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
table {
  /* font-family: Times New Roman ,serif; */
  border-collapse: collapse;
  width: 70%;
  margin-left:280px;
}

td {
  border: 2px solid black;
  padding: 9px;
  font-size:25px;
  text-align: center;
  /* font-family: Times New Roman ,serif; */
}

th {
  border: 2px solid black;
  padding: 8px;
  font-size:30px;
  color:black;
  background-color: lightgray;
  text-align: center;
  font-family: Times New Roman ,serif;
}

tr:nth-child(even) {
  color:black;
  background-color: darkgray;
  font-size:20px;
}

tr:nth-child(odd) {
  background-color: #dddddd;
  color:black;
  font-size:20px;
}
.button1{
background-color: #dddddd;
border-style: none; 
padding: 6px; 
margin-top: 3px; 
margin-left: 1000px; 
border-radius: 5px; 
height: 40px;
font-color : white;

}
.button1:hover {
  background-color: lightgray;
  -webkit-box-shadow: 0 10px 30px 0 #dddddd;
  box-shadow: 0 10px 30px 0 #dddddd;
}

.button1:active{
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

</style>
	
	
</head>
<script type="text/javascript">

function getConfirmation()
{
	var value=confirm("Are you sure you want to mark attendance?");
	if(value==true)
		return true;
	
	else
		return false;	
}

</script>
<%
	if(session.getAttribute("username")==null)
	{
		response.sendRedirect("login.jsp");
	}	
%>

<body background="images/bg.jpg">

<%@page import="com.sports.dao.StockDisplaydao,com.sports.AttendanceDisplay,java.util.*,java.sql.*"%>
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
    <li class="nav-item">
      <a class="nav-link" href="matches.jsp" style="font-size:20px;padding:2px;">Matches&emsp;</a>
    </li>
    <li class="nav-item active">
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
<table id="" style="margin-top:3vh; margin-bottom:3vh; align:center;">
<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Class</th>
		<th>Attendance</th>
	</tr>
	
	<%
	try
	{
		String[] val;
		int i=0;
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
		Statement query=null;
		
		query=con.createStatement();
		ResultSet rs=query.executeQuery("select count(distinct sid) from attendance");
		rs.next();			
		int count=rs.getInt(1);
		val=new String[count];
		
		
		Statement query2=con.createStatement();
		ResultSet rs2=query2.executeQuery("select distinct sid from attendance");
		while(rs2.next())
			val[i++]=rs2.getString(1);
		
		
		for (int j=0;j<val.length;j++){
			Statement query3=con.createStatement();
			ResultSet rs3=query3.executeQuery("select * from student where sid='"+val[j]+"'");
			while(rs3.next())
			{
				%>
				<form name="frm" action="sendAttendance.jsp" >
				<tr>
				
				<td><%=rs3.getString(1)%></td>
				<td><%=rs3.getString(2)%></td>
				<td><%=rs3.getString(3)%></td>
				<th><button type="submit" name="att" id="att" value="<%=rs3.getString(1)%>" onclick="location.href='sendAttendance.jsp'">Mark Attendance</button></th>
				</tr>
				</form>
				<%
			}
		}
	}
	catch(Exception e)
	{
		System.out.println("lol errors bhi hai !!");
	}
	%>	
</table>

<br><br>

<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>
</body>
</html>