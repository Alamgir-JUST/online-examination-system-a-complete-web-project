
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getParameter("d");
	int no = Integer.parseInt(id);
	Connection conn = DBConnection.createConnection();
	Statement st =conn.createStatement();
	st.executeUpdate("delete from student where id='"+no+"'");
	out.println("User Deteted!!!!");
	response.sendRedirect("adminuser.jsp");
	
%>