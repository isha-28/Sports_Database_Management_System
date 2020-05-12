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
 * Servlet implementation class UpdateProducts
 */
@WebServlet("/UpdateProducts")
public class UpdateProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			System.out.println("yuhu");
			String sport=(String)request.getSession().getAttribute("sporty");
			System.out.println(sport);
			String product=request.getParameter("productList");
			System.out.println(product);
			int qty=Integer.parseInt(request.getParameter("qty"));
			System.out.println(qty+"");
			
			String add_prod=request.getParameter("add_prod");
			String dlt_prod=request.getParameter("dlt_prod");
			Date date=Calendar.getInstance().getTime(); 
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
				
				Statement st3=con.createStatement();
				System.out.println(1);
				
				ResultSet rs3=st3.executeQuery("select id from sport_data where sp_name='"+sport+"' ");
				rs3.next();
				id_start=rs3.getString("id");
				System.out.println(id_start);
				
				Statement st=con.createStatement();
				System.out.println(1);
				ResultSet rs1=st.executeQuery("select pid from product where pname='"+product+"' && pid like '"+id_start+"%' ");
				System.out.println(2);
				rs1.next();
				if(rs1.equals(null))
				{
					System.out.println("Enter valid data");
				}
				String pid=rs1.getString(1);
				
				ResultSet rs4=st.executeQuery("select quantity from product where pname='"+product+"' && pid like '"+id_start+"%' ");
				System.out.println(2);
				rs4.next();
				if(rs4.equals(null))
				{
					System.out.println("Enter valid data");
				}
				int qty2=Integer.parseInt(rs4.getString(1));
				
				if(add_prod!=null)
				{	
					qty2+=qty;
					PreparedStatement st4=con.prepareStatement("insert into trans_log(tdate,sport,product,qty,price,action) values(current_date,?,?,?,?,'Added')");
					st4.setString(1,request.getParameter("sportList"));
					st4.setString(2,request.getParameter("productList"));
					st4.setInt(3,qty);
					st4.setString(4,request.getParameter("price"));
					st4.executeUpdate();
				}
				
				
				else
				{	
					qty2-=qty;
				}
				
				System.out.println(pid);
				System.out.println(4);
				java.sql.Date date2=new java.sql.Date(date.getTime());
			   
				try {
					 System.out.println(3);
					PreparedStatement st2=con.prepareStatement("update product set quantity=? where pid=?");
					 System.out.println(5);
					 
					st2.setInt(1,qty2);
					 System.out.println(5);
					st2.setString(2,pid);
					 System.out.println(6);
					
					st2.executeUpdate();
					if(add_prod==null)
					{	
						PreparedStatement st5=con.prepareStatement("insert into trans_log(tdate,sport,product,qty,price,action) values(current_date,?,?,?,'-','Deleted')");
						st5.setString(1,request.getParameter("sportList"));
						st5.setString(2,request.getParameter("productList"));
						st5.setInt(3,qty);
						st5.executeUpdate();
					}
					 System.out.println(9);
					System.out.println("executed!!");
					JOptionPane.showMessageDialog(null,"Product Updated Successfully!");
					response.sendRedirect("products.jsp");
				}
				catch(Exception e)
				{
					e.printStackTrace();
					System.out.println("whops");
					JOptionPane.showMessageDialog(null,"Please enter valid quantity to be deleted!");
					response.sendRedirect("update_product.jsp");
				}
				
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
	}

}