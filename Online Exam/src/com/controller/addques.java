package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.QuesaddDao;
import com.model.mquesadd;

/**
 * Servlet implementation class addques
 */
@WebServlet("/addques")
public class addques extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addques() {
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
		
		String quesno = request.getParameter("quesno");
		String examid = request.getParameter("examid");
		String qlabel = request.getParameter("qlabel");
		String ques = request.getParameter("ques");
		String ans1 = request.getParameter("ans1");
		String ans2 = request.getParameter("ans2");
		String ans3 = request.getParameter("ans3");
		String ans4 = request.getParameter("ans4");
		String correctans = request.getParameter("correctans");
		
		mquesadd Mquesadd = new mquesadd();
		
		Mquesadd.setQno(quesno);
		Mquesadd.setExamid(examid.toLowerCase());
		Mquesadd.setQlabel(qlabel.toLowerCase());
		Mquesadd.setQues(ques);
		Mquesadd.setAns1(ans1);
		Mquesadd.setAns2(ans2);
		Mquesadd.setAns3(ans3);
		Mquesadd.setAns4(ans4);
		Mquesadd.setCans(correctans);
		
		QuesaddDao quesaddDao = new QuesaddDao();
		
		String qadd = null;
		
		try {
			qadd = quesaddDao.questionadd(Mquesadd);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(qadd.equals("SUCCESS"))   //On success, you can display a message to user on Home page
		{
			out.println("Data Inserted");
			//request.getRequestDispatcher("/home.jsp").forward(request, response);
			request.getRequestDispatcher("addques.jsp").forward(request, response);
		}
		else   //On Failure, display a meaningful message to the User.
		{
			request.setAttribute("errMessage", qadd);
			request.getRequestDispatcher("/Register.jsp").forward(request, response);
		}
		
	}

}
