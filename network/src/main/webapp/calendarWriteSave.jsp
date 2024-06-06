<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="calendar.calendarDAO" %>    
<%@ page import="calendar.calendar" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>

<%
	String schedule_Date = request.getParameter("schedule_Date");
	String schedule_Content = request.getParameter("schedule_Content");

	System.out.println(schedule_Date);
	System.out.println(schedule_Content);
	
	calendarDAO calendar = new calendarDAO();
	
	calendar.schedule_Save(schedule_Date, schedule_Content);

	 response.sendRedirect("calendar.jsp");
%>	


</body>
</html>