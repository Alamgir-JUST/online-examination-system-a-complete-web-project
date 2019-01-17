<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 	Connection conn = null;
 	PreparedStatement pst = null;
 	ResultSet rs = null;
 	int i=0;
 	
 	String s1 = request.getParameter("examid");
 	String s2 = request.getParameter("examlabel");
 	//out.println(s1+" "+s2);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Total Result</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.main h2{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 680px;
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
<body>
	<div class="main">
		<h2>Online Examination - Result Summary</h2>
		<div class="res">
			<table align="center" name="mytbl" border="1" width="100%">
		<tr bgcolor="#76787b">
			<td align="center"><b>Position</b></td>
			<td align="center"><b>UserName</b></td>
			<td align="center"><b>ExamId</b></td>
			<td align="center"><b>ExamLabel</b></td>
			<td align="center"><b>Marks</b></td>
		</tr>
		<% 
			try{
		    	
		    	conn = DBConnection.createConnection();
		    	String sql = "select * from user_marks where QId=? and Examlabel=? order by Total_Mark desc";
		    	pst = conn.prepareStatement(sql);
				pst.setString(1, s1.toLowerCase());
				pst.setString(2, s2.toLowerCase());
		    	rs = pst.executeQuery();
				
		    	while(rs.next()){
		    		%>
		    		<tr>
		    		<td align="center"><b><%=i+1%></b></td>	
		    		<td align="center"><b><%=rs.getString("UserName")%></b></td>
		    		<td align="center"><b><%=rs.getString("QId") %></b></td>
		    		<td align="center"><b><%=rs.getString("Examlabel")%></b></td>
					<%
						String s = rs.getString("Total_Mark");
						int mark = Integer.parseInt(s);
						int marks = mark-1;
					%>
		    		<td align="center"><b><%=marks%></b></td>
		    			
		    		</tr>	    		
		    		<% 
		    		i=i+1;
		    	}
		    	}catch(Exception e){
		    		e.printStackTrace();
		    		
		    	}
		%>
		</table>
		
		</div>
		<h2><input type="submit" value="Download PDF" name="download" onclick="window.print()" /></h2>
	</div>
</body>
</html>