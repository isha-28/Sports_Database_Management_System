package com.sports;

import java.sql.Date;

public class ReturnDisp {
	
	
	String studentid;
	String studentname;
	String productid;
	Date issue;
	Date returns;
	String productname;
	String sportname;
	int quantity;
	String issuestring;
	String returnstring;
	int fine;
	
	public String getReturnstring() {
		return returnstring;
	}

	public void setReturnstring(String returnstring) {
		this.returnstring = returnstring;
	}

	public String getStudentid() {
		return studentid;
	}
	
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public Date getIssue() {
		return issue;
	}
	public void setIssue(Date issue) {
		this.issue = issue;
	}
	public Date getReturns() {
		return returns;
	}
	public void setReturns(Date returns) {
		this.returns = returns;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getSportname() {
		return sportname;
	}
	public void setSportname(String sportname) {
		this.sportname = sportname;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getFine() {
		return fine;
	}
	public void setFine(int fine) {
		this.fine = fine;
	}
	public String getIssuestring() {
		return issuestring;
	}
	public void setIssuestring(String issuestring) {
		this.issuestring = issuestring;
	}	

}