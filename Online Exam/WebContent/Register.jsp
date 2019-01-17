<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Online Examination</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
<script>
//Validation start---------

function validate(){
	var name = document.form.name.value;
	var uname = document.form.uname.value;
	var pass = document.form.pass.value;
	var repass = document.form.repass.value;
	var email = document.form.email.value;
	var sub = document.form.subject.value;
	var univer = document.form.university.value;
	
	
	
	if(name==null || name==""){
		alert("Name can't blank");
		return false;
	}
	if(uname==null || uname==""){
		alert("UserName can't blank");
		return false;
	}
	if(pass.length<6){
		alert("Password length more than 6 characters");
		return false;
	}
	if(pass.localeCompare(repass)!=0){
		alert("Password not matched!!!!");
		return false;
	}
	//Email Validation start
	var x = document.form.email.value;
	var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
	//Email validation finish
}
</script>

<link rel="stylesheet" type="text/css" href="CSS/register.css" >
</head>
<%@include file="hdprtr/header.jsp" %>
<style>
.main{
	min-height:25px;
}
	.first h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 780px;
	}
	.bparttwo{
		
	}
	.footer{
		margin-top:500px;
	}
	.firstpart{
		text-align:center;
		float:left;
		width:46%;
		min-height:100px;
		border-radius: 25px;
	    background: ;
	    border:1px solid black;
	    padding: 20px; 
	    height: 390px;
	    font-size:16px;
	}
	.secondpart{
	margin-top:20px;
		float:right;
		width:50%;
		min-height:100px;
		border-radius: 25px;
	    background: ;
	    border:1px solid black;
	    padding: 20px; 
	    height: 390px; 
	    font-size:16px;
	}
	.footer{

	}
input[type="text"], input[type="password"] {
	background-color: ; /* Green */
    padding: 6px 140px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

input[type="submit"],input[type="reset"]{
	background-color: #a3a5af; 
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
    margin-left:90px;
}
</style>
<body>

<div class="main">
	<div class="first">
		<h2>Online Examination System-User Registration Form</h2>
	</div>
	<div class="bparttwo">
	
	<div class="firstpart">
		
		<img src="image/register.png" height="390px" width="500px">
	</div>
	<div class="secondpart">
	<form name="form" action="RegServ" method="post" onsubmit="return validate()">
		<table align="center">
		<tr>
		<td>Name : </td>
		<td><input type="text" name="name"/> </td>
		</tr>
		
		<tr>
		<td>Username : </td>
		<td><input type="text" name="uname"/> </td>
		</tr>
		
		<tr>
		<td>Password : </td>
		<td><input type="password" name="pass"/> </td>
		</tr>
		
		<tr>
		<td>Retype Pass : </td>
		<td><input type="password" name="repass"/> </td>
		</tr>
		
		<tr>
		<td>Email : </td>
		<td><input type="text" name="email"/> </td>
		</tr>
		
		<tr>
		<td>Subject : </td>
		<td><input type="text" name="subject"/> </td>
		</tr>
		
		<tr>
		<td>University : </td>
		<td><input type="text" name="university"/> </td>
		</tr>
		</table>
		<table>
		<tr>
		<td><input type="submit" value="Signup"/> </td>
		<td><input type="reset" value="Reset"/> </td>
		</tr>
		</table>
		<p align="center">Already Registered??<a href="index1.jsp">Login </a>Here</p>
	</form>
	</div>
	</div>
	<div class="footer">
	
	</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>

