<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.PrintWriter" %> 
     <%@ page import = "bbs.Bbs" %> 
      <%@ page import = "bbs.BbsDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		int bbsID =0;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));	
		}
		if(bbsID==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">글제목</td>
					<td colspan="2"><%=bbs.getBbsTitle() %></td>
					</tr>
					<tr>
					<td>작성자</td>
					<td colspan="2"><%=bbs.getUserID() %></td>
					</tr>
					<tr>
					<td>작성일자</td>
					<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %>
					</td>
					<tr>
					<td>내용</td>
					<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent() %></td>
					</tr>				
			</tbody>					
		    </table>
		    <a href="bbs.jsp" class= "btn btn-primary">목록</a>
		    <%
		    	if(userID != null && userID.equals(bbs.getUserID())){
		    %>
		    		<a href= "update.jsp?bbsID=<%= bbsID %>" class= "btn btn-primary">수정</a>
		    		<a href= "deleteAction.jsp?bbsID=<%= bbsID %>" class= "btn btn-primary">삭제</a>
		    <%
		    	}
		    %>
		    <a href="chat.jsp?roomID=<%= bbsID %>" class="btn btn-primary">채팅방 입장</a>
		</div>
	</div>
</body>