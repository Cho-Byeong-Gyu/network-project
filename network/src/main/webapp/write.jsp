<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class= "form-control" placeholder="글 제목" name= "bbsTitle" maxlength= "50"></td>					
				</tr>
				<tr>
					<td><textarea class= "form-control" placeholder="글 내용" name= "bbsContent" maxlength= "2048"></textarea></td>
				</tr>		
			</tbody>					
		    </table>
		    <input type= "submit" class= "btn btn-primary pull-right" value= "글쓰기">
		</form>
		</div>
	</div>
</body>