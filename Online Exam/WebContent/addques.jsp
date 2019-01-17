<%@page import="com.model.adminloginmodel"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>You are in admin pannel-Add question</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
.main{
	min-height:250px;
	font-size:20px;
}
.starting{
	display: block;
	margin-top:-40px;

}
.starting h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
	 
}
.starting hr{
	display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0;
}
.addpart table{
	 border-style: solid;
    border-width: 2px 2px 2px 2px;
    margin-bottom:10px;
}
input[type="text"], input[type="password"] {
  border: 1px solid #ddd;
  margin-bottom: 10px;
  padding: 5px;
  width: 300px;
}
input[type="submit"] {
  
  background-color: #a3a5af; /* Green */
    border: none;
    color: white;
    padding: 8px 50px;
	font-family: "Times New Roman", Times, serif;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin-top:20px;
    margin-left:20px;
}
.button{
	background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
.addpart table tr td button{
	background-color: #4CAF50; /* Green */
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
	int num = 0;
	%>
	<div class="main">
		<div class="starting">
			<h2>Admin Pannel - Question Adding</h2>
			<hr></hr>
		</div>
		<div class="addpart">
			<form name="form" action="addques" method="post">
			<table align="center">
			<%
			try{
				conn = DBConnection.createConnection();
				String sql = "SELECT MAX(QuesNo) FROM tbl_question";
				//String sql = "select last (QuesNO) from tbl_question order by QuesNO";
				pst = conn.prepareStatement(sql);
				rs = pst.executeQuery();
				while(rs.next()){
					int maxv = rs.getInt("MAX(QuesNo)");		
			%>
			
				<tr>
					<td>Question No </td>
					<td>: </td>
					<td><input type="text"name="quesno" value=<%=maxv+1%>></td>
				</tr>
				<tr>
					<td>Exam Id </td>
					<td>: </td>
					<td><input type="text" name="examid" placeholder="Enter the Exam id(CSE, EEE, English...)" required ></td>
				</tr>
				<tr>
					<td>Question Label </td>
					<td>: </td>
					<td><input type="text" name="qlabel" placeholder="Enter the question label(Easy, Medium, Hard)..." required ></td>
				</tr>
				<tr>
					<td>Question </td>
					<td>: </td>
					<td>
						<input type="text" name="ques" placeholder="Enter the question..." required >
					</td>
				</tr>
				<tr>
					<td>Choice One</td>
					<td>: </td>
					<td><input type="text" name="ans1" placeholder="Enter option one..." required></td>
				</tr>
				<tr>
					<td>Choice Two</td>
					<td>: </td>
					<td><input type="text" name="ans2" placeholder="Enter option Two..." required></td>
				</tr>
				<tr>
					<td>Choice Three</td>
					<td>: </td>
					<td><input type="text" name="ans3" placeholder="Enter option Three..." required></td>
				</tr>
				<tr>
					<td>Choice Four</td>
					<td>: </td>
					<td><input type="text" name="ans4" placeholder="Enter option Four..." required></td>
				</tr>
				<tr>
					<td>Correct Ans. No. </td>
					<td>: </td>
					<td><input type="number" name="correctans"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit" value="Add a question" name="button"></td>
				</tr>
			<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
				<tr>
					<td><%=(request.getAttribute("SUCCESS") == null) ? "": request.getAttribute("SUCCESS")%></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>