<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
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
		ArrayList<Integer> arrlist = new ArrayList<Integer>();
		
		Random rn = new Random();
		
		for(int i=0;i<20;i++){
			arrlist.add(i);
		}
		
		for(int i=0;i<arrlist.size();i++){
			out.println(rn.nextInt());
		}
	
	%>
</body>
</html>