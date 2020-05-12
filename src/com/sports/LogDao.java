package com.sports;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.sports.Log;

public class LogDao 
{
	public static Connection getConnection()
	{
		Connection con=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
	
	public static List<Log> getAllRecords()
	{
		List<Log> list=new ArrayList<Log>();
		
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from trans_log");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Log u=new Log();
				
				u.setDate(rs.getString("tdate"));
				u.setSport(rs.getString("sport"));
				u.setProduct(rs.getString("product"));
				u.setQuantity(rs.getInt("qty"));
				u.setPrice(rs.getString("price"));
				u.setAction(rs.getString("action"));
				list.add(u);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return list;
	}
}