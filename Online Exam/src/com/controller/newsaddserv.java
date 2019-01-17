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

import com.dao.addnewsdao;
import com.model.newsaddmodel;

/**
 * Servlet implementation class newsaddserv
 */
@WebServlet("/newsaddserv")
public class newsaddserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsaddserv() {
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
		
		String neno=request.getParameter("nno");
		String nhead=request.getParameter("newsheader");
		String ntext=request.getParameter("newstext");
		
		newsaddmodel newsaddmodelob = new newsaddmodel(); 
		
		newsaddmodelob.setNno(neno);
		newsaddmodelob.setNhead(nhead);
		newsaddmodelob.setNtext(ntext);
		addnewsdao addnewsdaob = new addnewsdao();
		//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
		String newsmsg = null;
		try {
			newsmsg = addnewsdaob.newsadd(newsaddmodelob);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(newsmsg.equals("SUCCESS"))   //On success, you can display a message to user on Home page
		{
			out.println("News Added");
			//request.getRequestDispatcher("/home.jsp").forward(request, response);
			request.getRequestDispatcher("addnews.jsp").forward(request, response);
		}
		else   //On Failure, display a meaningful message to the User.
		{
			request.setAttribute("errMessage", newsmsg);
			//request.getRequestDispatcher("/Register.jsp").forward(request, response);
		}
	}

}
