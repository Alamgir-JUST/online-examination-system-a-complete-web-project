package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.dao.RegisterDao;
import com.model.Register;

/**
 * Servlet implementation class RegServ
 */
@WebServlet("/RegServ")
public class RegServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServ() {
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
		
		String name=request.getParameter("name");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		String repass = request.getParameter("repass");
		String email=request.getParameter("email");
		String sub=request.getParameter("subject");
		String univer=request.getParameter("university");
		

		Register register = new Register();
	//Using Java Beans - An easiest way to play with group of related data
		
		register.setName(name);
		register.setUname(uname);
		register.setPassword(pass);
		register.setRepass(repass);
		register.setEmail(email);
		register.setSubject(sub);
		register.setUniversity(univer);
		
	 
		RegisterDao registerDao = new RegisterDao();
		//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
		String userRegistered = null;
		try {
			userRegistered = registerDao.registerUser(register);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
		{
			out.println("Your Registration Successful. Login with your username & Password");
			//request.getRequestDispatcher("/home.jsp").forward(request, response);
			request.getRequestDispatcher("index1.jsp").forward(request, response);
		}
		else   //On Failure, display a meaningful message to the User.
		{
			request.setAttribute("errMessage", userRegistered);
			request.getRequestDispatcher("/Register.jsp").forward(request, response);
		}
	}

}
