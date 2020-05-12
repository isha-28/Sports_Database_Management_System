package com.sports;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class AddSports
 */
@WebServlet("/AddSports")
public class AddSports extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("yuhu");
		String sport=request.getParameter("sport");
		System.out.println(sport);
		String sport2=sport.toUpperCase();
		System.out.println(sport2);
		
		String product=request.getParameter("product");
		System.out.println(product);
		int qty=Integer.parseInt(request.getParameter("qty"));
		System.out.println(qty+"");
		
		String id_start=null;
		id_start=sport2.substring(0,2);
		System.out.println(id_start);
		int i=2;
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
			ResultSet rs=st.executeQuery("select count(id) from sport_data");
			rs.next();
			int count_sp=rs.getInt(1);
			System.out.println("ccount of sports"+count_sp);
			
			
			String arr[];
			arr=new String[count_sp];
			int j=0;
			
			
			Statement st4=con.createStatement();
			ResultSet rs4=st4.executeQuery("select * from sport_data");
			
			while(rs4.next())
			{
				arr[j]=rs4.getString("id");
				j++;
			}
			System.out.println("sports array::");
			for(j=0;j<count_sp;j++)
			{
				System.out.println(arr[j]);
			}
			
			
			Statement st1=con.createStatement();
			ResultSet rs1=st1.executeQuery("select * from sport_data");
			while(rs1.next())
			{
				if((id_start.equals(rs1.getString("id"))) && (sport2.equals(rs1.getString("sp_name"))))
				{
					JOptionPane.showMessageDialog(null,"Sport is already registered in database!!");
					response.sendRedirect("add_product.jsp");
				}
				else if((id_start.equals(rs1.getString("id"))) && !(sport2.equals(rs1.getString("sp_name"))))
				{
					id_start=null;
					char first=sport2.charAt(0);
					System.out.println("1"+i);
					char second=sport2.charAt(i);
					System.out.println("2"+i);
					i++;
					System.out.println("3"+i);
					id_start=new StringBuilder().append(first).append(second).toString();
					System.out.println(id_start);
					int k;
					for(k=0;k<count_sp;k++)
					{
						System.out.println("in for "+arr[k]);
						if(id_start.equals(arr[k]) )
						{
							id_start=null;
							char f=sport2.charAt(0);
							char s;
							
							if(i<=count_sp)
							{
								
								s=sport2.charAt(i);
								System.out.println("in if "+f+s);
								i++;
								id_start=new StringBuilder().append(f).append(s).toString();
								System.out.println(id_start);
								k=0;
							
							}
							else
							{
								JOptionPane.showMessageDialog(null,"Sport cannot be added!!");
								response.sendRedirect("add_sport.jsp");
							}
					}
				}
			}
			
			}
			PreparedStatement st2=con.prepareStatement("insert into sport_data values (?,?)");
			st2.setString(1, id_start);
			st2.setString(2, sport2);
			st2.executeUpdate();
			String pid=id_start;
			pid=pid.concat("01");
			PreparedStatement st3=con.prepareStatement("insert into product values (?,?,?)");
			st3.setString(1, pid);
			st3.setString(2, product);
			st3.setInt(3, qty);
			st3.executeUpdate();
			
			PreparedStatement st5=con.prepareStatement("insert into trans_log(tdate,sport,product,qty,price,action) values(current_date,?,?,?,?,'Added')");
			st5.setString(1,request.getParameter("sport"));
			st5.setString(2,request.getParameter("product"));
			st5.setInt(3,qty);
			st5.setString(4,request.getParameter("price"));
			st5.executeUpdate();
			
			JOptionPane.showMessageDialog(null,"Sport added successfully!!");
			
		   con.close();
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}