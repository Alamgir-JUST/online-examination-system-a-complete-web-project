<%@page import="com.model.adminloginmodel"%>
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
<title>Welcome to Admin-Pannel</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>

<style>

	.fpart h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
	}
	input[type="submit"]{
	background-color: ; /* Green */
    border: none;
    color: black;
    /*padding: 15px 32px;*/
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
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
	<div class="fpart">
	<h2 align="center">Admin Pannel- Message from User</h2>
	</div>
	<table align="center" name="mytbl" border="1" width="100%">
	<tr bgcolor="#76787b">
	<td align="center"><b>Name</b></td>
	<td align="center"><b>Email</b></td>
	<td align="center"><b>Mobile</b></td>
	<td align="center"><b>Message</b></td>
	</tr>
	<%
	try{ 
		
	conn = DBConnection.createConnection();
	String sql ="SELECT * FROM user_msg order by id desc";
	pst = conn.prepareStatement(sql);
	rs = pst.executeQuery();
	
	while(rs.next()){
	%>
	<tr>	
	<td><%=rs.getString("Name") %></td>
	<td><%=rs.getString("Email") %></td>
	<td><%=rs.getString("Mobile") %></td>
	<td><%=rs.getString("Message") %></td>		
	</tr>	
	<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table>	
</body>
<%@include file="footer.jsp" %>
</html>
