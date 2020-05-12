package com.sports;

import java.awt.Desktop;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class GenratePDF2
 */
@WebServlet("/GenratePDF2")
public class GenratePDF2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String criteria=request.getParameter("criteria");
			System.out.println(criteria);
			String query=null;
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/sports?user=vishwesh&password=root");
			Statement st=connection.createStatement();
			
			
			String file_name="/home/vishwesh/Downloads/Report/temp.pdf"; 
		    Document document=new Document();
		    PdfWriter.getInstance(document, new FileOutputStream(file_name));
		    document.open();
		    
		    	query="select * from v1 where tname='"+criteria+"'";
		    
		    	
		    PreparedStatement ps=connection.prepareStatement(query);
		    ResultSet rs=ps.executeQuery();
		      PdfPTable table=new PdfPTable(6);
			  PdfPCell c1=new PdfPCell(new Phrase("Name"));
			  table.addCell(c1);
			  c1=new PdfPCell(new Phrase("Date"));
			  table.addCell(c1);
			  c1=new PdfPCell(new Phrase("Tour"));
			  table.addCell(c1);
			  c1=new PdfPCell(new Phrase("Opponent"));
			  table.addCell(c1);
			  c1=new PdfPCell(new Phrase("Result"));
			  table.addCell(c1);
			  c1=new PdfPCell(new Phrase("Win Percent"));
			  table.addCell(c1);
			  table.setHeaderRows(1);
			  document.add(new Paragraph("    "));
		    while(rs.next())
		    {
		    	 table.addCell(rs.getString(1));
				  table.addCell(rs.getString(2));
				  table.addCell(rs.getString(3));
				  table.addCell(rs.getString(4));
				  table.addCell(rs.getString(5));
				  table.addCell(Integer.toString(rs.getInt(6)));
		    }
		    document.add(table);
		    document.close();
		    
		    Desktop.getDesktop().open(new java.io.File(file_name));
		    response.sendRedirect("matches.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}