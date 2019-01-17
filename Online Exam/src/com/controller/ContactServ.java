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

import com.util.DBConnection;

/**
 * Servlet implementation class ContactServ
 */
@WebServlet("/ContactServ")
public class ContactServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServ() {
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
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String message = request.getParameter("message");
		
		Connection conn =null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into user_msg(Name,Email,Mobile,Message) values(?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, mobile);
			pst.setString(4, message);
			
			int x = pst.executeUpdate();
			
			if(x!=0) {
				out.println("Your message submitted");
				response.sendRedirect("contact.jsp");
			}else {
				out.println("Something wrong!!!!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
