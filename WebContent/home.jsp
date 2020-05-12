<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Home</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="logout.css" rel="stylesheet" type="text/css">
   <link href="button.css" rel="stylesheet" type="text/css">
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

* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;margin-left:-225px;}
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

</style>
</head>

<body background="images/bg.jpg">

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
    <li class="nav-item active">
      <a class="nav-link" href="#" style="font-size:20px;padding:2px;">Home&emsp;</a>
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

<div class="slideshow-container">

  <div class="mySlides fade">
    <div class="numbertext">1 / 7</div>
    <img src="images/img1.jpg" height="770" style="width:120%" >
    <div class="text"></div>
  </div>
  
  <div class="mySlides fade">
    <div class="numbertext">2 / 7</div>
    <img src="images/img2.jpg" height="770" style="width:120%">
    <div class="text"></div>
  </div>
  
  <div class="mySlides fade">
    <div class="numbertext">3 / 7</div>
    <img src="images/img3.jpg" height="770" style="width:120%">
    <div class="text"></div>
  </div>
  
  <div class="mySlides fade">
      <div class="numbertext">4 / 7</div>
      <img src="images/img4.jpg" height="770" style="width:120%">
      <div class="text"></div>
  </div>
  
  <div class="mySlides fade">
      <div class="numbertext">5 / 7</div>
      <img src="images/img5.jpg" height="770" style="width:120%">
      <div class="text"></div>
  </div>
  
  <div class="mySlides fade">
      <div class="numbertext">6 / 7</div>
      <img src="images/img6.jpg" height="770" style="width:120%">
      <div class="text"></div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">7 / 7</div>
    <img src="images/img7.jpg" height="770" style="width:120%">
    <div class="text"></div>
</div>
  
  </div>
  <br>
  
  <div style="text-align:center">
    <span class="dot"></span> 
    <span class="dot"></span> 
    <span class="dot"></span> 
    <span class="dot"></span> 
    <span class="dot"></span> 
    <span class="dot"></span>
    <span class="dot"></span> 
  </div>
  
  <script>
  var slideIndex = 0;
  showSlides();
  
  function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" Sactive", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " Sactive";
    setTimeout(showSlides, 4000); // Change image every 4 seconds
  }
  </script>
  

<div class="footer" style="margin-top:2px;">
  <b>Copyright
  <i class="far fa-copyright "></i>
  Pune Institute of Computer Technology</b>
</div>

</body>
</html>