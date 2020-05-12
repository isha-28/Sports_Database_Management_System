<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%@page import="java.util.*" %>
<%@page import="com.sports.JavaMailUtil.*" %> 
<%@page import="javax.swing.JOptionPane" %>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Attendance</title>
	
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
<%
String id=request.getParameter("att");
System.out.println(id+" ");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
	Statement query=con.createStatement();
	
	ResultSet rs=query.executeQuery("select count(sid) from attendance where sid='"+id+"'");
	rs.next();
	int count = rs.getInt(1);
	
	java.sql.Date abs[]=new java.sql.Date[count];
	int mid[]=new int[count];
	int i=0;
	
	ResultSet rs2=query.executeQuery("select distinct match_id from attendance where sid='"+id+"'");
	while(rs2.next())
	{
		mid[i++]=rs2.getInt(1);
	}
	
	for(int j=0;j<count;j++){
		ResultSet rs3=query.executeQuery("select match_date from matches where match_id="+mid[j]+"");
		rs3.next();
		abs[j]=rs3.getDate(1);
	}
	String dates=abs[0].toString();
	for( int j=1;j<count;j++)
		dates=dates+", "+abs[j];
	
	String emailid=null, msg=null, div=null;

	ResultSet rs4=query.executeQuery("select sname,class,rollno from student where sid='"+id+"'");
	rs4.next();
	div=rs4.getString(2);
	String name=rs4.getString(1);
	int rollno=rs4.getInt(3);
	
	ResultSet rs5=query.executeQuery("select email from cc where class='"+div+"'");
	rs5.next();
	emailid=rs5.getString(1);
	
	msg="Good Day Sir/Madam ! This is to inform you that "+name+", Roll No."+rollno+" of your class was absent on the following dates playing matches for the college team ! The dates are :"+dates;
	
	com.sports.JavaMailUtil.sendMail1(emailid,msg);
	JOptionPane.showMessageDialog(null,"Attendance Sent Successfully !");
	response.sendRedirect("markAttendance.jsp");

}
catch(Exception e){
	e.printStackTrace();
	System.out.println("nahi gaya mail!");
}

%>
<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>
</body>
</html>