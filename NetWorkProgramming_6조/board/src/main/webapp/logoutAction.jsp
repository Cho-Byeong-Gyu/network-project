<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
</head>
<body>

<%
if (session.getAttribute("ID") != null) {
    session.removeAttribute("ID"); // 세션에서 userID 제거
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그아웃 되었습니다.')");
    script.println("location.href = 'login.jsp'");
    script.println("</script>");
} else {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인 상태가 아닙니다.')");
    script.println("location.href = 'login.jsp'");
    script.println("</script>");
}
%>

</body>
</html>
