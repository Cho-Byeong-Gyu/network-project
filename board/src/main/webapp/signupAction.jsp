<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="ID" param="ID_Input"/>
<jsp:setProperty name="user" property="PW" param="PW_Input"/>
<jsp:setProperty name="user" property="name" param="name_Input"/>
<jsp:setProperty name="user" property="age" param="age_option"/>
<jsp:setProperty name="user" property="gender" param="gender_option"/>
<jsp:setProperty name="user" property="introduction" param="introduction"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 중...</title>
</head>
<body>

<%  	
if (false) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력되지 않은 항목이 있습니다.')");
	script.println("history.back()");
	script.println("</script>");	
}else{
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.signup(user);
	
	System.out.println(request.getParameter("ID_Input"));
	System.out.println(request.getParameter("PW_Input"));
	System.out.println(request.getParameter("name_Input"));
	System.out.println(request.getParameter("age"));
	System.out.println(request.getParameter("gender"));
	System.out.println(request.getParameter("introduction"));
	
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");	
	} else{
		session.setAttribute("userID", user.getID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");	
	}
}
%>
</body>
</html>