package com.sports;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import java.time.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


/**
 * Servlet implementation class IssueServlet
 */
@WebServlet("/IssueServlet")
public class IssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("yuhu");
		String sid=request.getParameter("sid");
		System.out.println(sid);
		String sport=(String)request.getSession().getAttribute("sporty");
		System.out.println(sport);
		
		String pdct=request.getParameter("productList");
		String pdct1=pdct.replaceAll(" - ", ";");
		System.out.println(pdct1);
		String product=pdct1.substring(0, pdct1.indexOf(';'));
		
		int qty=Integer.parseInt(request.getParameter("qty"));
		System.out.println(qty+"");
		
		Date date=Calendar.getInstance().getTime(); 
		String id_start=null;
		
		try
		{
			if(qty<=0)
			{
				JOptionPane.showMessageDialog(null,"Please enter valid quantity!");
				RequestDispatcher rd=request.getRequestDispatcher("/issueret.jsp");
				
				rd.forward(request, response);	
				return;
				
			}
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
			
			Statement st3=con.createStatement();
			System.out.println(1);
			
			ResultSet rs3=st3.executeQuery("select id from sport_data where sp_name='"+sport+"' ");
			rs3.next();
			id_start=rs3.getString("id");
			System.out.println(product);
			System.out.println(id_start);
			
			Statement st=con.createStatement();
			System.out.println(1);
			ResultSet rs1=st.executeQuery("select pid from ava_product where pname='"+product+"' && pid like '"+id_start+"%' ");
			System.out.println(2);
			rs1.next();
//			if(rs1.equals(null))
//			{
//				System.out.println("Enter valid data");
//			}
			System.out.println(100);
			String pid=rs1.getString(1);
			System.out.println(pid);
			System.out.println(4);
			java.sql.Date date2=new java.sql.Date(date.getTime());
		   
			try {
				 System.out.println(3);
				PreparedStatement st2=con.prepareStatement("insert into issues(pid,sid,issuedate,qty) values(?,?,?,?)");
				 System.out.println(5);
				 
				st2.setString(1,pid);
				 System.out.println(5);
				st2.setString(2,sid);
				 System.out.println(6);
				st2.setDate(3,date2);
				 System.out.println(7);
				st2.setInt(4,qty);
				 System.out.println(8);
				st2.executeUpdate();
				 System.out.println(9);
				System.out.println("executed!!");
				JOptionPane.showMessageDialog(null,"Product Issued Successfully!");
				response.sendRedirect("issueret.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("whops");
				JOptionPane.showMessageDialog(null,"Required quantity not available!");
				response.sendRedirect("issue.jsp");
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	

}