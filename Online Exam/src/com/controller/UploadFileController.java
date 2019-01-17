package com.controller;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.util.DBConnection;

/**
 * Servlet implementation class UploadFileController
 */
@WebServlet("/UploadFileController")
public class UploadFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadFileController() {
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
		
		InputStream inputStream = null;

        Random rand = new Random();
        int  n = rand.nextInt(9999) + 1;
        String idTemp=(String.valueOf(n));

        
        String title=(request.getParameter("title"));
        Part filePart = request.getPart("file_uploaded");
        
        if (filePart != null) 
        {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            inputStream = filePart.getInputStream();
        }

        try 
        {
            Connection conn= DBConnection.createConnection();
            
            String sql = "INSERT INTO files (id, title, file) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, idTemp);
            statement.setString(2, title);
     
            if (inputStream != null) 
            {
                statement.setBinaryStream(3, inputStream, (int) filePart.getSize());
            }
            
            int row = statement.executeUpdate();
            if (row > 0) 
            {
                out.println("File uploaded!!!");
                
                conn.close();
                
                RequestDispatcher rs = request.getRequestDispatcher("upload_form.jsp");
                rs.include(request, response);
            }
            else
            {
                out.println("Couldn't upload your file!!!");
                
                conn.close();
                
                RequestDispatcher rs = request.getRequestDispatcher("upload_form.jsp");
                rs.include(request, response);
            }    

        }catch(Exception e){e.printStackTrace();}  
	}

}
