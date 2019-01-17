package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.adminloginmodel;
import com.model.idlabelmodel;

/**
 * Servlet implementation class BeforeStartServ
 */
@WebServlet("/BeforeStartServ")
public class BeforeStartServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeforeStartServ() {
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
		
		out.println("Alamgir Hossain");
		
		String subject = request.getParameter("exameid");
		String label = request.getParameter("examlabel");
		String nques = request.getParameter("NoofQues");
		
		idlabelmodel obj = new idlabelmodel();
		obj.setId(subject);
		obj.setModel(label);
		obj.setQuesno(nques);

		response.sendRedirect("BeforeStart.jsp");
	}

}
