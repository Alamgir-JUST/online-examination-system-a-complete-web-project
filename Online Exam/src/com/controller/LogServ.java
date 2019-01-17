package com.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.loginmodel;
import com.util.DBConnection;
import java.sql.*;
/**
 * Servlet implementation class LogServ
 */
@WebServlet("/LogServ")
public class LogServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		PrintWriter out = response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		loginmodel obj = new loginmodel();
		
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.createConnection();
			String query = "select * from student where Uname=? and Password=?";
			pst=conn.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			int count = 0;
			
			while(rs.next()) {
				count = count+1;
			}
			if(count==1) {
				obj.setUname(username);
				out.print("UserName and Password is Correct");
				///request.getRequestDispatcher("Exam.jsp").forward(request, response);exam without label and exam id
				request.getRequestDispatcher("BeforeExam.jsp").forward(request, response);

				
			}
			else if(count>1) {
				out.println("Duplicate username and Password");
				request.getRequestDispatcher("index1.jsp").forward(request, response);
			}
			else {
				out.println("Username and Password is not Correct try again...!!!");
				request.getRequestDispatcher("index1.jsp").forward(request, response);
			}
			
			rs.close();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
