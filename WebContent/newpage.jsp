<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%String recepient, otp=null; %>
<%int num=0; %>
<%@page import="com.sports.JavaMailUtil.*" %> 
<%@page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String s=request.getParameter("firstname");
System.out.println(s+" mila ab");
if(!s.equals(null))
{
	String check=s.toUpperCase();
	String emailid=null;
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
		Statement query=con.createStatement();
		ResultSet rs=query.executeQuery("select * from admin");
		int flag=0;
		while(rs.next()){
			String str=rs.getString(2);
			emailid=rs.getString(3);
			if(str.equals(check))
				{flag=1;break;}
		}
		if(flag==1)
		{
			Random random=new Random();
			int otp2=random.nextInt(1000000);
			otp=Integer.toString(otp2);
			if(otp.length()<6)
			{
				while(otp.length()<6)
					otp=otp+"0";
				System.out.println(otp);
			}
			com.sports.JavaMailUtil.sendMail(emailid,otp);
			int otpp=Integer.parseInt(otp);
			session.setAttribute("oottpp",otpp);
			session.setAttribute("adminname",s);
			response.sendRedirect("otp.jsp");
		}
	}
	catch(Exception e){
		System.out.println("Ohh Exceptions");
	}
}
%>
</body>
<script>
function validateotp()
{
	var string;
	var v=<%=otp%>;
	<%System.out.println(otp);%>
	if(v.localeCompare(otpf)==0)
		return true;
	else
	{
		alert('Invalid otp !!! Login again !');
		return false;
	}
}
</script>
</html>