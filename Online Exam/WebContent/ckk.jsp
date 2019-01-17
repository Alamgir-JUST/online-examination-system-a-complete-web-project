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
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
%>
<form action="ckk2.jsp" method="post">
<%
    try{
		conn = DBConnection.createConnection();
		String sql = "select distinct examid from tbl_question";	
		pst = conn.prepareStatement(sql);
       	rs = pst.executeQuery();
%>

	
		<table>
    <tr>
    <td>Select examid : </td>
    <td>
        <select name="exameid">
        <%  
        while(rs.next())
        { 
        %>
            <option><%= rs.getString("examid")%></option>
            
        <% 
        } 
        %>
        </select>
        
        </td>
        </tr>
        </table>

<%
        }
        catch(Exception e)
        {
             e.printStackTrace();
        }
%>

<%
    try{
		conn = DBConnection.createConnection();
		String sql = "select distinct qlabel from tbl_question";	
		pst = conn.prepareStatement(sql);
       	rs = pst.executeQuery();
%>

	
		<table>
    <tr>
    <td>Select examid : </td>
    <td>
        <select name="examlabel">
        <%  
        while(rs.next())
        { 
        %>
            <option><%= rs.getString("qlabel")%></option>
            
        <% 
        } 
        %>
        </select>
        
        </td>
        </tr>
        </table>

<%
        }
        catch(Exception e)
        {
             e.printStackTrace();
        }
%>
<tr>
	<td><input type="submit" value="Enter"></td>
</tr>
   </form>
</body>
</html>