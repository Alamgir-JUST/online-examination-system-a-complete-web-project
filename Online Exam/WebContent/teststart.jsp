<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.model.loginmodel"%>
<%@page import="com.model.idlabelmodel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to online exam-Your exam is running</title>
<link rel="icon" 
      type="image/png" 
      href="image/title.png">
</head>
<style>
	.main{
		text-align:center;
		text-size:20px;
	}
	.noques h1{
	background: #f4f4f4 none repeat scroll 0 0;
    font-family: "Times New Roman", Times, serif;
  	box-shadow: 2px 2px 0 1px #999;
  	color: #010002;
  	margin: 10px auto 25px;
  	padding: 4px;
  	text-align: center;
  	width: 680px;
	}
	.formpart{
		align:center;
		text-align:center;
	}
	input[type="submit"]{
	background-color: #a3a5af; 
    border: none;
    color: #7f0e16;
    padding: 8px 50px;
    border-radius: 25px;
    border:1px solid blue;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
}
.marqueemsg{
	margin-bottom:20px;
}
input[type="radio"]{
	width:25px;
	height:25px;
	margin-right:20px;
	margin-top:10px;
}
.formpart h2{
	color:#000000;
	
}
</style>
<%@include file="hdprtr/header.jsp"%>

<body>
<%
	ArrayList<String> mylst = new ArrayList<String>();
	String id = request.getParameter("q");
	String quesno = id;
	int qn = Integer.parseInt(id);
	int j = qn;
	int aa=0;
	int xx=1;
	int ck=0;
	String examid = idlabelmodel.getId();
	String examlabel = idlabelmodel.getModel();
	String titalques = idlabelmodel.getQuesno();
	int total_question = Integer.parseInt(titalques);
	String username = loginmodel.getUname();
	
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	//out.println(examid+" "+examlabel+" "+" "+total_question+" "+username);
	
	%>
	<div class="main">
	<div id="countdown"></div>
<div id="notifier"></div>
<script type="text/javascript">
(function () {
  function display( notifier, str ) {
    document.getElementById(notifier).innerHTML = str;
  }
  display("notifier", "Your Remaining Time for This Question"); 
  function toMinuteAndSecond( x ) {
    return Math.floor(x/60) + ":" + (x=x%60 < 10 ? 0 : x);
  }
 
  function setTimer( remain, actions ) {
    var action;
    (function countdown() {
       display("countdown", toMinuteAndSecond(remain));
       if (action = actions[remain]) {
         action();
       }
       if (remain > 0) {
         remain -= 1;
         setTimeout(arguments.callee, 1000);
       }
    })(); // End countdown
  }
 
  setTimer(60, {
    10: function () { display("notifier", "Just 10 seconds to go"); },
     5: function () { display("notifier", "5 seconds left");        },
     0: function () { display("notifier", "Time is up baby");       }
  });
})();
 
</script>

	<div class="marqueemsg">
		<marquee style="font-family:Times New Roman; color: #FFFFFF" bgcolor="#4e4e76" scrolldelay=""><h3>Hellow <%=username%>!!!! your exam is running. Please select your answer and click submit & next question.</h3></marquee>
		
	</div>
	<div class="noques">
		<h1>Question <%=qn%> of <%=total_question%></h1>
	</div>
	<div class="formpart">
	<form id="myform" name="myform" action='teststart.jsp?q=<%=j+1%>' method="post">
		<table align="center">
			<tr style="color:#340d12;">
			<%
			try{
				conn = DBConnection.createConnection();
				String qrr = "select Ques from v_selected_question where Qid=? and UserName=? and examid=? and qlabel=?";
				pst = conn.prepareStatement(qrr);
				pst.setInt(1, qn);
				pst.setString(2, username);
				pst.setString(3, examid);
				pst.setString(4, examlabel);
				rs = pst.executeQuery();
				
				while(rs.next()){
					%>
					<td colspan="3" >
					<h2>Ques <%=qn%> : <%=rs.getString("Ques") %></h2>
					</td>
				<% 
				}
			}catch(Exception e){
				e.printStackTrace();
			}
				
			%>
					
			</tr>
				<%
				int z=j;
			try{
				
			conn= DBConnection.createConnection();
			String sql = "select Ans from v_selected_answer where Qid = ? and UserName=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, z);
			pst.setString(2, username);
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				mylst.add(aa, rs.getString("Ans"));
				aa = aa+1;
			}
			}catch(Exception e){
				e.printStackTrace();
				
			}
			%>
			<tr style="color:#d6572b;">
			<td><h3><input type="radio"  name="rads" value="1"/><%=mylst.get(0) %></h3></td>
			</tr>
			<tr style="color:#3e31b4;">
			<td><h3><input type="radio" name="rads" value="2"/><%=mylst.get(1) %></h3></td>
			</tr>
			<tr style="color:#b431af;">
			<td><h3><input type="radio" name="rads" value="3"/><%=mylst.get(2) %></h3></td>
			</tr>
			<tr style="color:#b4313b;">
			<td><h3><input type="radio" name="rads" value="4"/><%=mylst.get(3) %></h3></td>
			</tr>	
						<script>
				setTimeout(function() {
					window.location.href = 'teststart.jsp?q=<%=j+1%>';
					
					}, 60000);
				
				</script>	
			<tr>
		
			<td><h3><b><input type="submit" value = "Submit & Next Question"/></b></h3></td>
			</tr>
			<%
				if(j>total_question){
					response.sendRedirect("final.jsp");
				}
			%>		
			
			
				
		</table>
	</form>

	</div>
	
	<% 
	int ca=0;
	try{
	conn = DBConnection.createConnection();
	String mq = "select RightAns from v_selected_answer where Qid=? and UserName=?";
	pst = conn.prepareStatement(mq);
	pst.setInt(1, qn-1);
	pst.setString(2, username);
	rs = pst.executeQuery();
	while(rs.next()){
		ca = rs.getInt("RightAns");
	
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>

	<%
            if(request.getParameter("rads") != null) {
                if(request.getParameter("rads").equals("1")) {
                    out.println("Answer number 1 was Submitted.<BR>");
                    ck=1;
                }
                else {
                    //out.println("Radio button 1 was not selected.<BR>");
                }
                if(request.getParameter("rads").equals("2")) {
                    out.println("Answer number 2 was Submitted.<BR>");
                    ck=2;
                }
                else {
                    //out.println("Radio button 2 was not selected.<BR>");
                }
                if(request.getParameter("rads").equals("3")) {
                    out.println("Answer number 3 was Submitted.<BR>");
                    ck=3;
                }
                else {
                    //out.println("Radio button 3 was not selected.<BR>");
                }
                if(request.getParameter("rads").equals("4")) {
                    out.println("Answer number 4 was Submitted.<BR>");
                    ck=4;
                }
                else {
                   // out.println("Radio button 4 was not selected.<BR>");
                }
            }
            else{
            	//out.print("You didn't select any option till now");
            }
	//out.println("Right Answer is : "+ca);
	//out.println("Selected item is : "+ck);
	
	
	if(ca==ck){
		try{
			conn = DBConnection.createConnection();
			String sql = "insert into tbl_userans(QId,QNo,UserName,CheckId) values(?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, examid);
			pst.setInt(2, qn);
			pst.setString(3, username);
			pst.setBoolean(4, true);
			int xxx = pst.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
        %>
</div>
</body>
</html>
<%@include file="footer.jsp"%>