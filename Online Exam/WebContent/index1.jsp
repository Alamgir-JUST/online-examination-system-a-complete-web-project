<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to this Online Exam</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.main{
		min-height:300px;
		background-color:white;
	}
	.main h1 {
 	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
	}
	.leftpart{
		text-align:center;
		float:left;
		width:46%;
		min-height:100px;
		border-radius: 25px;
		border:2px solid black;
	    background: ;
	    padding: 20px;  
	}
	.rightpart{
		float:right;
		width:46%;
		min-height:100px;
		border-radius: 25px;
		border:2px solid black;
	    background: ;
	    padding: 20px;  
	    text-align:center;
	}
	.rightpart h3{
		align:center;
	}
	
	body {
    background-color: ;
}

</style>
<%@ include file="hdprtr/header.jsp" %>
<body>
<div class="main">
		<h1>Online Exam System- User Login</h1>
	<div class="leftpart">
		<img src="image/login2.png" height="180" width="550">
	</div>
	
	<div class="rightpart">
		<h3><%@ include file="login.jsp" %><h3>
	</div>
</div>
</body>
<%@ include file="footer.jsp" %>

</html>