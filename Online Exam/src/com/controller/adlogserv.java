package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.adminloginmodel;
import com.util.DBConnection;

/**
 * Servlet implementation class adlogserv
 */
@WebServlet("/adlogserv")
public class adlogserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adlogserv() {
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
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		adminloginmodel obj = new adminloginmodel();
		obj.setUsername(username);
		
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.createConnection();
			String query = "select * from tbl_admin where UserName=? and Password=?";
			pst=conn.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			int count = 0;
			
			while(rs.next()) {
				count = count+1;
			}
			if(count==1) {
				out.print("UserName and Password is Correct");
				request.getRequestDispatcher("adminindex.jsp").forward(request, response);	
			}
			else {
				out.println("Username and Password is not Correct try again...!!!");
			}
			
			rs.close();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
