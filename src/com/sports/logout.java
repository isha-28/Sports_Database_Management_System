package com.sports;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")

public class logout extends HttpServlet
{
	public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException 
	{
		HttpSession session=request.getSession();
		session.removeAttribute("username");
		response.sendRedirect("login.jsp");
	}
}
