package com.sports;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class AddProducts
 */
@WebServlet("/AddProducts")
public class AddProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("yuhu");
		String sport=(String)request.getSession().getAttribute("sporty");
		System.out.println(sport);
		String product=request.getParameter("product");
		System.out.println(product);
		int qty=Integer.parseInt(request.getParameter("qty"));
		System.out.println(qty+"");
		int flag=0;
		String id_start=null;
		
		
		try
		{
			if(qty<=0)
			{
				JOptionPane.showMessageDialog(null,"Please enter valid quantity!");
				RequestDispatcher rd=request.getRequestDispatcher("/update_product.jsp");
				
				rd.forward(request, response);	
				return;
				
			}
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from sport_data where sp_name='"+sport+"' ");
			
			rs.next();
			id_start=rs.getString("id");
			
			Statement st1=con.createStatement();
			ResultSet rs1=st1.executeQuery("select * from product where pid like '"+id_start+"%'");
			
			while(rs1.next())
			{
				if(product.equalsIgnoreCase(rs1.getString("pname")))
				{
					JOptionPane.showMessageDialog(null,"Product already exists in database!!");
					flag=1;
					response.sendRedirect("update_product.jsp");
				}
			}
			
			if(flag==0)
			{
				Statement st4=con.createStatement();
				ResultSet rs4=st4.executeQuery("select count(pid) from product where pid like '"+id_start+"%'");
				rs4.next();
				int count=rs4.getInt(1);
				System.out.println(count);
				
				count++;
				String start=null;
				if(count>=10)
				{
					start=new StringBuilder().append(count).toString();
				}
				else
				{
					start=new StringBuilder().append(0).append(count).toString();
				}
				id_start=id_start.concat(start);
				System.out.println(id_start);
				
				PreparedStatement st5=con.prepareStatement("insert into trans_log(tdate,sport,product,qty,price,action) values(current_date,?,?,?,?,'Added')");
				st5.setString(1,request.getParameter("sportList"));
				st5.setString(2,request.getParameter("product"));
				st5.setInt(3,qty);
				st5.setString(4,request.getParameter("price"));
				st5.executeUpdate();
				
				PreparedStatement st3=con.prepareStatement("insert into product values (?,?,?)");
				st3.setString(1,id_start);
				st3.setString(2, product);
				st3.setInt(3,qty);
				st3.executeUpdate();
				
			}
			JOptionPane.showMessageDialog(null,"Product added successfully!!");
			response.sendRedirect("products.jsp");
		   con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}