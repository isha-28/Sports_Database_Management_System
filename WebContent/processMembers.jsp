<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Select Players</title>
	
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Merriweather" />
	<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
	<link href="logout.css" rel="stylesheet" type="text/css">
   <link href="button.css" rel="stylesheet" type="text/css">
    <link href="ani.css" rel="stylesheet" type="text/css">
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
	height:700px;
	width:500px;
	font-size:25px;
}

div.transbox p
{
	color:#000000;
}
</style>
	
	
</head>
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
    <li class="nav-item active">
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

 <form action="processAttendance.jsp" method="get">
 
<%
try{
	int teamid=Integer.parseInt(request.getParameter("team"));
	String tourName=request.getParameter("TourName");
	String Opponent=request.getParameter("Opponent");
	String result=request.getParameter("result");
	System.out.println(result);
	
	int res=0;
	if(result.equals("WON"))
		res=1;
	else
		res=2;
	
	tourName=tourName.toUpperCase();
	Opponent=Opponent.toUpperCase();
	
	session.setAttribute("teamid",teamid);
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
	int count=0;
	Statement query2=con.createStatement();
	ResultSet rs2=query2.executeQuery("select * from matches");
	while(rs2.next())
		count++;
	count++;
	session.setAttribute("matchid",count);
	
	Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
	PreparedStatement ps=con2.prepareStatement("insert into matches values("+count+",?,'"+tourName+"','"+Opponent+"',"+teamid+",'"+result+"');");
	java.sql.Date today=new java.sql.Date(Calendar.getInstance().getTime().getTime());
	ps.setDate(1, today);
	int c=ps.executeUpdate();
	
	Statement query=con.createStatement();
	ResultSet rs=query.executeQuery("select win, loss from team where tid="+teamid+"");
	rs.next();
	int win=rs.getInt(1);
	int loss=rs.getInt(2);
	
	if (res==1)
	{
		win++;
		PreparedStatement ps2=con2.prepareStatement("update team set win="+win+" where tid="+teamid+"");
		int c2=ps2.executeUpdate();
	}
	else
	{
		loss++;
		PreparedStatement ps2=con2.prepareStatement("update team set loss="+loss+" where tid="+teamid+"");
		int c2=ps2.executeUpdate();
	}
	
	
	ResultSet rs3=query.executeQuery("select sname from student,belongs where tid="+teamid+" and student.sid=belongs.sid");
	%>
	<div class="transbox">
	<center><font size="6" color="black">SELECT PLAYERS</font>	
	<br>
	<%
	while(rs3.next()){
		%>
		<br>
		<input type="checkbox" name="selected" value="<%=rs3.getString(1) %>">&nbsp;&nbsp;<%=rs3.getString(1) %>
		<%
	}
}
catch(Exception e){
e.printStackTrace();
	System.out.println("idhar bhi exceptions");
}
%>
<br><br>
	<input type="submit" value="Submit">
	</form>
<br><br>
</div>
<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>
</body>
</html>