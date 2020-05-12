<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="com.sports.dao.StockDisplaydao,com.sports.ReturnDisp,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Issued List</title>
	<link href="logout.css" rel="stylesheet" type="text/css">
   <link href="button.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Merriweather" />
	<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
   	
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <style>
  
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

.button2{
background-color: #dddddd;
border-style: none; 
padding-top:-15px;
margin-top: 0px; 
margin-left: 0px; 
border-radius: 5px; 
height: 50px;
font-color : white;

}
.button2:hover {
  background-color: lightgray;
  -webkit-box-shadow: 0 10px 30px 0 #dddddd;
  box-shadow: 0 10px 30px 0 #dddddd;
}

.button2:active{
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

.button3{
background-color: #dddddd;
border-style: none;
padding-top:-15px;
margin-top: 0px; 
margin-left: 50px; 
border-radius: 5px; 
height: 50px;
font-color : white;

}
.button3:hover {
  background-color: lightgray;
  -webkit-box-shadow: 0 10px 30px 0 #dddddd;
  box-shadow: 0 10px 30px 0 #dddddd;
}

.button3:active{
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}
 
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
  margin-left:300px;
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
  font-size:25px;
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

</style>
	
	
</head>
<body background="images/bg.jpg">
<div class="container-fluid">

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
    <li class="nav-item  active">
      <a class="nav-link" href="issueret.jsp" style="font-size:20px;padding:2px;">Issued&emsp;</a>
    </li>
    <li class="nav-item">
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
<br><br><br>
		
 <div class="row">
 
 <div class="col-lg-4">
 </div>
 
 <div class="col-lg-3">
 <form action="issue.jsp">
  <button class="button2">
  		ISSUE PRODUCT
  </button>
 </form>
 </div>
  <div class="col-lg-2">
 <form action="show_ret.jsp">
  <button class="button3">
  		VIEW RETURNED
  </button>
  </form> 
 </div>
 
 </div>
          
		<br><br><br>
		<%
		List<ReturnDisp> list=StockDisplaydao.displayissued();
		request.setAttribute("list",list);		
		%>
		<div id="aligntable">
		<table border="1" width="100%">
		
		<tr><th>Issue-Date</th><th>Student ID</th><th>Student Name</th><th>Sport Name</th><th>Product Name</th><th>Quantity</th><th>Return</th></tr>
		<c:forEach items="${list}" var="u">
			<tr><td>${u.getIssuestring()}</td><td>${u.getStudentid()}</td><td>${u.getStudentname()}</td><td>${u.getSportname()}</td><td>${u.getProductname()}</td><td>${u.getQuantity()}</td><td><a href="ret.jsp?studentid=${u.getStudentid()}&productid=${u.getProductid()}&issuestring=${u.getIssuestring()}">Return </a></td></tr>		
		</c:forEach>
		

		</table>
		</div>
		
<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>
</div>
</body>
</html>
