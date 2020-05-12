<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.JOptionPane" %>
<%ResultSet resultset =null;%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
</head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Product</title>
     <link href="logout.css" rel="stylesheet" type="text/css">
   <link href="button.css" rel="stylesheet" type="text/css">
      <link href="ani.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
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

* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: black;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.Sactive {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 0.5s;
  animation-name: fade;
  animation-duration: 3.99s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
div.transbox{
	margin:30px;
	margin-left:35%;
	padding:50px;
	background-color:#ffffff;
	border: 2px solid black;
	opacity:0.6;
	height:680px;
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

<script type="text/javascript">

function getConfirmation()
{
	var value=confirm("Are you sure you want to update?");
	if(value==true)
		return true;
	
	else
		return false;	
}

</script>

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

<br>


<%
    try
{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");

       Statement statement = connection.createStatement() ;

      
%>
				<div class="transbox">
                    <form  action="UpdateProducts" method="post" onsubmit="return getConfirmation()">
                   <center> <font size="5" color="black">UPDATE PRODUCT</font></center>
                    <br>
                			<font size="3" color="black">     
                			
                                <label for="sportList">Sport :</label> 
                                <select name="sportList" id="sportList" class="sportList" onchange="var v=getval()">
                                <option value="-1" disabled selected>--Select sport--</option>
                                	<% 
                                	 resultset =statement.executeQuery("select * from sport_data") ;
                                	while(resultset.next()){ %>
							            <option 
										<%if(request.getParameter("sp_name")!=null)
										{
											if(resultset.getString("sp_name").equals(request.getParameter("sp_name")))
													out.print("selected");
										}
										
										%>><%= resultset.getString(2)%></option>
							        <% } %>
                                </select>
                          		
                            	<!-- <button class="btn btn-outline-primary" type="button" onclick="var v=getval()">Check Products</button> -->
                       			 
                       			 <br>
                       			 <br>
                       			 <label for="productList">Select product :</label>
                       			 <br>
                       			 <select name="productList" id="productList" onchange=" ar v=getval2()">
	                       			 <option value="-1" disabled>--Select product--</option>
	                       			 <%
	                       			 	String sp_name=request.getParameter("sp_name");
	                       			 System.out.println("name is "+sp_name);
                       					
                       					 request.getSession().setAttribute("sporty",sp_name);
	                       					 
	                       			Statement st=connection.createStatement();
	                       			ResultSet rs1 =st.executeQuery("select * from sport_data where sp_name='"+sp_name+"' ") ;
	                       			rs1.next();
	                       			String sport_id=rs1.getString("id");
	                       			System.out.println("id aya:"+sport_id);
	                       		
	                       			
	                       			Statement st2=connection.createStatement();
	                       			ResultSet rs2 =st.executeQuery("select * from product where pid like '"+sport_id+"%' ") ;
	                            	while(rs2.next()){ %>
							            <option><%= rs2.getString(2)%></option>
							        <% }
	                       			 %>    
                       			 </select>
                       			 <%
	                   
                       			String p_name=request.getParameter("p_name");
                      			 System.out.println("Product name is "+p_name);
	                  
                       				Statement st3=connection.createStatement();
	                       			ResultSet rs3 =st.executeQuery("select * from product where pid like '"+sport_id+"%' and pname like '"+p_name+"%'") ;
	                       			rs3.next();
	                       			
	                       		%>  
	                       		
                       			 <br><br>	
                   
                       			 
                       			 Quantity :
                       			 <br>
                       			 <input type="text" name="qty" id="qty" placeholder="0" style="width:200px; height:5px;" required></input>
                       			 
                       			 <br><br>
                       			 
                       			 Price :
                       			 <br>
                       			 <input type="text" name="price" id="price" placeholder="During adding" style="width:200px; height:5px;" required></input>
                       			
                       			 <br><br><br>
                       			 <input type="submit" name="add_prod" value="Add Product" style="margin-left:17%;">
                			     <input type="submit" name="dlt_prod" value="Delete Product" style="margin-left:15%;">
                         </font>
                         </form>
                         </div>
<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>
</body>
<script type="text/javascript">

function getval()
{
	var id=document.getElementById("sportList");
	var sp_name=id.options[id.selectedIndex].text;
	localStorage.setItem(id,sp_name);
	
	window.location.replace("update_product.jsp?sp_name="+sp_name);
	
	return cname;
}
function getval2()
{
	var id2=document.getElementById("productList");
	var p_name=id2.options[id2.selectedIndex].text;
	localStorage.setItem(id2,p_name);
	console.log("taddaa");
	console.log(p_name);
	window.location.replace("update_product.jsp?p_name="+p_name+"&&sp_name="+sp_name);
	
	return cname;
}
      
</script>

</html>