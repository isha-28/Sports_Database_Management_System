<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<script src="htpps://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="selectfilter.min.js"></script>
  <script src="https://codepen.io/username/pen/aBcDef"></script>

  <style>
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   height:4%;
   width: 100%;
   background-color: black;
   color: white;
   text-align: center;
}

.dropbtn {
  background-color:black;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: white;
  background-color:black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: white;
  color:black;
}

</style>
</head>
<body background="/home/vinay/mini pro/backgrounds/wall.jpg">

<nav class="navbar navbar-expand-sm bg-black navbar-black">
  <ul class="navbar-nav">
    <li style="margin-left: 20px">
      <img src="/home/vinay/mini pro/backgrounds/logo-removebg-preview.png" width="50" height="50" alt="">
        <li style="color:white; margin-left: 30px;">
        Pune Institute of <br> Computer Technology
        </li>
    </li>
    <li style="margin-left: 125vh;">
      <button style="background-color: black ; border-style: none; padding: 5px; margin-top: 10px; border-radius: 5px">
      <li class="nav-item active" style="color:white;">
        Logout
        <i class="fas fa-sign-out-alt" style="margin-left:4px;">
        </i>
      </li>
    </button>
    </li>
  </ul>
</nav>

<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
  <ol class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Products</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Issue</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Team</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Attendance</a>
    </li>
    <li class="nav-item" style="color:blue">
      <a class="nav-link" href="#">About Us</a>
    </li>    
  </ol>
</nav>

<form action="IssueServlet" >
  
  <label>State:</label>
 <select class="form-control input-lg" name="state" id="state">
 	<option value="-1" disabled selected>--Select State--</option>
 	
 </select>
  Quantity:
  <input type="text" name="qty" placeholder="0" autocomplete="off" required><br><br>
  <input type="submit" value="submit"><br>
</form>

<div class="footer" style="margin-top:2px;">
  <i class="far fa-copyright "></i>
</div>

</body>
</html>