<%@page import="com.model.idlabelmodel"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.model.loginmodel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Now you are in your profile page.</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.main{
		text-align:center;
	}
	.heading2{
		min-height:100px;
		border-radius: 25px;
	    border:1px solid black;
	    padding: 20px; 
	    height: 260px;
	    font-size:16px;
		
	}
	.heading h1{
		background: #f4f4f4 none repeat scroll 0 0;
	    font-family: "Times New Roman", Times, serif;
	  	box-shadow: 2px 2px 0 1px #999;
	  	color: #010002;
	  	margin: 10px auto 25px;
	  	padding: 4px;
	  	text-align: center;
	  	width: 680px;
	}
	
</style>
<%@include file="hdprtr/header.jsp" %>
<body>
<%

if(loginmodel.getUname()==null){
	out.println("Please Login");
	response.sendRedirect("index.jsp");
}
String tq = idlabelmodel.getQuesno();
int tqn = Integer.parseInt(tq);
int ftqn = tqn;
%>
<div class="main">
<div class="heading">
<h1>User profile Information</h1>
</div>
<div class="heading2">
	<%
		String name = "";
		String uname = "";
		String email = "";
		String subject = "";
		String university = "";
		
		String username = loginmodel.getUname();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
	%>
	
	<%
	
	try{
	conn = DBConnection.createConnection();
	String sql = "Select Name,Uname,Email,Subject,University from student where Uname=?";
	pst = conn.prepareStatement(sql);
	pst.setString(1, username);
	rs = pst.executeQuery();
	
	while(rs.next()){
		name = rs.getString("Name");
		uname = rs.getString("Uname");
		email = rs.getString("Email");
		subject = rs.getString("Subject");
		university = rs.getString("University");		
	}
	
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	
	<h2>Your Name is :<%=name%> </h2>
	<h2>Your UserName is :<%=uname%> </h2>
	<h2>Your Email is : <%=email%></h2>
	<h2>Your Subject is : <%=subject %></h2>
	<h2>Your University is : <%=university%></h2>
</div>
	<h1><u>Your total completed exam and marks</u></h1>
	
	<table align="center" name="mytbl" border="1" width="100%">
	<tr bgcolor="#8e99ce">
	<td align="center"><b>Exam Id</b></td>
	<td align="center"><b>Exam Label</b></td>
	<td align="center"><b>Earned Marks</b></td>
	<td align="center"><b>Out of Marks</b></td>
	<td align="center"><b>Exam Date</b></td>
	</tr>
	<%
	try{ 
		
	conn = DBConnection.createConnection();
	String sql ="SELECT * FROM user_marks where UserName=?";
	pst = conn.prepareStatement(sql);
	pst.setString(1, uname);
	rs = pst.executeQuery();
	
	while(rs.next()){
	%>
	<tr>	
	<td><%=rs.getString("QId") %></td>
	<td><%=rs.getString("Examlabel") %></td>
	<%
	String s = rs.getString("Total_Mark");
	int mark = Integer.parseInt(s);
	int marks = mark-1;
	%>
	<td><%=marks%></td>
	<td><%=ftqn%></td>
	<td><%=rs.getString("Date") %></td>		
	</tr>
	
	<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table>	
	
	</div>
</body>
<%@include file="footer.jsp" %>
</html>