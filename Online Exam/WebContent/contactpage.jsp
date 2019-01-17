<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to user contact form</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<%@include file="hdprtr/header.jsp" %>
<style>
.main{
	font-family: "Times New Roman", Times, serif;
}
.container h1{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 680px;
}
.left{
	width:60%;
	float:left;
	height:350px;
	border-radius: 25px;
    border:2px solid blue;
}
.left iframe{
	height:350px;
}
.right{
	width:38%;
	float:right;
	height:350px;
	background: #f4f4f4 none repeat scroll 0 0;
	border-radius: 25px;
    border:1px solid blue;
}
input[type="text"]{
	background-color: ; /* Green */
    padding: 6px 85px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: left;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

input[type="submit"],input[type="reset"]{
	background-color: #4CAF50; /* Green */
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
textarea{
	background-color: ; /* Green */
    border-radius: 25px;
    border:1px solid blue;
    text-align: left;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
.right h2{
	
}
.footer{
	margin-top:430px;
}
</style>
<body>
<div class="main">
  <div class="container">
      <h1><strong>Contact Us</strong></h1>
    </div>
	
	<div class="left">
        <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d3736489.7218514383!2d90.21589792292741!3d23.857125486636733!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1506502314230" width="100%" height="315" frameborder="0" style="border:0" allowfullscreen></iframe>
      </div>

      <div class="right">
          <h2><strong>Get in Touch</strong></h2>
        <form action="ContactServ" method="Post">
          <table>
          <tr>
           <td> <input type="text" name="name" placeholder="Name" size=""/></td>
           </tr>
          <tr>
           <td> <input type="text" name="email" placeholder="E-Mail"/></td>
           </tr>
          <tr>
           	<td> <input type="text" name="mobile" placeholder="Mobile"/></td>
           </tr>
          <tr>
           <td> <textarea rows="4" cols="38" name="message" placeholder="Your Message....."></textarea></td>
           </tr>
           <tr>
          <td><input type="submit" value="Submit"/></td>
          </tr>
          </table>
        </form>
    </div>
  </div>
<div class="footer">
<%@include file="footer.jsp" %>
</div>
</body>

</html>
