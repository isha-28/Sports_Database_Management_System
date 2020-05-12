<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.swing.JOptionPane" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	try{
		int otp= (Integer) session.getAttribute("oottpp");
		String otpvalue=request.getParameter("otpvalue");
		int otpval=Integer.parseInt(otpvalue);
		System.out.println(otp+" "+otpvalue);
		System.out.println("otp++otpvalue");
		if(otp==otpval)
		{
			response.sendRedirect("resetPassword.jsp");
		}
		else
		{
			JOptionPane.showMessageDialog(null,"Invalid OTP!");
			response.sendRedirect("login.jsp");
		}
	}
	catch(Exception e){
		System.out.println("haga yrr ");	
	}	
	%>
</body>
</html>