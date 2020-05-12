<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<title>Sign up</title>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="ani.css" rel="stylesheet" type="text/css">
  <link href="ani.less" rel="stylesheet/less" type="test/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}
</style>
</head>
<body background="images/bg.jpg">

<nav class="navbar navbar-expand-sm bg-black navbar-black">
  <ul class="navbar-nav">
    <li style="margin-left: 20px">
      <img src="images/pictlogo.png" width="50" height="50" alt="">
        <li style="color:white; margin-left: 30px;"><b>
        Pune Institute of <br> Computer Technology</b>
        <li style="color:#dddddd; margin-left: 270px; font-size:50px;"><b>
        S</b>ports&nbsp;&nbsp;<b>M</b>anagement&nbsp;&nbsp;<b>S</b>ystem
        </li>
        </li>
      </li>
  </ul>
</nav>

<br> <br> <br> <br> 
 <div class="white-panel fadeInDown">
      <div class="wrapper fadeInDown">
        <div id="formContent">
        	<form action="login.jsp">
        	
        		<button type=submit" class="close"><i class="fa fa-close"></i></button>
        	</form>
         <div class="fadeIn fifth">
           <p style="color:black; font-size:30px;"><b>
           SIGN UP</b></p>
          </div>
        <form action="SignupServlet" >
            
              <i class="fa fa-user icon" style="size:50px">
              <input type="text" id="uname" class="fadeIn second" name="uname" placeholder="Username" autocomplete="off" required>
              </i>
			<br>
			  <i class="fa fa-envelope icon" style="size:50px">
              <input type="text" id="email" class="fadeIn  third" name="email" placeholder="Email" autocomplete="off" required>
              </i>
			<br>
				<i class="fa fa-lock icon" style="size:50px">
             	 <input type="password" id="psw" class="fadeIn  third" name="psw" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" autocomplete="off" required>
             	 </i>
			<br>
			      <i class="fa fa-lock icon" style="size:50px">
             	 <input type="password" id="psw-repeat" class="fadeIn  third" name="psw-repeat" placeholder="Confirm Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" autocomplete="off" required>
             	 </i>
			<br><br>
              <input type="submit" class="fadeIn fourth"  value="Sign Up">
        </form>
              

        </div>
      </div>
    </div>
    
 <ul class="bg-bubbles">
 	<li></li>
 	<li></li>
 	<li></li>
 	<li></li>
 	<li></li>
 	<li></li>
 	<li></li>
 	<li></li>
 	<li></li>
 	<li></li>
 </ul>
<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>

</body>
</html>