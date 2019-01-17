<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.model.adminloginmodel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new news from here</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	input[type=text],textarea{
	background-color: ; /* Green */
    padding: 8px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

input[type=submit]{
	background-color: #a3a5af; /* Green */
    border: none;
    color: white;
    padding: 8px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-top:20px;
    margin-left:140px;
}
.heading h1{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
	 
}
.addq h3{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 200px;
}
</style>
<%@include file="headerfooter/header.jsp" %>
<body>
<%
	if(adminloginmodel.getUsername()==null){
		out.println("Please Login");
		response.sendRedirect("adminlogin.jsp");
	}

%>
<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
%>
	<div class="addq">
		<div class="heading">
			<h1>Admin Pannel-New news Adding</h1>
		</div>
	<form action="newsaddserv" method="post">
	<table align="center">
	<tr>
	<%
			try{
				conn = DBConnection.createConnection();
				String sql = "select * from news";
				//String sql = "select last (QuesNO) from tbl_question order by QuesNO";
				pst = conn.prepareStatement(sql);
				rs = pst.executeQuery();
				while(rs.next()){
				rs.last();			
			%>
	
		<td><h3>News No :</h3></td>
		<td><input type="text" name="nno" value=<%=rs.getRow()+1%>></td>
	</tr>
				<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	<tr>
		<td><h3>News Header :</h3></td>
		<td>
			<textarea name="newsheader" rows="4" cols="50">
			</textarea>
		</td>
	</tr>
	<tr>
		<td><h3>News Text :</h3></td>
		<td>
			<textarea name="newstext" rows="10" cols="50">
			</textarea>
		</td>
	</tr>
	<tr>
		<td><input type="submit" value="Add News"></td>
	</tr>
	</table>
	</form>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>