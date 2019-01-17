package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.model.Register;
import com.util.DBConnection;
 
public class RegisterDao {
 
 public String registerUser(Register registerBean) throws ClassNotFoundException
 {
	 String name = registerBean.getName();
	 String uname = registerBean.getUname();
	 String pass = registerBean.getPassword();
	 String repass = registerBean.getRepass();
	 String email = registerBean.getEmail();
	 String sub = registerBean.getSubject();
	 String university = registerBean.getUniversity();
 
	 Connection conn = null;
	 PreparedStatement pst = null;

	 try {
		conn = DBConnection.createConnection();
		String query = "insert into student(Name,Uname,Password,RePass,Email,Subject,University) values (?,?,?,?,?,?,?)";
		pst = conn.prepareStatement(query);
		pst.setString(1, name);
		pst.setString(2, uname);
		pst.setString(3, pass);
		pst.setString(4, repass);
		pst.setString(5, email);
		pst.setString(6, sub);
		pst.setString(7, university);
		
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