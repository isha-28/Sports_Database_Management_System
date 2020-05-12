package com.sports.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import com.sports.AttendanceDisplay;
import com.sports.MatchDisplay;

import com.sports.ReturnDisp;
import com.sports.StockDisplay;

public class StockDisplaydao {

	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sports","vishwesh","root");
		}catch(Exception e){System.out.println(e);}
		return con;
	}


	
	public static List<MatchDisplay> getmatchresults(){
		List<MatchDisplay> list=new ArrayList<MatchDisplay>();
		int i=1;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select matches.match_date,team.tname,matches.opponent,matches.tour_name,matches.result from matches join team on team.tid=matches.tid;");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				MatchDisplay u=new MatchDisplay();
				u.setSrno(i);
				i++;
				u.setMatch_date(rs.getDate("match_date")); //rs.getDate(1);1st field fetched
				u.setCategory(rs.getString("tname")); //Aka category
				u.setOpponent(rs.getString("opponent"));
				u.setTournament(rs.getString("tour_name"));
				String flag = rs.getString("result");
				u.setResult(flag);	
				list.add(u);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	//ATTENDANCE CALC
	
	public static List<AttendanceDisplay> getattend(){
		List<AttendanceDisplay> list=new ArrayList<AttendanceDisplay>();
		int i=1;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select student.sid,student.sname,student.rollno,student.class,matches.match_date from student,matches join team on team.tid=matches.tid join attendance on matches.match_id=attendance.match_id where student.sid=attendance.sid;");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
						
				AttendanceDisplay u=new AttendanceDisplay();
				u.setSid(rs.getString("sid"));
				u.setSname(rs.getString("sname")); 
				u.setRollno(rs.getInt("rollno"));
				u.setClassname(rs.getString("class"));
				u.setMatch_date(rs.getDate("match_date"));			
				list.add(u);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}


	public static List<ReturnDisp>displayissued(){
		List<ReturnDisp> list=new ArrayList<ReturnDisp>();
		try{
			System.out.println("Hello1");
			System.out.println("Hello2");
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select student.sid,student.sname,issues.pid,product.pname,product.pid,issuedate,qty from student,issues,product where student.sid=issues.sid and issues.pid=product.pid order by issuedate;\n" + ";");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				ReturnDisp u=new ReturnDisp();
				
				PreparedStatement ps2=con.prepareStatement("select * from sport_data");
				ResultSet rs2=ps2.executeQuery();
				
				while(rs2.next())
				{
					if(rs.getString("issues.pid").contains(rs2.getString("id")))
					{
						u.setSportname(rs2.getString("sp_name"));
						break;
					}
				}
				u.setStudentid(rs.getString("sid"));
				u.setStudentname(rs.getString("sname"));
				u.setProductname(rs.getString("pname"));
				u.setQuantity(rs.getInt("qty"));
				u.setProductid(rs.getString("pid")); //for ease in deletions from issues tables
				
				Date sqldate=rs.getDate("issuedate");
				u.setIssue(sqldate); //for future use
				//1.sqldate to string
				
				SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
				String result = df.format(sqldate);
				
//				System.out.println(result);
				//2.string to javadate
//				 java.util.Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(result);  
//				 System.out.println(date1);
				u.setIssuestring(result);
				list.add(u);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static List<ReturnDisp> displayreturn(){
		List<ReturnDisp> list=new ArrayList<ReturnDisp>();
		try{
			SimpleDateFormat myFormat = new SimpleDateFormat("dd MM yyyy");
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select student.sid,student.sname,returns.pid,product.pname,product.pid,issuedate,returndate,qty from student,returns,product where student.sid=returns.sid and returns.pid=product.pid order by issuedate;\n" + ";");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				PreparedStatement ps2=con.prepareStatement("select * from sport_data");
				ResultSet rs2=ps2.executeQuery();
				
				ReturnDisp u=new ReturnDisp();
				
				while(rs2.next())
				{
					if(rs.getString("product.pid").contains(rs2.getString("id")))
					{
						u.setSportname(rs2.getString("sp_name"));
						break;
					}
				}
				
				u.setStudentid(rs.getString("sid"));
				u.setStudentname(rs.getString("sname"));
				u.setProductname(rs.getString("pname"));
				u.setQuantity(rs.getInt("qty"));
				u.setProductid(rs.getString("pid")); //for ease in deletions from issues tables
				
				Date sqldate=rs.getDate("issuedate");
				u.setIssue(sqldate); 
				SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
				String result = df.format(sqldate);
				u.setIssuestring(result);
				
				Date sqldate2=rs.getDate("returndate");
				u.setIssue(sqldate2); 
				SimpleDateFormat df2= new SimpleDateFormat("dd-MM-yyyy");
				String result2 = df2.format(sqldate2);
				u.setReturnstring(result2);
				
				String result1=result.replace('-', ' ');
				System.out.println(result1 + "it is");
				String result3=result2.replace('-', ' ');
				System.out.println(result3 + "it is");
				java.util.Date dateBefore = myFormat.parse(result1);
			    java.util.Date dateAfter = myFormat.parse(result3);
			    long difference = dateAfter.getTime() - dateBefore.getTime();
			    int daysBetween = (int)(difference / (1000*60*60*24));
			    
			    System.out.println(daysBetween + "it is");
			    
			    if(daysBetween > 1)
			    {
			    	u.setFine(10*daysBetween*rs.getInt("qty")-10*rs.getInt("qty"));
			    	
			    }
			    else
			    	u.setFine(0);
			       
				list.add(u);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	//delete from issues and add to return
	public static void return_from_issues(String sid,String pid,String issue_date) throws ParseException{
		int rs=0;
		java.util.Date issue1=new SimpleDateFormat("dd-MM-yyyy").parse(issue_date);  
		System.out.println(issue1);
		
		try{
			Connection con=getConnection();
			System.out.println("before prepared0");
			//Step1: delete from issues
			//convert from utildate formatted string to sqldate
			
			PreparedStatement ps2=con.prepareStatement("select * FROM issues where sid=? and pid=?;");
			ps2.setString(1,sid);
			ps2.setString(2,pid);
			ResultSet rs2=ps2.executeQuery();
			
			rs2.next();
			int qty2=rs2.getInt("qty");
			System.out.println("qty is "+qty2);
			
			System.out.println("before prepared");
			String sql="DELETE FROM issues where sid=? and pid=?;";
			
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,sid);
			ps.setString(2,pid);
			System.out.println("after prepared");
			rs=ps.executeUpdate();	
			
			
			long millis=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(millis); 
		    
			int day=issue1.getDate();
			int month=issue1.getMonth();
			int year=issue1.getYear();
			//convert from util to sql
			java.sql.Date issuedate=new java.sql.Date(year,month,day);
			System.out.println(issuedate);

			String sql2="insert into returns(pid,qty,sid,returndate,issuedate) values(?,?,?,?,?);";
			ps=con.prepareStatement(sql2);
			ps.setString(1,pid);
			ps.setInt(2,qty2);
			ps.setString(3,sid);
			ps.setDate(4,date);
			ps.setDate(5,issuedate);
			rs=ps.executeUpdate();
			
			
			
		}catch(Exception e){System.out.println(e);}
		//Step2:add to returns tables
				
}
	

}