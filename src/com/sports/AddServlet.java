package com.sports;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("login");
		String pwd=request.getParameter("password");
		int flag=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select email,password from admin");
			while(rs.next())
			{
				String testname=rs.getString(1);
				String pass=rs.getString(2);
				if((testname.equals(uname) && pwd.equals(pass)))
				{
					flag=1;
					System.out.println("hey there");
					
					HttpSession session=request.getSession();
					session.setAttribute("username",testname);
					JOptionPane.showMessageDialog(null,"Logged in successfully!");
					RequestDispatcher rd=request.getRequestDispatcher("/home.jsp");
					
					rd.forward(request, response);	
				}		
				
			}
			if(flag==0)
			{
				JOptionPane.showMessageDialog(null, "Please enter valid credentials!");
				RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	
}