<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="mycss/header.css">
</head>
<style>
	.main{
		font-family: "Times New Roman", Times, serif;
		
	}
	.imagepart img{
		width:100%;
	}
	.menu{
		margin-bottom:50px;
		font-size:20px;
	}
	.menu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:#2e3644
}

.menu ul li {
    float: left;
}

.menu ul li a {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
    font-family: "Times New Roman", Times, serif;
}

.menu ul li a:hover {
    background-color: #111111;
}
</style>
<body>
	<div clas="main">
		<div class="imagepart">
			<img src="image/banner.png">
		</div>
		<div class="menu">
			<ul>
				<li><a href="index.jsp"><img src="image/home.png" height="20px" width="20px">Home</a></li>
				<li><a href="Register.jsp">Register</a></li>
				<li><a href="BeforeExam.jsp">Exam</a></li>
				<li><a href="showNews.jsp">NewsFeed</a></li>
				<li><a href="profile.jsp">Profile</a></li>
				<li><a href="contactpage.jsp">ContactUs</a></li>
				<li><a href="logout.jsp">LogOut</a></li>				
			</ul>
		</div>	
	</div>
	
</body>
</html>