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
<title>Welcome to online examination news feed</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
 <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="css/footer1.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/footer2.css" rel="stylesheet">
</head>
<style>
body{
	width:100%;
	margin: 0px auto; 
}

.sec1{
	padding: 25px;
	color:white;
	margin: 5px auto;
	float: left;
	width: 320px;
	background-color: #186772;
	border:2px solid black;

}

.sec2{
	padding-left: px;
	margin-top: 33px;
	margin-left: 330px;
	background:#EBEDEF;
	border:2px solid black;
	min-height:40px;
	margin-bottom:10px
	
}
.main h1{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 680px;
	}
	.sec1 h1{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	padding: 4px;
  	text-align: left;
  	width: 250px;
	}
	input[type="submit"]{
	background-color: #a3a5af; 
    border: none;
    color: white;
    padding: 6px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style>
<%@include file="hdprtr/header.jsp"%>
<body>
<%
	int i=0;
	int j=0;
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	%>
	<div class="main">
	<h1>Online Exam- News Feed</h1>
		<div class="sec1">	
		<form action="result.jsp" method="post">
		<table>
				<tr>
				<td>ExamId</td>
				<td>: </td>
				<td><input type="text" placeholder="Subject" name="examid"/></td>
				</tr>
				<tr>
				<td>ExamLabel</td>
				<td>: </td>
				<td><input type="text" placeholder="Label" name="examlabel"/></td>
				</tr>
			
		</table>
		<table>
			<tr>
				<td><input type="submit" value="Search Result"/></td>
			</tr>
		</table>
	</form>
		<h1>Highest Scorer</h1>
		<table align="center" name="mytbl" border="1" width="100%">
		<tr bgcolor="#76787b">
			<td align="center"><b>Position</b></td>
			<td align="center"><b>UserName</b></td>
			<td align="center"><b>ExamId</b></td>
			<td align="center"><b>ExamLabel</b></td>
		</tr>
		<% 
			try{
		    	
		    	conn = DBConnection.createConnection();
		    	String sql = "select * from user_marks order by Total_Mark desc";
		    	pst = conn.prepareStatement(sql);
		
		    	rs = pst.executeQuery();
				
		    	while(rs.next()){
		    		%>
		    		<tr>
		    		<td align="center"><b><%=i+1%></b></td>	
		    		<td align="center"><b><%=rs.getString("UserName")%></b></td>
		    		<td align="center"><b><%=rs.getString("QId") %></b></td>
		    		<td align="center"><b><%=rs.getString("Examlabel")%></b></td>	
		    		</tr>	    		
		    		<% 
		    		i=i+1;
		    		
		    		if(i==20){
		    			break;
		    		}
		    	}
		    	}catch(Exception e){
		    		e.printStackTrace();
		    		
		    	}
		%>
		</table>
		</div>
		
		<div class="sec2">
			<%
	
	try{
	conn = DBConnection.createConnection();
	String sql = "select NHead,NText from news order by NNo desc";
	pst = conn.prepareStatement(sql);
	rs = pst.executeQuery();
	
	while(rs.next()){
		%>
		<h3><%=rs.getString("NHead")%></h3>
		<p><%=rs.getString("NText") %></p>
	<% 
	
	j = j+1;
	if(j==7){
		break;
	}
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	
		</div>
	</div>
	<div class="footer">
		<div class="sooter">
		<!--Footer-->
<footer class="page-footer font-small unique-color-dark pt-0">

    <div style="background-color: #2e3644;">
        <div class="container">
            <!--Grid row-->
            <div class="row py-4 d-flex align-items-center">

                <!--Grid column-->
                <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                    <h6 class="mb-0 white-text">Get connected with us on social networks!</h6>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-6 col-lg-7 text-center text-md-right">
                    <!--Facebook-->
                    <a class="fb-ic ml-0" href="https://www.facebook.com/computersoftwaresolution/">
                        <i class="fa fa-facebook white-text mr-lg-4"> </i>
                    </a>
                    <!--Twitter-->
                    <a class="tw-ic" href="https://www.facebook.com/computersoftwaresolution/">
                        <i class="fa fa-twitter white-text mr-lg-4"> </i>
                    </a>
                    <!--Google +-->
                    <a class="gplus-ic" href="https://www.facebook.com/computersoftwaresolution/">
                        <i class="fa fa-google-plus white-text mr-lg-4"> </i>
                    </a>
                    <!--Linkedin-->
                    <a class="li-ic" href="https://www.facebook.com/computersoftwaresolution/">
                        <i class="fa fa-linkedin white-text mr-lg-4"> </i>
                    </a>
                    <!--Instagram-->
                    <a class="ins-ic" href="https://www.facebook.com/computersoftwaresolution/">
                        <i class="fa fa-instagram white-text mr-lg-4"> </i>
                    </a>
                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->
        </div>
    </div>

    <!--Footer Links-->
    <div class="container mt-5 mb-4 text-center text-md-left">
        <div class="row mt-3">

            <!--First column-->
            <div class="col-md-3 col-lg-4 col-xl-3 mb-4">
                <h6 class="text-uppercase font-weight-bold">
                    <strong>Computer Solution</strong>
                </h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>Here you can find all kinds of solution for computer
                 problem and any kinds of education help, You can also test your knowledge.
                </p>
            </div>
            <!--/.First column-->

            <!--Second column-->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                <h6 class="text-uppercase font-weight-bold">
                    <strong>Products</strong>
                </h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <a href="#!">Online Examination</a>
                </p>
                <p>
                    <a href="#!">Online Examination</a>
                </p>
                <p>
                    <a href="#!">Online Examination</a>
                </p>
                <p>
                    <a href="#!">Online Examination</a>
                </p>
            </div>
            <!--/.Second column-->

            <!--Third column-->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                <h6 class="text-uppercase font-weight-bold">
                    <strong>Useful links</strong>
                </h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <a href="#!">Alamgir Hossain</a>
                </p>
                <p>
                    <a href="#!">Alamgir Hossain</a>
                </p>
                <p>
                    <a href="#!">Alamgir Hossain</a>
                </p>
                <p>
                    <a href="#!">Alamgir Hossain</a>
                </p>
            </div>
            <!--/.Third column-->

            <!--Fourth column-->
            <div class="col-md-4 col-lg-3 col-xl-3">
                <h6 class="text-uppercase font-weight-bold">
                    <strong>Contact</strong>
                </h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <i class="fa fa-home mr-3"></i> Jessore, Bangladesh</p>
                <p>
                    <i class="fa fa-envelope mr-3"></i> alamgir.cse14.just@gmail.com</p>
                <p>
                    <i class="fa fa-phone mr-3"></i>+8801767130845</p>
                <p>
                    <i class="fa fa-print mr-3"></i>+8801922460133</p>
            </div>
            <!--/.Fourth column-->

        </div>
    </div>
    <!--/.Footer Links-->

    <!-- Copyright-->
    <div class="footer-copyright py-3 text-center" style="background-color: #0e1523;">
        © 2018 Copyright:
        <a href="https://www.facebook.com/computersoftwaresolution/">
            <strong> Education help</strong>
        </a>
    </div>
    <!--/.Copyright -->

</footer>
<!--/.Footer-->
	</div>
	</div>
</body>
</html>
