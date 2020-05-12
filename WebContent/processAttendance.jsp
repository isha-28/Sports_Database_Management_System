<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>  
<%@page import="javax.swing.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int teamid=(Integer)session.getAttribute("teamid");
int matchid=(Integer)session.getAttribute("matchid");
System.out.println(teamid);
String[] value1=request.getParameterValues("selected");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
	Statement query=con.createStatement();
	for(int i=0;i<value1.length;i++)
	{
		ResultSet rs=query.executeQuery("select * from student where sname='"+value1[i]+"'");
		while(rs.next())
			value1[i]=rs.getString(1);
	}
	for (int i=0;i<value1.length;i++)
	{
		String sql="insert into attendance values(?,?);";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,value1[i]);
		ps.setInt(2,matchid);
		int s=ps.executeUpdate();
	}
	JOptionPane.showMessageDialog(null,"Match Entry Added !");
	response.sendRedirect("matches.jsp");
}
catch(Exception e) {
e.printStackTrace();
	System.out.println("Exceptions mile !");
}
%>
</body>
</html>