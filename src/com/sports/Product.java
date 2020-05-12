package com.sports;

public class Product {
	private int quantity;
	private String 
	pname,sport;
	
	public String getSport() 
	{
		return sport;
	}
	public void setSport(String sport)
	{
		this.sport = sport;
	}
	public String getName() 
	{
		return pname;
	}
	public void setName(String name) 
	{
		this.pname = name;
	}
	public int getQuantity() 
	{
		return quantity;
	}
	public void setQuantity(int qty) 
	{
		this.quantity = qty;
	}
}