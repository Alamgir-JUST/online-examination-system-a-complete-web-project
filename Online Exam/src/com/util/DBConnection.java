package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
public static Connection createConnection() throws ClassNotFoundException
 {
	 Connection conn = null;
	 String url = "jdbc:mysql://localhost:3306/onlineexam"; //MySQL URL followed by the database name
	 String username = "root"; //MySQL username
	 String password = ""; //MySQL password
	 
	 try {
		 Class.forName("com.mysql.jdbc.Driver");
		 conn = DriverManager.getConnection(url, username, password);
		 System.out.println("Connected");
	} catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	 	
	 return conn; 
 	}
 }