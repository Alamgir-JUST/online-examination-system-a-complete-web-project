<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Question from Here</title>
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
<body>
<%@include file="headerfooter/header.jsp" %>
	<div class="main">
		<div class="starting">
			<h2>Admin Pannel - Question Adding</h2>
			<hr></hr>
		</div>
		<%
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String n = request.getParameter("q");
		int no = Integer.parseInt(n);	
		//int no =1;
		%>
		<div class="addpart">
			<form action="" method="post">
			<%
				
				
				conn = DBConnection.createConnection();
				//int no = 1;
				String sql = "select * from tbl_question where QuesNo = '"+no+"'";
				pst = conn.prepareStatement(sql);
				rs = pst.executeQuery();
				while(rs.next()){
			%>
			<table align="center">
				<tr>
					<td>Question No </td>
					<td>: </td>
					<td><input type="text" name="quesno" value=<%=rs.getString("QuesNo") %>></td>
				</tr>
				<tr>
					<td>Question </td>
					<td>: </td>
					<td><input type="text" name="ques" value=<%=rs.getString("Ques")%>></td>
				</tr>
				<tr>
					<td>Choice One</td>
					<td>: </td>
					<td><input type="text" name="ans1" placeholder="Enter option Two..." required></td>
				</tr>
				<tr>
					<td>Choice Two</td>
					<td>: </td>
					<td><input type="text" name="ans2" placeholder="Enter option Two..." required/></td>
				</tr>
				<tr>
					<td>Choice Three</td>
					<td>: </td>
					<td><input type="text" name="ans3" placeholder="Enter option Three..." required/></td>
				</tr>
				<tr>
					<td>Choice Four</td>
					<td>: </td>
					<td><input type="text" name="ans4" placeholder="Enter option Four..." required/></td>
				</tr>
				<tr>
					<td>Correct Ans. No. </td>
					<td>: </td>
					<td><input type="text" name="correctans" placeholder="No of right ans.." required/></td>
				</tr>
				<% 
				}
				%>
				<tr>
					<td colspan="3" align="center"><input type="submit" value="Update the Question" name="button"></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>

<%
	String a = request.getParameter("quesno");
	String b = request.getParameter("ques");
	conn = DBConnection.createConnection();
	if(a!=null && b!=null){
		String q1 = "update tbl_question set QuesNo=?, Ques=? where QuesNo='"+a+"'";
		pst = conn.prepareStatement(q1);
		pst.setString(1, a);
		pst.setString(2, b);
		pst.executeUpdate();		
		response.sendRedirect("queslist.jsp");
		
	}
%>