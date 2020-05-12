<%@page import="com.sports.dao.StockDisplaydao,java.sql.*,javax.swing.JOptionPane"%>
<jsp:useBean id="u" class="com.sports.ReturnDisp"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
String sid=request.getParameter("studentid");
String pid=request.getParameter("productid");
String issuestring=request.getParameter("issuestring");

StockDisplaydao.return_from_issues(sid, pid, issuestring);
JOptionPane.showMessageDialog(null,"Product Returned!");

response.sendRedirect("issueret.jsp");
%>