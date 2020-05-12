package com.sports;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.sports.Product;

public class ProductDao 
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
	
	public static List<Product> getAllRecords()
	{
		List<Product> list=new ArrayList<Product>();
		
		try{
			Connection con=getConnection();
//			PreparedStatement ps=con.prepareStatement("select * from product");
//			ResultSet rs=ps.executeQuery();
			
			CallableStatement csmt=con.prepareCall("{call selectProcedure()}");
			ResultSet rs=csmt.executeQuery();
			while(rs.next()){
				
				PreparedStatement ps2=con.prepareStatement("select * from sport_data");
				ResultSet rs2=ps2.executeQuery();
				
				
				
				Product u=new Product();
				
				while(rs2.next())
				{
					if(rs.getString("pid").contains(rs2.getString("id")))
					{
						u.setSport(rs2.getString("sp_name"));
						break;
					}
				}
				
				u.setName(rs.getString("pname"));
				u.setQuantity(rs.getInt("quantity"));
				list.add(u);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return list;
	}
	
	public static List<Product> getAllRecords_filter(String id_start)
	{
		List<Product> list=new ArrayList<Product>();
		
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from product where pid like '"+id_start+"%' ");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				PreparedStatement ps2=con.prepareStatement("select * from sport_data");
				ResultSet rs2=ps2.executeQuery();
				
				Product u=new Product();
				
				while(rs2.next())
				{
					if(rs.getString("pid").contains(rs2.getString("id")))
					{
						u.setSport(rs2.getString("sp_name"));
						break;
					}
				}
				
				u.setName(rs.getString("pname"));
				u.setQuantity(rs.getInt("quantity"));
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