<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Online Exam Admin Login</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
.main{
	min-height:250px;
}
.main h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
}
.leftside{
		text-align:center;
		margin-top:px;
		float:left;
		width:44%;
		min-height:px;
		border-radius: 25px;
	    background: ;
	    border:1px solid black;
	    padding: 20px; 
	    height: 200px;
}
.rightside{
		text-align:center;
		margin-top:px;
		float:right;
		width:44%;
		min-height:px;
		border-radius: 25px;
	    background: ;
	    border:1px solid black;
	    padding: 20px; 
	    height: 200px;
}
input[type=text]{
	background-color: ; /* Green */
    padding: 8px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
input[type=password]{
	background-color: ; /* Green */
    padding: 8px 51px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    font-color:black;
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
</style>
<%@include file="headerfooter/header.jsp" %>
<body>
<div class="main">
	<h2>Admin pannel - User Login</h2>
	<div class="leftside">
		<h3>Alamgir Hossain</h2>
		<h3>Computer Sciecne & Engineering</h2>
		<h3>Jessore University of science & Technology</h2>
	</div>
	<div class="rightside">
	<form action="adlogserv" method="post">
		<table>
			<tr>
				<td><b>User Name : </b></td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td><b>Password : </b></td>
				<td><input type="password" name="password"></td>
			</tr>
			
		</table>
		<table>
			<tr>
				<td>
				<input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>
	</div>
</div>
</body>

</html>
<%@include file="footer.jsp" %>