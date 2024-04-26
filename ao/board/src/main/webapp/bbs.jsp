<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>    
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

</head>
<body>
<% 
	int pageNumber =1; 
if(request.getParameter("pageNumber")!= null){
	pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
}
%>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<% 
				BbsDAO bbsDAO = new BbsDAO();
				ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
				for (int i=0; i<list.size() ; i++){
				%>
				<tr>
					<td><%= list.get(i).getBbsID() %></td>
					<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"> <%= list.get(i).getBbsTitle() %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>					
				</tr>
				<%
					}
				%>
			</tbody>					
		    </table>
		    <% 
		    	if(pageNumber != 1){
		    %>
		    	<a herf="bbs.jsp?pageNumber=<%= pageNumber -1%>" class="btn btn-success btn-arraw-left">이전</a>
		    <%	
		    	} if(bbsDAO.nextPage(pageNumber)){
		    %>
		    	<a herf="bbs.jsp?pageNumber=<%= pageNumber +1%>" class="btn btn-success btn-arraw-left">다음</a>
		    
		    <%
		    	}
		    %>
		    <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
</body>
</html>