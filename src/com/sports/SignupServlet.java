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
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("yay");
		String uname=request.getParameter("uname");
		System.out.println(uname);
		String email=request.getParameter("email");
		System.out.println(email);
		String pwd=request.getParameter("psw");
		System.out.println(pwd);
		String rep_pwd=request.getParameter("psw-repeat");
		System.out.println(rep_pwd);
		
		try
		{
			System.out.println(rep_pwd);
			if(pwd.contentEquals(rep_pwd))
			{
				System.out.println(email);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
			PreparedStatement st=con.prepareStatement("insert into admin(name,email,password) values(?,?,?)");
			System.out.println(uname);
			st.setString(1,uname);
			st.setString(2,email);
			st.setString(3,pwd);
			
			st.executeUpdate();
			con.close();
			System.out.println("Hello1");
			JOptionPane.showMessageDialog(null,"Admin added successfully!");
			System.out.println("Hello2");
			response.sendRedirect("login.jsp");
			System.out.println("Hello3");
			}
			else {
			JOptionPane.showMessageDialog(null,"Password doesn't match!");
			response.sendRedirect("signup.jsp");
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}