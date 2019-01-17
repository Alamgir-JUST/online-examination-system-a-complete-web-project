<%@page import="com.model.idlabelmodel"%>
<%@page import="com.model.adminloginmodel"%>
<%@page import="com.model.loginmodel"%>
<%@page import="com.simplejava.random_first_function"%>
<%@page import="com.simplejava.random_2nd_function"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to online exam-Start from here</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.heading h1{
		background: #f4f4f4 none repeat scroll 0 0;
	    font-family: "Times New Roman", Times, serif;
	  	box-shadow: 2px 2px 0 1px #999;
	  	color: #010002;
	  	margin: 10px auto 25px;
	  	padding: 4px;
	  	text-align: center;
	  	width: 620px;
	}
	.menu p{
		font-size:25px;
		background: #939cc8;
		text-align:center;
	}
	.menu a{
	display:block;
	text-decoration: none;
	color: white;
	}
	.menu a:hover{
	 background-color: #111111;
	}
	.information{
		text-align:center;
		font-size:25px;
		 font-family: "Times New Roman", Times, serif;
	}
</style>
<%@include file="hdprtr/header.jsp" %>
<body>
 <% 
 ArrayList<Integer> mylst = new ArrayList<Integer>();
 ArrayList<Integer> finallst = new ArrayList<Integer>();


 Random random = new Random();
 Connection conn = null;
 PreparedStatement pst = null;
 ResultSet rs = null;
 %>
<%
String name = loginmodel.getUname();
String eid = idlabelmodel.getId();
String elbl = idlabelmodel.getModel();
String nques = idlabelmodel.getQuesno();

int qnn = Integer.parseInt(nques);
int qn = qnn+1;
int vv = 1;
//out.println(name+""+eid+""+elbl+"");
%>
	<%
	try{
	conn = DBConnection.createConnection();
	String sql = "select QuesNo,Ques from tbl_question where examid=? and qlabel=?";
	pst = conn.prepareStatement(sql);
	pst.setString(1, eid.toLowerCase());
	pst.setString(2, elbl.toLowerCase());
	
	rs = pst.executeQuery();
	
	while(rs.next()){
		mylst.add(rs.getInt("QuesNo"));
	}
	
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<%
	ArrayList<Integer> flag = new ArrayList<Integer>();
	for(int i=0; i<mylst.size(); i++) {
		flag.add(0);
	}
	int i = 0;
	while(i<qn) {
		int index = random.nextInt(mylst.size()); // array size
		if(random_2nd_function.idCheck(flag, index)) {
			flag.set(index, 1);
			finallst.add(mylst.get(index));
			i++;
		}
		
		if(random_first_function.check(flag, mylst.size())) {
			//System.out.println("No elements in the array");
			break;
		}
		else {
			continue;
		}
		
	}
	%>
	<%
		try{
			conn=DBConnection.createConnection();
			String sq="insert into tbl_category_question values(?,?,?)";
			pst=conn.prepareStatement(sq);
			for(int k=0;k<qn;k++){
				pst.setInt(1, k+1);
				pst.setInt(2, finallst.get(k));
				pst.setString(3, name);
				pst.executeUpdate();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<%
		try{
			conn=DBConnection.createConnection();
			String sq="insert into tbl_selected_question values(?,?,?,?,?)";
			pst=conn.prepareStatement(sq);
			for(int k=0;k<qn;k++){
				pst.setInt(1, k+1);
				pst.setInt(2, finallst.get(k));
				pst.setString(3, name);
				pst.setString(4, eid);
				pst.setString(5, elbl);
				pst.executeUpdate();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<div class="main">
	
		<div class="heading">
			<h1>Start Exam from here!!!!!</h1>
		</div>
		<div class="information">
			<h2>Exam information for you...</h2>
			<p>Your userName : <%=name%></p>
			<p>Exam Type : Multiple Choice</p>
			<p>Exam ID/Subject : <%=eid%></p>
			<p>Exam Label : <%=elbl%></p>
			<p>Total Question : <%=nques%></p>
			
			<p>You will get one marks for each Question</p>
			<p>You will get only 60 seconds for each Question</p>
		</div>
		<% 
	try{ 		
	conn = DBConnection.createConnection();
	String sql ="SELECT * FROM tbl_category_question";
	pst = conn.prepareStatement(sql);
	rs = pst.executeQuery();
	
	while(rs.next()){
	%>
	<div class="menu">
			<p><a href='teststart.jsp?q=<%=rs.getString("Qid")%>'>StartTest</a></p>
	</div>
	<%
	break;
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</div>
</body>
</html>
<%@include file="footer.jsp"%>