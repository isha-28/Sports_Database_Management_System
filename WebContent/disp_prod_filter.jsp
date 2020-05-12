<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Products</title>
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
padding: 6px; 
margin-top: 0px; 
margin-left: 280px; 
border-radius: 5px; 
height: 40px;
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
margin-left: 120px; 
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

.button4{
background-color: #dddddd;
border-style: none; 
padding: 10px; 
margin-top: 0px; 

border-radius: 5px; 
height: 50px;
font-color : white;
}
.button4:hover {
  background-color: lightgray;
  -webkit-box-shadow: 0 10px 30px 0 #dddddd;
  box-shadow: 0 10px 30px 0 #dddddd;
}

.button4:active{
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
   width:100%;
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
</style>
	
	
</head>
<body background="images/bg.jpg">
<div class="container-fluid">
<%@page import="com.sports.dao.StockDisplaydao,com.sports.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	if(session.getAttribute("username")==null)
	{
		response.sendRedirect("login.jsp");
	}	
%>

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
    <li class="nav-item active">
      <a class="nav-link" href="products.jsp" style="font-size:20px;padding:2px;">Products&emsp;</a>
    </li>
    <li class="nav-item">
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
<br><br>

<h1 style="color:lightgray;size:30"><center>PRODUCTS LIST</center></h1>
 
  <form action="trans_log.jsp">
  <button class="button2">
  		VIEW LOG
  </button>
  </form>
<%
    try
{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/sports?user=vishwesh&password=root");

       Statement statement = connection.createStatement() ;
%>
<div style="margin-left:80%; margin-top:-1.5%;">
	<form  action="disp_prod_filter.jsp" method="post">
		<font size="3" color="black">
                <select name="filterList" id="filterList" class="filterList" onchange="this.form.submit()">
                    <option value="-1" disabled selected>Filter By</option>
                   	<% 
                   	 resultset =statement.executeQuery("select * from sport_data") ;
                   	 while(resultset.next()){ %>
		            <option ><%= resultset.getString(2)%></option>
		       		 <% } %>
                </select>
			 <br>
		</font>
	</form>
</div>
<br><br>
<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }

String id_start=null;
int flag=0;
     try
{
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/sports?user=vishwesh&password=root");
		
		String sport=request.getParameter("filterList");
		System.out.println(sport);
		if(sport.equals("All"))
		{
			flag=1;
		}
		
       Statement st = connection.createStatement() ;
		ResultSet rs=st.executeQuery("select * from sport_data where sp_name='"+sport+"'");
		rs.next();
		id_start=rs.getString("id");
		}
      catch(Exception e)
      {
           out.println("wrong entry"+e);
      }  
   if(flag==1)
   {
	   List<Product> list=ProductDao.getAllRecords();
	   request.setAttribute("list",list);
   }
   else
   {
List<Product> list=ProductDao.getAllRecords_filter(id_start);
request.setAttribute("list",list);
   }
		
%>

<table border="2" width="80%">
<tr bgcolor="white"><th >Sport</th><th>Name</th><th>Quantity</th></tr>
<c:forEach items="${list}" var="u">
	<tr bgcolor="lightgray"><td >${u.getSport()}</td><td>${u.getName()}</td><td>${u.getQuantity()}</td></tr>
</c:forEach>
</table>


<br><br>

<!-- <form action="update_product.jsp">
  <button class="button3">
  		Update Product
  </button>
  </form>

<form action="add_product.jsp">
  <button class="button4">
  		Add New Product
  </button>
  </form>
 -->
 
 <div class="row">
 
 <div class="col-lg-4">
 </div>
 
 <div class="col-lg-2">
 <form action="update_product.jsp">
  <button class="button3">
  		Update Product
  </button>
 </form>
 </div>
  <div class="col-lg-2">
 <form action="add_product.jsp">
  <button class="button4">
  		Add New Product
  </button>
  </form> 
 </div>
 
 </div>
 
<br><br><br>
<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>
</div>

</body>
</html>