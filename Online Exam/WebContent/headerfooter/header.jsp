<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online exam admin</title>
</head>
<style>
.main{
	 font-family: "Times New Roman", Times, serif;
}
.menu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:#2e3644
}

.menu li {
    float: left;
}

.menu li a {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}
.imagepart{

}
.imagepart img{
	width:100%;
	height: auto;
}
.menu li a:hover {
    background-color: #111111;
}
</style>
<body>
	<div class="main">
		<div class="imagepart">
			<img src="image/adminbanner.png">
		</div>
		<div class="menu">
			<ul>
				<li><a href="adminlogin.jsp">Home</a></li>
				<li><a href="adminuser.jsp">Manage User</a></li>
				<li><a href="addques.jsp">Add Ques</a></li>
				<li><a href="queslist.jsp">Ques List</a></li>
				<li><a href="addnews.jsp">Add News</a></li>
				<li><a href="usermessageshow.jsp">User Message</a></li>		
				<li><a href="logoutAdmin.jsp">Logout</a></li>
			</ul>
		 </div>
	</div>
</body>
</html>