package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.model.Register;
import com.model.newsaddmodel;
import com.util.DBConnection;
 
public class addnewsdao {
 
 public String newsadd(newsaddmodel newsaddbean) throws ClassNotFoundException
 {
	 String no = newsaddbean.getNno();
	 String head = newsaddbean.getNhead();
	 String text = newsaddbean.getNtext();
 
	 Connection conn = null;
	 PreparedStatement pst = null;

	 try {
		conn = DBConnection.createConnection();
		String query = "insert into news(NNo,NHead,NText) values (?,?,?)";
		pst = conn.prepareStatement(query);
		pst.setString(1, no);
		pst.setString(2, head);
		pst.setString(3, text);
		
		int x = pst.executeUpdate();
		
		if(x!=0) {
			return "SUCCESS";
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	 return "Something went wrong there!!!!!!!!!!!";
  // On failure, send a message from here.
	 }
}