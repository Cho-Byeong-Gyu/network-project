<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="ID" />
<jsp:setProperty name="user" property="PW" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%  	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(request.getParameter("ID_Input"),request.getParameter("PW_Input"));
	
	System.out.println(request.getParameter("ID_Input"));
	System.out.println(request.getParameter("PW_Input"));
	

	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 성공하셨습니다.')");
		script.println("location.href = 'write.jsp'");
		script.println("</script>");	
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");	
	} else if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");	
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 실패하였습니다. 아이디와 비밀번호를 다시 한 번 확인해주세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");	
	}
	
	
%>
</body>
</html>