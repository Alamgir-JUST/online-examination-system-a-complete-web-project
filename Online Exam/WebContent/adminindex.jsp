<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="indexcss.css">
<title>Welcome to Online Examination Admin Pannel</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.mainstrt{
		min-height: 400px;	
	}
	.mainstrt h1{
		background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
	}
	.mainstrt hr { 
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0;
}
	.adminpanel{
		width:500px;
		color:#897073;
		margin:30px auto 0;
		padding:50px;
		border:2px solid #ddd;
		font-family: "Times New Roman", Georgia, Serif;
		font-size: 20px;
		}
		
</style>
<body>
<%@include file="headerfooter/header.jsp" %>
	<div class="mainstrt">
	<h1>Admin Panel</h1>
	<hr></hr>
		<div class = "adminpanel">
			<h2>Welcome to Control Admin Panel</h2>
			<p>You can manage User and Online Exam from here.......</p>
		</div>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>