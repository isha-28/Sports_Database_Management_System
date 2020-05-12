<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<title>Login</title>
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

          <div class="fadeIn fifth">
           <p style="color:black; font-size:30px;"><b>
           LOGIN</b></p>
          </div>

        <form action="AddServlet" >
              <i class="fa fa-user icon" style="size:50px">
              <input type="text" id="login" class="fadeIn second" name="login" placeholder="Username" autocomplete="off">
              </i>
              <i class="fa fa-lock icon">
              <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password" autocomplete="off">
              </i>
              <br> <br> 
              <input type="submit" class="fadeIn fourth"  value="Log In">
        </form>
        <br>
              <a class="underlineHover" style="margin-left:-35px;" href="ForgotPassword.jsp">FORGOT PASSWORD?</a>
              
			<a class="underlineHover" style="margin-left: 200px;" href="signup.jsp">SIGN UP</a>
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