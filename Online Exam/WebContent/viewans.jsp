<%@page import="com.model.idlabelmodel"%>
<%@page import="com.model.loginmodel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	ArrayList<String> mylst = new ArrayList<String>();
	int qn =1;
	int k=0;
	int qnn = 1;
	int catch_question_number;
	String username = loginmodel.getUname();
	String examid = idlabelmodel.getId();
	String examlabel = idlabelmodel.getModel();
	
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	Connection conn2 = null;
	PreparedStatement pst2 = null;
	ResultSet rs2 = null;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online-Exam View answer</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.heading h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 620px;
	}
	
	.mbody{
		text-align:center;
	}
	.mbody h2{
		background: #8e9adb none repeat scroll 0 0;
	}
	.mbody h3{
		background: #5369dc none repeat scroll 0 0;
	}
	.mbody p{
		
	}
</style>

<%@include file="hdprtr/header.jsp"%>
<body>

<div class="main">
	<div class="heading">
		<h2>Online Examination-View Correct Answer</h2>
	</div>

	<div class="mbody">
		<%
		int aa = 0;
		try{
			conn = DBConnection.createConnection();
			String sql1 = "select * from v_selected_question_show where UserName=?";
			
			pst = conn.prepareStatement(sql1);
			pst.setString(1, username);
			rs = pst.executeQuery();
			
			while(rs.next()){
				%>
				<h2>Question No. : <%=qnn%></h2>
				<%catch_question_number = rs.getInt("QuesNo");%>
			    <h2>Question : <%=rs.getString("Ques") %><h2>
			    <%
		    int ra = 0;
		    try{
		    	
		    	conn2 = DBConnection.createConnection();
		    	String sq2 = "select Ans,RightAns from tbl_answer where QuesNo=?";
		    	pst2 = conn.prepareStatement(sq2);
		    	pst2.setInt(1, catch_question_number);
		
		    	rs2 = pst2.executeQuery();
		
		    	while(rs2.next()){
		    		mylst.add(aa, rs2.getString("Ans"));
		    		aa = aa+1;
		    		ra = rs2.getInt("RightAns");
		    	}
		    	}catch(Exception e){
		    		e.printStackTrace();
		    		
		    	}
		    for(int i=k;i<=(k+3);i++){
		    	%>
		    	<p><input type="radio" checked="checked"/><%=mylst.get(i)%></p>
		    	<% 
		    }
		    
		    %>
		    <h3>Right Ans is : <%=ra%></h3>
				<%
				k = k+4;
			    qnn = qnn+1;
			    %>
			    <%	
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			%>
	</div>
</div>
</body>
<%@include file="footer.jsp"%>
</html>