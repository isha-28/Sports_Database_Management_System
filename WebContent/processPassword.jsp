<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%@ page import="javax.swing.JOptionPane" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String npass=request.getParameter("npass");
String npassconf=request.getParameter("npassconf");
String name=(String)session.getAttribute("adminname");

try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
	String sql="Update admin set password='"+npass+"' where name='"+name+"' ;";
	PreparedStatement query=con.prepareStatement(sql);
	int rs=query.executeUpdate();
	JOptionPane.showMessageDialog(null,"Password updated successfully");
	response.sendRedirect("login.jsp");
}
catch(Exception e){
	System.out.println("exception in process password page");
}
%>
</body>
</html>