package com.sports;

import java.util.Random;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUtil {
	public static void sendMail(String recepient, String otp) throws MessagingException
	{
		Properties properties=new Properties();
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable","true");
		properties.put("mail.smtp.host","smtp.gmail.com");
		properties.put("mail.smtp.port","587");
		
		String myEmailAccount="harwanivinay13@gmail.com";
		String myAccountPassword="vinay13vinay13";
		System.out.println("Preparing to send !!");
		
		Session session=Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myEmailAccount,myAccountPassword);
			}
		});
		Message message=prepareMessage(session, myEmailAccount, recepient, otp);
		Transport.send(message);
		System.out.println("OTP sent successfully !!");
	}
	
	protected static Message prepareMessage(Session session, String myEmailAccount, String recepient, String otp)
	{
		try {
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress(myEmailAccount));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			message.setSubject("OTP PICT Sports login");
			message.setText(otp);
			return message;
		}
		catch(Exception ex) {
			Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE,null,ex);
			//System.out.println("hey there");
		}
		return null;
	}
	
	public static void sendMail1(String recepient, String otp) throws MessagingException
	{
		Properties properties=new Properties();
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable","true");
		properties.put("mail.smtp.host","smtp.gmail.com");
		properties.put("mail.smtp.port","587");
		
		String myEmailAccount="harwanivinay13@gmail.com";
		String myAccountPassword="vinay13vinay13";
		System.out.println("Preparing to send !!");
		
		Session session=Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myEmailAccount,myAccountPassword);
			}
		});
		Message message=prepareMessage1(session, myEmailAccount, recepient, otp);
		Transport.send(message);
		System.out.println("Attendance sent successfully !!");
	}
	
	protected static Message prepareMessage1(Session session, String myEmailAccount, String recepient, String otp)
	{
		try {
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress(myEmailAccount));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			message.setSubject("Sports Attendance");
			message.setText(otp);
			return message;
		}
		catch(Exception ex) {
			Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE,null,ex);
			//System.out.println("hey there");
		}
		return null;
	}
}