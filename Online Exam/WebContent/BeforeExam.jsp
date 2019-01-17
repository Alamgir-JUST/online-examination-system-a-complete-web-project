<%@page import="com.model.loginmodel"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to this online examination</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
.main{
	text-align:center;
	
}
.main p{
	font-size:25px;
}
.heading h3{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 680px;
}
.main h2{
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
</style>
<%@include file="hdprtr/header.jsp" %>
<body>
<%
	if(loginmodel.getUname()==null){
		out.println("Please Login");
		response.sendRedirect("index.jsp");
	}

%>
<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
%>
<div class="main">
<h2>Welcome : <%=loginmodel.getUname()%></h2>
<div class="heading">
	<h3>Welcome to this Online Exam - Start Now</h3>
	<p>Exam type-Multiple choice</p>
	
	<form action="BeforeStartServ" method="Post">
	<%
    try{
		conn = DBConnection.createConnection();
		String sql = "select distinct examid from tbl_question";	
		pst = conn.prepareStatement(sql);
       	rs = pst.executeQuery();
%>

	
		<table align="center">
    <tr>
    <td><p>Select ExamId/Subject</p></td>
    <td><p> : </p></td>
    <td><p>
        <select name="exameid">
        <%  
        while(rs.next())
        { 
        %>
            <option><%= rs.getString("examid")%></option>
            
        <% 
        } 
        %>
        </select>
        </p>
        </td>
        </tr>
       

<%
        }
        catch(Exception e)
        {
             e.printStackTrace();
        }
%>
<%
    try{
		conn = DBConnection.createConnection();
		String sql = "select distinct qlabel from tbl_question";	
		pst = conn.prepareStatement(sql);
       	rs = pst.executeQuery();
%>

	
		
    <tr>
    <td><p>Select examid</p></td>
    <td><p> : </p></td>
    <td><p>
        <select name="examlabel">
        <%  
        while(rs.next())
        { 
        %>
            <option><%= rs.getString("qlabel")%></option>
            
        <% 
        } 
        %>
        </select>
        </p>
        </td>
        </tr>

<%
        }
        catch(Exception e)
        {
             e.printStackTrace();
        }
%>
	<tr>
		<td><p>Select number of Question</td>
		<td><p> : </p></td>
		<td>
			<p>
				<select name="NoofQues">
					<option>5</option>
					<option>10</option>
					<option>20</option>
					<option>50</option>
					<option>100</option>
					<option>150</option>
					<option>200</option>
				</select>
			</p>
		</td>
	</tr>
			
	<tr>
		<td><p><input type="submit" value="Goto Exam Starting Page"/></p></td>
	
	</tr>
	</table>
	</form>
	</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>