
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getParameter("d");
	int no = Integer.parseInt(id);
	Connection conn = DBConnection.createConnection();
	Statement st =conn.createStatement();
	st.executeUpdate("delete from tbl_question where QuesNo='"+no+"'");
	st.executeUpdate("delete from tbl_answer where QuesNo='"+no+"'");
	out.println("Question Deteted!!!!");
	response.sendRedirect("queslist.jsp");
	
%>