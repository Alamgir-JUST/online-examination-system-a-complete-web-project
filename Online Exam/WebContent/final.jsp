<%@page import="com.model.idlabelmodel"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.loginmodel"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Congratulation. You complete this exam</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.main{
		text-align:center;
		font-size:15px;
	}
	.main p{
		font-size:25px;
		background: #939cc8;
	}
	.main a{
	display:block;
	text-decoration: none;
	color: white;
	}
	.main a:hover{
	 background-color: #111111;
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
<div class="main">
<div class="heading">
	<h1>You are done!!!!</h1>
</div>
<%
	String examid = idlabelmodel.getId();
	String examlabel = idlabelmodel.getModel();
	String titalques = idlabelmodel.getQuesno();
	int total_question = Integer.parseInt(titalques);
	String username = loginmodel.getUname();
	
	int v=0;
	int rn = 0;
	Date date = new Date();
	String todays_date = date.toString();
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs=null;
	Statement st=null;
%>

	<h2>Congratulations!!!!!! You completed the exam</h2>
	<h2>Your User Name : <%=username%></h2>
	
	<%
	
	try{
	
	
	conn = DBConnection.createConnection();
	String sql = "SELECT sum(CheckId) as amount from tbl_userans where UserName=?";
	pst = conn.prepareStatement(sql);
	pst.setString(1, username);
	rs = pst.executeQuery();
	
	
	while(rs.next()){
		v = rs.getInt("amount");
	}
	
	//out.println("Total value is : "+v);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<h3>You earned : <%=v-1%> marks out of : <%=total_question%></h3>
	
	<p><a href="viewans.jsp">View Correct Answer</a></p>
	<p><a href="BeforeExam.jsp">Again Start Test!!!!</a></p>
	
	
	<!-- User_marks table machanism start -->
	<%
	try{
		
		conn = DBConnection.createConnection();
		String sql = "insert into user_marks(UserName,QId,Examlabel,Total_Mark,Date) values(?,?,?,?,?)";
		pst = conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, examid);
		pst.setString(3, examlabel);
		pst.setInt(4, v);
		pst.setString(5, todays_date);
		
		int i = pst.executeUpdate();
		
		if(i!=0){
			//out.println("Inserted");
		}else{
			//out.println("Not inserted");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>

<%

	conn = DBConnection.createConnection();
	st =conn.createStatement();
	st.executeUpdate("delete from tbl_userans where UserName='"+username+"'");
	
%>
<%

	conn = DBConnection.createConnection();
	st =conn.createStatement();
	st.executeUpdate("delete from tbl_category_question where UserName='"+username+"'");
	
%>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>