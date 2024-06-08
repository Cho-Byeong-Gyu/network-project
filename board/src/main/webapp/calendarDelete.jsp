<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="calendar.calendarDAO" %>    
<%@ page import="calendar.calendar" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.PreparedStatement" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String schedule_Date = request.getParameter("schedule_Date");
		String schedule_Content = request.getParameter("schedule_Content");
	
	
		calendarDAO calendar = new calendarDAO();
		calendar.Schedule_Delete( schedule_Date, schedule_Content);
	%>
	
<script>
	self.close();
	opener.location.reload();
</script>
</body>
</html>